local M = {}

-- Configuration
local config = {
  enabled = vim.env.NVIM_DEBUG ~= nil or false,
  log_dir = vim.fn.stdpath "cache",
  tracers = {
    colorscheme = true,
    lsp = false,
    plugins = false,
    startup = false,
  },
}

---Write lines to a log file
---@param filename string The log filename (without path)
---@param lines string[] Lines to write
local function write_log(filename, lines)
  if not config.enabled then
    return
  end
  local path = config.log_dir .. "/" .. filename
  vim.fn.writefile(lines, path, "a")
end

---Format timestamp
---@return string|osdate
local function timestamp()
  return os.date "%F %T"
end

---Enable colorscheme change tracing
function M.trace_colorscheme()
  if not config.tracers.colorscheme then
    return
  end

  vim.api.nvim_create_autocmd("ColorScheme", {
    group = vim.api.nvim_create_augroup("DebugColorScheme", { clear = true }),
    callback = function(ev)
      local bt = debug.traceback("", 2)
      write_log("colorscheme-trace.log", {
        ("[%s] ColorScheme=%s"):format(timestamp(), ev.match),
        bt,
        "",
      })
    end,
  })

  vim.api.nvim_create_autocmd("VimEnter", {
    once = true,
    group = vim.api.nvim_create_augroup("DebugColorSchemeStartup", { clear = true }),
    callback = function()
      write_log("colorscheme-trace.log", {
        ("[%s] VimEnter colors_name=%s"):format(timestamp(), tostring(vim.g.colors_name)),
        "",
      })
    end,
  })
end

---Enable LSP attachment tracing
function M.trace_lsp()
  if not config.tracers.lsp then
    return
  end

  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("DebugLSP", { clear = true }),
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client then
        write_log("lsp-trace.log", {
          ("[%s] LspAttach: %s (id=%d) to buffer %d"):format(timestamp(), client.name, client.id, args.buf),
          ("  root_dir=%s"):format(tostring(client.config.root_dir)),
          "",
        })
      end
    end,
  })

  vim.api.nvim_create_autocmd("LspDetach", {
    group = vim.api.nvim_create_augroup("DebugLSPDetach", { clear = true }),
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client then
        write_log("lsp-trace.log", {
          ("[%s] LspDetach: %s (id=%d) from buffer %d"):format(timestamp(), client.name, client.id, args.buf),
          "",
        })
      end
    end,
  })
end

---Enable plugin loading time tracking
function M.trace_plugins()
  if not config.tracers.plugins then
    return
  end

  -- Hook into Lazy.nvim events if available
  vim.api.nvim_create_autocmd("User", {
    pattern = "LazyLoad",
    group = vim.api.nvim_create_augroup("DebugPlugins", { clear = true }),
    callback = function(ev)
      write_log("plugin-trace.log", {
        ("[%s] LazyLoad: %s"):format(timestamp(), vim.inspect(ev.data)),
        "",
      })
    end,
  })
end

---Enable startup time profiling
function M.trace_startup()
  if not config.tracers.startup then
    return
  end

  local start_time = vim.loop.hrtime()

  vim.api.nvim_create_autocmd("VimEnter", {
    once = true,
    group = vim.api.nvim_create_augroup("DebugStartup", { clear = true }),
    callback = function()
      local elapsed = (vim.loop.hrtime() - start_time) / 1e6 -- Convert to milliseconds
      write_log("startup-trace.log", {
        ("[%s] Startup completed in %.2f ms"):format(timestamp(), elapsed),
        "",
      })
    end,
  })
end

---Initialize all enabled tracers
function M.setup(opts)
  config = vim.tbl_deep_extend("force", config, opts or {})

  if not config.enabled then
    return
  end

  -- Initialize tracers
  M.trace_colorscheme()
  M.trace_lsp()
  M.trace_plugins()
  M.trace_startup()

  -- Create command to view logs
  vim.api.nvim_create_user_command("DebugLogs", function()
    local log_files = vim.fn.glob(config.log_dir .. "/*-trace.log", false, true)
    if #log_files == 0 then
      vim.notify("No debug logs found in " .. config.log_dir, vim.log.levels.INFO)
      return
    end

    -- Open in a new buffer
    vim.cmd "new"
    vim.cmd "setlocal buftype=nofile bufhidden=wipe noswapfile"
    local lines = { "=== Neovim Debug Logs ===", "" }

    for _, logfile in ipairs(log_files) do
      local content = vim.fn.readfile(logfile)
      table.insert(lines, "--- " .. vim.fn.fnamemodify(logfile, ":t") .. " ---")
      vim.list_extend(lines, content)
      table.insert(lines, "")
    end

    vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
    vim.bo.modifiable = false
  end, { desc = "View debug logs" })

  -- Create command to clear logs
  vim.api.nvim_create_user_command("DebugClear", function()
    local log_files = vim.fn.glob(config.log_dir .. "/*-trace.log", false, true)
    for _, logfile in ipairs(log_files) do
      vim.fn.delete(logfile)
    end
    vim.notify("Debug logs cleared", vim.log.levels.INFO)
  end, { desc = "Clear debug logs" })

  vim.notify("Debug module enabled. Use :DebugLogs to view traces.", vim.log.levels.INFO)
end

return M
