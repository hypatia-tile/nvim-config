return {
  "L3MON4D3/LuaSnip",
  version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  -- install jsregexp (optional!).
  build = "make install_jsregexp",

  config = function()
    local ls = require "luasnip"
    vim.keymap.set({ "i" }, "<C-K><C-K>", function()
      ls.expand()
    end, { silent = true })
    vim.keymap.set({ "i", "s" }, "<C-K><C-L>", function()
      ls.jump(1)
    end, { silent = true })
    vim.keymap.set({ "i", "s" }, "<C-K><C-J>", function()
      ls.jump(-1)
    end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<C-K><C-E>", function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, { silent = true })
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node
    ls.add_snippets("lua", {
      s("mf", {
        t "function(",
        i(1, ""),
        t ")",
        t { "", "  " }, -- newline and indent
        i(2, "-- body"),
        t { "", " end" },
      }),
    })
    ls.add_snippets("all", {
      s("date", {
        t(os.date "%Y-%m-%d"),
      }),
    })
    ls.add_snippets("lean", {
      s("{}_", {
        t "{",
        i(1, ""),
        t "}_",
      }),
      s("{{}}", {
        t "⦃",
        i(1, ""),
        t "⦄",
      }),
      s("[]", {
        t "[",
        i(1, ""),
        t "]",
      }),
      s("[]_", {
        t "[",
        i(1, ""),
        t "]_",
      }),
      s("[[]]", {
        t "⟦",
        i(1, ""),
        t "⟧",
      }),
      s("<>", {
        t "⟨",
        i(1, ""),
        t "⟩",
      }),
      s("()_", {
        t "(",
        i(1, ""),
        t ")_",
      }),
      s("([])'", {
        t "⟮",
        i(1, ""),
        t "⟯",
      }),
      s("(())", {
        t "⸨",
        i(1, ""),
        t "⸩",
      }),
      s("f<>", {
        t "‹",
        i(1, ""),
        t "›",
      }),
      s("f<<>>", {
        t "«",
        i(1, ""),
        t "»",
      }),
      s("[--]", {
        t "⁅",
        i(1, ""),
        t "⁆",
      }),
      s("||||", {
        t "‖",
        i(1, ""),
        t "‖",
      }),
      s("nnnorm", {
        t "‖",
        i(1, ""),
        t "‖₊",
      }),
      s("norm", {
        t "‖",
        i(1, ""),
        t "‖",
      }),
      s("floor", {
        t "⌊",
        i(1, ""),
        t "⌋",
      }),
      s("ceil", {
        t "⌈",
        i(1, ""),
        t "⌉",
      }),
      s("nfloor", {
        t "⌊",
        i(1, ""),
        t "⌋₊",
      }),
      s("nceil", {
        t "⌈",
        i(1, ""),
        t "⌉₊",
      }),
      s("s[]", {
        t "⦋",
        i(1, ""),
        t "⦌",
      }),
      s("simplex", {
        t "⦋",
        i(1, ""),
        t "⦌",
      }),
      s("\\", {
        t "\\",
      }),
      s("a", {
        t "α",
      }),
      s("b", {
        t "β",
      }),
      s("c", {
        t "χ",
      }),
      s("d", {
        t "↓",
      }),
      s("e", {
        t "ε",
      }),
      s("g", {
        t "γ",
      }),
      s("i", {
        t "∩",
      }),
      s("m", {
        t "μ",
      }),
      s("n", {
        t "\\n",
      }),
      s("o", {
        t "∘",
      }),
      s("p", {
        t "Π",
      }),
      s("t", {
        t "▸",
      }),
      s("r", {
        t "→",
      }),
      s("u", {
        t "↑",
      }),
      s("v", {
        t "∨",
      }),
      s("x", {
        t "×",
      }),
      s("-", {
        t "⁻¹",
      }),
      s("~", {
        t "∼",
      }),
      s(".", {
        t "·",
      }),
      s("*", {
        t "⋆",
      }),
      s("!", {
        t "¬",
      }),
      s("?", {
        t "¿",
      }),
      s("1", {
        t "₁",
      }),
      s("2", {
        t "₂",
      }),
      s("3", {
        t "₃",
      }),
      s("4", {
        t "₄",
      }),
      s("5", {
        t "₅",
      }),
      s("6", {
        t "₆",
      }),
      s("7", {
        t "₇",
      }),
      s("8", {
        t "₈",
      }),
      s("9", {
        t "₉",
      }),
      s("0", {
        t "₀",
      }),
      s("l", {
        t "←",
      }),
      s("<", {
        t "⟨",
      }),
      s(">", {
        t "⟩",
      }),
      s("O", {
        t "Ø",
      }),
      s("&", {
        t "⅋",
      }),
      s("A", {
        t "𝔸",
      }),
      s("C", {
        t "ℂ",
      }),
      s("D", {
        t "Δ",
      }),
      s("F", {
        t "𝔽",
      }),
      s("G", {
        t "Γ",
      }),
      s("H", {
        t "ℍ",
      }),
      s("I", {
        t "⋂",
      }),
      s("I0", {
        t "⋂₀",
      }),
      s("K", {
        t "𝕂",
      }),
      s("L", {
        t "Λ",
      }),
      s("N", {
        t "ℕ",
      }),
      s("P", {
        t "Π",
      }),
      s("Q", {
        t "ℚ",
      }),
      s("R", {
        t "ℝ",
      }),
      s("S", {
        t "Σ",
      }),
      s("U", {
        t "⋃",
      }),
      s("U0", {
        t "⋃₀",
      }),
      s("Z", {
        t "ℤ",
      }),
      s("#", {
        t "♯",
      }),
      s(":", {
        t "∶",
      }),
      s("|", {
        t "∣",
      }),
      s("rw", {
        t "▸",
      }),
      s("coe", {
        t "↑",
      }),
      s("be", {
        t "β",
      }),
      s("ga", {
        t "γ",
      }),
      s("de", {
        t "δ",
      }),
      s("ep", {
        t "ε",
      }),
      s("ze", {
        t "ζ",
      }),
      s("et", {
        t "η",
      }),
      s("th", {
        t "θ",
      }),
      s("io", {
        t "ι",
      }),
      s("ka", {
        t "κ",
      }),
      s("la", {
        t "λ",
      }),
      s("mu", {
        t "μ",
      }),
      s("nu", {
        t "ν",
      }),
      s("xi", {
        t "ξ",
      }),
      s("pi", {
        t "π",
      }),
      s("rh", {
        t "ρ",
      }),
      s("vsi", {
        t "ς",
      }),
      s("si", {
        t "σ",
      }),
      s("ta", {
        t "τ",
      }),
      s("ph", {
        t "φ",
      }),
      s("ch", {
        t "χ",
      }),
      s("ps", {
        t "ψ",
      }),
      s("om", {
        t "ω",
      }),
      s("`A", {
        t "À",
      }),
      s("'A", {
        t "Á",
      }),
      s("^{A}", {
        t "Â",
      }),
      s("~A", {
        t "Ã",
      }),
      s('"A', {
        t "Ä",
      }),
      s("-{A}", {
        t "Ā",
      }),
      s("cC", {
        t "Ç",
      }),
      s("`E", {
        t "È",
      }),
      s("'E", {
        t "É",
      }),
      s("^{E}", {
        t "Ê",
      }),
      s('"E', {
        t "Ë",
      }),
      s("-{E}", {
        t "Ē",
      }),
      s("`I", {
        t "Ì",
      }),
      s("'I", {
        t "Í",
      }),
      s("^{I}", {
        t "Î",
      }),
      s('"I', {
        t "Ï",
      }),
      s("-{I}", {
        t "Ī",
      }),
      s("~N", {
        t "Ñ",
      }),
      s("`O", {
        t "Ò",
      }),
      s("'O", {
        t "Ó",
      }),
      s("^{O}", {
        t "Ô",
      }),
      s("~O", {
        t "Õ",
      }),
      s('"O', {
        t "Ö",
      }),
      s("/O", {
        t "Ø",
      }),
      s("-{O}", {
        t "Ō",
      }),
      s("`U", {
        t "Ù",
      }),
      s("'U", {
        t "Ú",
      }),
      s("^{U}", {
        t "Û",
      }),
      s('"U', {
        t "Ü",
      }),
      s("-{U}", {
        t "Ū",
      }),
      s("'Y", {
        t "Ý",
      }),
      s("`a", {
        t "à",
      }),
      s("'a", {
        t "á",
      }),
      s("^{a}", {
        t "â",
      }),
      s("~a", {
        t "ã",
      }),
      s('"a', {
        t "ä",
      }),
      s("-{a}", {
        t "ā",
      }),
      s("cc", {
        t "ç",
      }),
      s("`e", {
        t "è",
      }),
      s("'e", {
        t "é",
      }),
      s("^{e}", {
        t "ê",
      }),
      s('"e', {
        t "ë",
      }),
      s("-{e}", {
        t "ē",
      }),
      s("`i", {
        t "ì",
      }),
      s("'i", {
        t "í",
      }),
      s("^{i}", {
        t "î",
      }),
      s('"i', {
        t "ï",
      }),
      s("-{i}", {
        t "ī",
      }),
      s("~{n}", {
        t "ñ",
      }),
      s("`o", {
        t "ò",
      }),
      s("'o", {
        t "ó",
      }),
      s("^{o}", {
        t "ô",
      }),
      s("~o", {
        t "õ",
      }),
      s('"o', {
        t "ö",
      }),
      s("/o", {
        t "ø",
      }),
      s("-{o}", {
        t "ō",
      }),
      s("`u", {
        t "ù",
      }),
      s("'u", {
        t "ú",
      }),
      s("^{u}", {
        t "û",
      }),
      s('"u', {
        t "ü",
      }),
      s("-{u}", {
        t "ū",
      }),
      s("'y", {
        t "ý",
      }),
      s('"y', {
        t "ÿ",
      }),
      s("/L", {
        t "Ł",
      }),
      s("note", {
        t "♩",
      }),
      s("not", {
        t "¬",
      }),
      s("notin", {
        t "∉",
      }),
      s("notlt", {
        t "≮",
      }),
      s("nomisma", {
        t "𐆎",
      }),
      s("nin", {
        t "∉",
      }),
      s("nni", {
        t "∌",
      }),
      s("ni", {
        t "∋",
      }),
      s("nattrans", {
        t "⟹",
      }),
      s("nat_trans", {
        t "⟹",
      }),
      s("natural", {
        t "♮",
      }),
      s("nat", {
        t "ℕ",
      }),
      s("naira", {
        t "₦",
      }),
      s("nabla", {
        t "∇",
      }),
      s("napprox", {
        t "≉",
      }),
      s("numero", {
        t "№",
      }),
      s("nLeftarrow", {
        t "⇍",
      }),
      s("nLeftrightarrow", {
        t "⇎",
      }),
      s("nRightarrow", {
        t "⇏",
      }),
      s("nVDash", {
        t "⊯",
      }),
      s("nVdash", {
        t "⊮",
      }),
      s("ncong", {
        t "≇",
      }),
      s("nearrow", {
        t "↗",
      }),
      s("neg", {
        t "¬",
      }),
      s("nequiv", {
        t "≢",
      }),
      s("neq", {
        t "≠",
      }),
      s("nexists", {
        t "∄",
      }),
      s("ne", {
        t "≠",
      }),
      s("ngeqq", {
        t "≱",
      }),
      s("ngeqslant", {
        t "≱",
      }),
      s("ngeq", {
        t "≱",
      }),
      s("ngtr", {
        t "≯",
      }),
      s("nleftarrow", {
        t "↚",
      }),
      s("nleftrightarrow", {
        t "↮",
      }),
      s("nleqq", {
        t "≰",
      }),
      s("nleqslant", {
        t "≰",
      }),
      s("nleq", {
        t "≰",
      }),
      s("nless", {
        t "≮",
      }),
      s("nmid", {
        t "∤",
      }),
      s("nparallel", {
        t "∦",
      }),
      s("npreceq", {
        t "⋠",
      }),
      s("nprec", {
        t "⊀",
      }),
      s("nrightarrow", {
        t "↛",
      }),
      s("nshortmid", {
        t "∤",
      }),
      s("nsimeq", {
        t "≄",
      }),
      s("nsim", {
        t "≁",
      }),
      s("nsubseteqq", {
        t "⊈",
      }),
      s("nsubseteq", {
        t "⊈",
      }),
      s("nsubset", {
        t "⊄",
      }),
      s("nsucceq", {
        t "⋡",
      }),
      s("nsucc", {
        t "⊁",
      }),
      s("nsupseteqq", {
        t "⊉",
      }),
      s("nsupseteq", {
        t "⊉",
      }),
      s("nsupset", {
        t "⊅",
      }),
      s("ntrianglelefteq", {
        t "⋬",
      }),
      s("ntriangleleft", {
        t "⋪",
      }),
      s("ntrianglerighteq", {
        t "⋭",
      }),
      s("ntriangleright", {
        t "⋫",
      }),
      s("nvDash", {
        t "⊭",
      }),
      s("nvdash", {
        t "⊬",
      }),
      s("nwarrow", {
        t "↖",
      }),
      s("eqn", {
        t "≠",
      }),
      s("equiv", {
        t "≃",
      }),
      s("eqcirc", {
        t "≖",
      }),
      s("eqcolon", {
        t "≕",
      }),
      s("eqslantgtr", {
        t "⋝",
      }),
      s("eqslantless", {
        t "⋜",
      }),
      s("entails", {
        t "⊢",
      }),
      s("en", {
        t "–",
      }),
      s("exn", {
        t "∄",
      }),
      s("exists", {
        t "∃",
      }),
      s("ex", {
        t "∃",
      }),
      s("emptyset", {
        t "∅",
      }),
      s("empty", {
        t "∅",
      }),
      s("em", {
        t "—",
      }),
      s("epsilon", {
        t "ε",
      }),
      s("eps", {
        t "ε",
      }),
      s("euro", {
        t "€",
      }),
      s("eta", {
        t "η",
      }),
      s("ell", {
        t "ℓ",
      }),
      s("iso", {
        t "≅",
      }),
      s("in", {
        t "∈",
      }),
      s("inn", {
        t "∉",
      }),
      s("inter", {
        t "∩",
      }),
      s("intercal", {
        t "⊺",
      }),
      s("intersection", {
        t "∩",
      }),
      s("integral", {
        t "∫",
      }),
      s("integral-", {
        t "⨍",
      }),
      s("int", {
        t "ℤ",
      }),
      s("inv", {
        t "⁻¹",
      }),
      s("increment", {
        t "∆",
      }),
      s("inf", {
        t "⊓",
      }),
      s("infi", {
        t "⨅",
      }),
      s("infty", {
        t "∞",
      }),
      s("iff", {
        t "↔",
      }),
      s("imp", {
        t "→",
      }),
      s("imath", {
        t "ı",
      }),
      s("iota", {
        t "ι",
      }),
      s("=n", {
        t "≠",
      }),
      s("==n", {
        t "≢",
      }),
      s("===", {
        t "≣",
      }),
      s("==>", {
        t "⟹",
      }),
      s("==", {
        t "≡",
      }),
      s("=:", {
        t "≕",
      }),
      s("=o", {
        t "≗",
      }),
      s("=>n", {
        t "⇏",
      }),
      s("=>", {
        t "⇒",
      }),
      s("~n", {
        t "≁",
      }),
      s("~~n", {
        t "≉",
      }),
      s("~~~", {
        t "≋",
      }),
      s("~~-", {
        t "≊",
      }),
      s("~~", {
        t "≈",
      }),
      s("~-n", {
        t "≄",
      }),
      s("~-", {
        t "≃",
      }),
      s("~=n", {
        t "≇",
      }),
      s("~=", {
        t "≅",
      }),
      s("homotopy", {
        t "∼",
      }),
      s("hom", {
        t "⟶",
      }),
      s("hori", {
        t "ϩ",
      }),
      s("hookleftarrow", {
        t "↩",
      }),
      s("hookrightarrow", {
        t "↪",
      }),
      s("hryvnia", {
        t "₴",
      }),
      s("heta", {
        t "ͱ",
      }),
      s("heartsuit", {
        t "♥",
      }),
      s("hbar", {
        t "ℏ",
      }),
      s(":~", {
        t "∻",
      }),
      s(":=", {
        t "≔",
      }),
      s("::-", {
        t "∺",
      }),
      s("::", {
        t "∷",
      }),
      s("-~", {
        t "≂",
      }),
      s("-|", {
        t "⊣",
      }),
      s("-1", {
        t "⁻¹",
      }),
      s("^-1", {
        t "⁻¹",
      }),
      s("-2", {
        t "⁻²",
      }),
      s("-3", {
        t "⁻³",
      }),
      s("-:", {
        t "∹",
      }),
      s("->n", {
        t "↛",
      }),
      s("->", {
        t "→",
      }),
      s("-->", {
        t "⟶",
      }),
      s("---", {
        t "─",
      }),
      s("--=", {
        t "═",
      }),
      s("--_", {
        t "━",
      }),
      s("--.", {
        t "╌",
      }),
      s("-o", {
        t "⊸",
      }),
      s(".=.", {
        t "≑",
      }),
      s(".=", {
        t "≐",
      }),
      s(".+", {
        t "∔",
      }),
      s(".-", {
        t "∸",
      }),
      s("...", {
        t "⋯",
      }),
      s("(=", {
        t "≘",
      }),
      s("(b", {
        t "⟅",
      }),
      s("and=", {
        t "≙",
      }),
      s("and", {
        t "∧",
      }),
      s("an", {
        t "∧",
      }),
      s("angle", {
        t "∠",
      }),
      s("rightangle", {
        t "∟",
      }),
      s("angstrom", {
        t "Å",
      }),
      s("all", {
        t "∀",
      }),
      s("allf", {
        t "∀ᶠ",
      }),
      s("all^f", {
        t "∀ᶠ",
      }),
      s("allm", {
        t "∀ᵐ",
      }),
      s("all^m", {
        t "∀ᵐ",
      }),
      s("alpha", {
        t "α",
      }),
      s("aleph", {
        t "ℵ",
      }),
      s("aleph0", {
        t "ℵ₀",
      }),
      s("asterisk", {
        t "⁎",
      }),
      s("ast", {
        t "∗",
      }),
      s("asymp", {
        t "≍",
      }),
      s("apl", {
        t "⌶",
      }),
      s("approxeq", {
        t "≊",
      }),
      s("approx", {
        t "≈",
      }),
      s("aa", {
        t "å",
      }),
      s("ae", {
        t "æ",
      }),
      s("austral", {
        t "₳",
      }),
      s("amalg", {
        t "∐",
      }),
      s("average", {
        t "⨍",
      }),
      s("-int", {
        t "⨍",
      }),
      s("or=", {
        t "≚",
      }),
      s("ordfeminine", {
        t "ª",
      }),
      s("ordmasculine", {
        t "º",
      }),
      s("or", {
        t "∨",
      }),
      s("oplus", {
        t "⊕",
      }),
      s("od", {
        t "ᵒᵈ",
      }),
      s("orderdual", {
        t "ᵒᵈ",
      }),
      s("addopposite", {
        t "ᵃᵒᵖ",
      }),
      s("aop", {
        t "ᵃᵒᵖ",
      }),
      s("mulopposite", {
        t "ᵐᵒᵖ",
      }),
      s("mop", {
        t "ᵐᵒᵖ",
      }),
      s("opposite", {
        t "ᵒᵖ",
      }),
      s("op", {
        t "ᵒᵖ",
      }),
      s("o+", {
        t "⊕",
      }),
      s("o--", {
        t "⊖",
      }),
      s("o-", {
        t "⊝",
      }),
      s("ox", {
        t "⊗",
      }),
      s("o/", {
        t "⊘",
      }),
      s("o.", {
        t "⊙",
      }),
      s("oo", {
        t "⊚",
      }),
      s("o*", {
        t "∘*",
      }),
      s("o=", {
        t "⊜",
      }),
      s("oe", {
        t "œ",
      }),
      s("octagonal", {
        t "🛑",
      }),
      s("ohm", {
        t "Ω",
      }),
      s("ounce", {
        t "℥",
      }),
      s("omega", {
        t "ω",
      }),
      s("omicron", {
        t "ο",
      }),
      s("ominus", {
        t "⊖",
      }),
      s("odot", {
        t "⊙",
      }),
      s("oint", {
        t "∮",
      }),
      s("oiint", {
        t "∯",
      }),
      s("oslash", {
        t "⊘",
      }),
      s("otimes", {
        t "⊗",
      }),
      s("tensorproduct", {
        t "⊗",
      }),
      s("pitensorproduct", {
        t "⨂",
      }),
      s("tensorpower", {
        t "⨂",
      }),
      s("pd", {
        t "∂",
      }),
      s("*=", {
        t "≛",
      }),
      s("t=", {
        t "≜",
      }),
      s("tint", {
        t "∯",
      }),
      s("transport", {
        t "▹",
      }),
      s("trans", {
        t "▹",
      }),
      s("triangledown", {
        t "▿",
      }),
      s("trianglelefteq", {
        t "⊴",
      }),
      s("triangleleft", {
        t "◃",
      }),
      s("triangleq", {
        t "≜",
      }),
      s("trianglerighteq", {
        t "⊵",
      }),
      s("triangleright", {
        t "▹",
      }),
      s("triangle", {
        t "▵",
      }),
      s("tr", {
        t "⬝",
      }),
      s("tb", {
        t "◂",
      }),
      s("twoheadleftarrow", {
        t "↞",
      }),
      s("twoheadrightarrow", {
        t "↠",
      }),
      s("tw", {
        t "◃",
      }),
      s("tie", {
        t "⁀",
      }),
      s("times", {
        t "×",
      }),
      s("theta", {
        t "θ",
      }),
      s("therefore", {
        t "∴",
      }),
      s("thickapprox", {
        t "≈",
      }),
      s("thicksim", {
        t "∼",
      }),
      s("telephone", {
        t "℡",
      }),
      s("tenge", {
        t "₸",
      }),
      s("textmusicalnote", {
        t "♪",
      }),
      s("textmu", {
        t "µ",
      }),
      s("textfractionsolidus", {
        t "⁄",
      }),
      s("textbaht", {
        t "฿",
      }),
      s("textdied", {
        t "✝",
      }),
      s("textdiscount", {
        t "⁒",
      }),
      s("textcolonmonetary", {
        t "₡",
      }),
      s("textcircledP", {
        t "℗",
      }),
      s("textwon", {
        t "₩",
      }),
      s("textnaira", {
        t "₦",
      }),
      s("textnumero", {
        t "№",
      }),
      s("textpeso", {
        t "₱",
      }),
      s("textpertenthousand", {
        t "‱",
      }),
      s("textlira", {
        t "₤",
      }),
      s("textlquill", {
        t "⁅",
      }),
      s("textrecipe", {
        t "℞",
      }),
      s("textreferencemark", {
        t "※",
      }),
      s("textrquill", {
        t "⁆",
      }),
      s("textinterrobang", {
        t "‽",
      }),
      s("textestimated", {
        t "℮",
      }),
      s("textopenbullet", {
        t "◦",
      }),
      s("tugrik", {
        t "₮",
      }),
      s("tau", {
        t "τ",
      }),
      s("top", {
        t "⊤",
      }),
      s("to", {
        t "→",
      }),
      s("to0", {
        t "→₀",
      }),
      s("r0", {
        t "→₀",
      }),
      s("to_0", {
        t "→₀",
      }),
      s("r_0", {
        t "→₀",
      }),
      s("finsupp", {
        t "→₀",
      }),
      s("to1", {
        t "→₁",
      }),
      s("r1", {
        t "→₁",
      }),
      s("to_1", {
        t "→₁",
      }),
      s("r_1", {
        t "→₁",
      }),
      s("l1", {
        t "→₁",
      }),
      s("to1s", {
        t "→₁ₛ",
      }),
      s("r1s", {
        t "→₁ₛ",
      }),
      s("to_1s", {
        t "→₁ₛ",
      }),
      s("r_1s", {
        t "→₁ₛ",
      }),
      s("l1simplefunc", {
        t "→₁ₛ",
      }),
      s("toa", {
        t "→ₐ",
      }),
      s("ra", {
        t "→ₐ",
      }),
      s("to_a", {
        t "→ₐ",
      }),
      s("r_a", {
        t "→ₐ",
      }),
      s("alghom", {
        t "→ₐ",
      }),
      s("tob", {
        t "→ᵇ",
      }),
      s("rb", {
        t "→ᵇ",
      }),
      s("to^b", {
        t "→ᵇ",
      }),
      s("r^b", {
        t "→ᵇ",
      }),
      s("boundedcontinuousfunction", {
        t "→ᵇ",
      }),
      s("tol", {
        t "→ₗ",
      }),
      s("rl", {
        t "→ₗ",
      }),
      s("to_l", {
        t "→ₗ",
      }),
      s("r_l", {
        t "→ₗ",
      }),
      s("linearmap", {
        t "→ₗ",
      }),
      s("tosl", {
        t "→ₛₗ",
      }),
      s("rsl", {
        t "→ₛₗ",
      }),
      s("to_sl", {
        t "→ₛₗ",
      }),
      s("r_sl", {
        t "→ₛₗ",
      }),
      s("semilinearmap", {
        t "→ₛₗ",
      }),
      s("tom", {
        t "→ₘ",
      }),
      s("rm", {
        t "→ₘ",
      }),
      s("to_m", {
        t "→ₘ",
      }),
      s("r_m", {
        t "→ₘ",
      }),
      s("aeeqfun", {
        t "→ₘ",
      }),
      s("rp", {
        t "→ₚ",
      }),
      s("to_p", {
        t "→ₚ",
      }),
      s("r_p", {
        t "→ₚ",
      }),
      s("dfinsupp", {
        t "→ₚ",
      }),
      s("tos", {
        t "→ₛ",
      }),
      s("rs", {
        t "→ₛ",
      }),
      s("to_s", {
        t "→ₛ",
      }),
      s("r_s", {
        t "→ₛ",
      }),
      s("simplefunc", {
        t "→ₛ",
      }),
      s("heyting", {
        t "⇨",
      }),
      s("himp", {
        t "⇨",
      }),
      s("hnot", {
        t "￢",
      }),
      s("covers", {
        t "⋖",
      }),
      s("covby", {
        t "⋖",
      }),
      s("wcovby", {
        t "⩿",
      }),
      s("wcovers", {
        t "⩿",
      }),
      s("def=", {
        t "≝",
      }),
      s("defs", {
        t "≙",
      }),
      s("degree", {
        t "°",
      }),
      s("dei", {
        t "ϯ",
      }),
      s("delta", {
        t "δ",
      }),
      s("doteqdot", {
        t "≑",
      }),
      s("doteq", {
        t "≐",
      }),
      s("dotplus", {
        t "∔",
      }),
      s("dotsquare", {
        t "⊡",
      }),
      s("dot", {
        t "·",
      }),
      s("dong", {
        t "₫",
      }),
      s("downarrow", {
        t "↓",
      }),
      s("downdownarrows", {
        t "⇊",
      }),
      s("downleftharpoon", {
        t "⇃",
      }),
      s("downrightharpoon", {
        t "⇂",
      }),
      s("dr-", {
        t "↘",
      }),
      s("dr=", {
        t "⇘",
      }),
      s("drachma", {
        t "₯",
      }),
      s("dr", {
        t "↘",
      }),
      s("dl-", {
        t "↙",
      }),
      s("dl=", {
        t "⇙",
      }),
      s("dl", {
        t "↙",
      }),
      s("d-2", {
        t "⇊",
      }),
      s("d-u-", {
        t "⇵",
      }),
      s("d-|", {
        t "↧",
      }),
      s("d-", {
        t "↓",
      }),
      s("d==", {
        t "⟱",
      }),
      s("d=", {
        t "⇓",
      }),
      s("dd-", {
        t "↡",
      }),
      s("ddagger", {
        t "‡",
      }),
      s("ddag", {
        t "‡",
      }),
      s("ddots", {
        t "⋱",
      }),
      s("dz", {
        t "↯",
      }),
      s("dib", {
        t "◆",
      }),
      s("diw", {
        t "◇",
      }),
      s("di.", {
        t "◈",
      }),
      s("die", {
        t "⚀",
      }),
      s("division", {
        t "÷",
      }),
      s("divideontimes", {
        t "⋇",
      }),
      s("div", {
        t "÷",
      }),
      s("diameter", {
        t "⌀",
      }),
      s("diamondsuit", {
        t "♢",
      }),
      s("diamond", {
        t "⋄",
      }),
      s("digamma", {
        t "ϝ",
      }),
      s("di", {
        t "◆",
      }),
      s("dagger", {
        t "†",
      }),
      s("dag", {
        t "†",
      }),
      s("daleth", {
        t "ℸ",
      }),
      s("dashv", {
        t "⊣",
      }),
      s("dh", {
        t "ð",
      }),
      s("dvd", {
        t "∣",
      }),
      s("m=", {
        t "≞",
      }),
      s("meet", {
        t "⊓",
      }),
      s("member", {
        t "∈",
      }),
      s("mem", {
        t "∈",
      }),
      s("measuredangle", {
        t "∡",
      }),
      s("ma", {
        t "↦",
      }),
      s("mapsto", {
        t "↦",
      }),
      s("male", {
        t "♂",
      }),
      s("maltese", {
        t "✠",
      }),
      s("manat", {
        t "₼",
      }),
      s("mathscr{I}", {
        t "ℐ",
      }),
      s("minus", {
        t "−",
      }),
      s("mill", {
        t "₥",
      }),
      s("micro", {
        t "µ",
      }),
      s("mid", {
        t "∣",
      }),
      s("multiplication", {
        t "×",
      }),
      s("multimap", {
        t "⊸",
      }),
      s("mho", {
        t "℧",
      }),
      s("models", {
        t "⊧",
      }),
      s("mp", {
        t "∓",
      }),
      s("?=", {
        t "≟",
      }),
      s("??", {
        t "⁇",
      }),
      s("?!", {
        t "‽",
      }),
      s("prohibited", {
        t "🛇",
      }),
      s("prod", {
        t "∏",
      }),
      s("propto", {
        t "∝",
      }),
      s("precapprox", {
        t "≾",
      }),
      s("preceq", {
        t "≼",
      }),
      s("precnapprox", {
        t "⋨",
      }),
      s("precnsim", {
        t "⋨",
      }),
      s("precsim", {
        t "≾",
      }),
      s("prec", {
        t "≺",
      }),
      s("preim", {
        t "⁻¹'",
      }),
      s("preimage", {
        t "⁻¹'",
      }),
      s("prime", {
        t "′",
      }),
      s("pr", {
        t "↣",
      }),
      s("powerset", {
        t "𝒫",
      }),
      s("pounds", {
        t "£",
      }),
      s("pound", {
        t "£",
      }),
      s("pab", {
        t "▰",
      }),
      s("paw", {
        t "▱",
      }),
      s("partnership", {
        t "㉐",
      }),
      s("partial", {
        t "∂",
      }),
      s("paragraph", {
        t "¶",
      }),
      s("parallel", {
        t "∥",
      }),
      s("pa", {
        t "▰",
      }),
      s("pm", {
        t "±",
      }),
      s("perp", {
        t "⟂",
      }),
      s("^perp", {
        t "ᗮ",
      }),
      s("permil", {
        t "‰",
      }),
      s("per", {
        t "⅌",
      }),
      s("peso", {
        t "₱",
      }),
      s("peseta", {
        t "₧",
      }),
      s("pilcrow", {
        t "¶",
      }),
      s("pitchfork", {
        t "⋔",
      }),
      s("psi", {
        t "ψ",
      }),
      s("phi", {
        t "φ",
      }),
      s("leqn", {
        t "≰",
      }),
      s("leqq", {
        t "≦",
      }),
      s("leqslant", {
        t "≤",
      }),
      s("leq", {
        t "≤",
      }),
      s("len", {
        t "≰",
      }),
      s("leadsto", {
        t "↝",
      }),
      s("leftarrowtail", {
        t "↢",
      }),
      s("leftarrow", {
        t "←",
      }),
      s("leftharpoondown", {
        t "↽",
      }),
      s("leftharpoonup", {
        t "↼",
      }),
      s("leftleftarrows", {
        t "⇇",
      }),
      s("leftrightarrows", {
        t "⇆",
      }),
      s("leftrightarrow", {
        t "↔",
      }),
      s("leftrightharpoons", {
        t "⇋",
      }),
      s("leftrightsquigarrow", {
        t "↭",
      }),
      s("leftthreetimes", {
        t "⋋",
      }),
      s("lessapprox", {
        t "≲",
      }),
      s("lessdot", {
        t "⋖",
      }),
      s("lesseqgtr", {
        t "⋚",
      }),
      s("lesseqqgtr", {
        t "⋚",
      }),
      s("lessgtr", {
        t "≶",
      }),
      s("lesssim", {
        t "≲",
      }),
      s("le", {
        t "≤",
      }),
      s("lub", {
        t "⊔",
      }),
      s("lr--", {
        t "⟷",
      }),
      s("lr-n", {
        t "↮",
      }),
      s("lr-", {
        t "↔",
      }),
      s("lr=n", {
        t "⇎",
      }),
      s("lr=", {
        t "⇔",
      }),
      s("lr~", {
        t "↭",
      }),
      s("lrcorner", {
        t "⌟",
      }),
      s("lr", {
        t "↔",
      }),
      s("l-2", {
        t "⇇",
      }),
      s("l-r-", {
        t "⇆",
      }),
      s("l--", {
        t "⟵",
      }),
      s("l-n", {
        t "↚",
      }),
      s("l-|", {
        t "↤",
      }),
      s("l->", {
        t "↢",
      }),
      s("l-", {
        t "←",
      }),
      s("l==", {
        t "⇚",
      }),
      s("l=n", {
        t "⇍",
      }),
      s("l=", {
        t "⇐",
      }),
      s("l~", {
        t "↜",
      }),
      s("ll-", {
        t "↞",
      }),
      s("llcorner", {
        t "⌞",
      }),
      s("llbracket", {
        t "〚",
      }),
      s("ll", {
        t "≪",
      }),
      s("lbag", {
        t "⟅",
      }),
      s("lambda", {
        t "λ",
      }),
      s("lamda", {
        t "λ",
      }),
      s("lam", {
        t "λ",
      }),
      s("lari", {
        t "₾",
      }),
      s("langle", {
        t "⟨",
      }),
      s("lira", {
        t "₤",
      }),
      s("lceil", {
        t "⌈",
      }),
      s("ldots", {
        t "…",
      }),
      s("ldq", {
        t "“",
      }),
      s("ldata", {
        t "《",
      }),
      s("lfloor", {
        t "⌊",
      }),
      s("lf", {
        t "⧏",
      }),
      s("<|", {
        t "⧏",
      }),
      s("lhd", {
        t "◁",
      }),
      s("lnapprox", {
        t "⋦",
      }),
      s("lneqq", {
        t "≨",
      }),
      s("lneq", {
        t "≨",
      }),
      s("lnsim", {
        t "⋦",
      }),
      s("lnot", {
        t "¬",
      }),
      s("longleftarrow", {
        t "⟵",
      }),
      s("longleftrightarrow", {
        t "⟷",
      }),
      s("longrightarrow", {
        t "⟶",
      }),
      s("looparrowleft", {
        t "↫",
      }),
      s("looparrowright", {
        t "↬",
      }),
      s("lozenge", {
        t "✧",
      }),
      s("lq", {
        t "‘",
      }),
      s("ltimes", {
        t "⋉",
      }),
      s("lvertneqq", {
        t "≨",
      }),
      s("geqn", {
        t "≱",
      }),
      s("geqq", {
        t "≧",
      }),
      s("geqslant", {
        t "≥",
      }),
      s("geq", {
        t "≥",
      }),
      s("gen", {
        t "≱",
      }),
      s("gets", {
        t "←",
      }),
      s("ge", {
        t "≥",
      }),
      s("glb", {
        t "⊓",
      }),
      s("glqq", {
        t "„",
      }),
      s("glq", {
        t "‚",
      }),
      s("guarani", {
        t "₲",
      }),
      s("gangia", {
        t "ϫ",
      }),
      s("gamma", {
        t "γ",
      }),
      s("ggg", {
        t "⋙",
      }),
      s("gg", {
        t "≫",
      }),
      s("gimel", {
        t "ℷ",
      }),
      s("gnapprox", {
        t "⋧",
      }),
      s("gneqq", {
        t "≩",
      }),
      s("gneq", {
        t "≩",
      }),
      s("gnsim", {
        t "⋧",
      }),
      s("gtrapprox", {
        t "≳",
      }),
      s("gtrdot", {
        t "⋗",
      }),
      s("gtreqless", {
        t "⋛",
      }),
      s("gtreqqless", {
        t "⋛",
      }),
      s("gtrless", {
        t "≷",
      }),
      s("gtrsim", {
        t "≳",
      }),
      s("gvertneqq", {
        t "≩",
      }),
      s("grqq", {
        t "“",
      }),
      s("grq", {
        t "‘",
      }),
      s("<=n", {
        t "≰",
      }),
      s("<=>n", {
        t "⇎",
      }),
      s("<=>", {
        t "⇔",
      }),
      s("<=", {
        t "≤",
      }),
      s("<~nn", {
        t "≴",
      }),
      s("<~n", {
        t "⋦",
      }),
      s("<~", {
        t "≲",
      }),
      s("<:", {
        t "⋖",
      }),
      s(":>", {
        t "⋗",
      }),
      s("<->n", {
        t "↮",
      }),
      s("<->", {
        t "↔",
      }),
      s("<-->", {
        t "⟷",
      }),
      s("<--", {
        t "⟵",
      }),
      s("<-n", {
        t "↚",
      }),
      s("<-", {
        t "←",
      }),
      s("<<", {
        t "⟪",
      }),
      s(">=n", {
        t "≱",
      }),
      s(">=", {
        t "≥",
      }),
      s(">n", {
        t "≯",
      }),
      s(">~nn", {
        t "≵",
      }),
      s(">~n", {
        t "⋧",
      }),
      s(">~", {
        t "≳",
      }),
      s(">>", {
        t "⟫",
      }),
      s("root", {
        t "√",
      }),
      s("scissor", {
        t "✂",
      }),
      s("ssubn", {
        t "⊄",
      }),
      s("ssub", {
        t "⊂",
      }),
      s("ssupn", {
        t "⊅",
      }),
      s("ssup", {
        t "⊃",
      }),
      s("ssqub", {
        t "⊏",
      }),
      s("ssqup", {
        t "⊐",
      }),
      s("ss", {
        t "⊆",
      }),
      s("subn", {
        t "⊈",
      }),
      s("subseteqq", {
        t "⊆",
      }),
      s("subseteq", {
        t "⊆",
      }),
      s("subsetneqq", {
        t "⊊",
      }),
      s("subsetneq", {
        t "⊊",
      }),
      s("subset", {
        t "⊆",
      }),
      s("ssubset", {
        t "⊂",
      }),
      s("sub", {
        t "⊆",
      }),
      s("supn", {
        t "⊉",
      }),
      s("supseteqq", {
        t "⊇",
      }),
      s("supseteq", {
        t "⊇",
      }),
      s("supsetneqq", {
        t "⊋",
      }),
      s("supsetneq", {
        t "⊋",
      }),
      s("supset", {
        t "⊇",
      }),
      s("ssupset", {
        t "⊃",
      }),
      s("sUnion", {
        t "⋃₀",
      }),
      s("sInter", {
        t "⋂₀",
      }),
      s("sup", {
        t "⊔",
      }),
      s("supr", {
        t "⨆",
      }),
      s("surd3", {
        t "∛",
      }),
      s("surd4", {
        t "∜",
      }),
      s("surd", {
        t "√",
      }),
      s("succapprox", {
        t "≿",
      }),
      s("succcurlyeq", {
        t "≽",
      }),
      s("succeq", {
        t "≽",
      }),
      s("succnapprox", {
        t "⋩",
      }),
      s("succnsim", {
        t "⋩",
      }),
      s("succsim", {
        t "≿",
      }),
      s("succ", {
        t "≻",
      }),
      s("sum", {
        t "∑",
      }),
      s("specializes", {
        t "⤳",
      }),
      s("~>", {
        t "⤳",
      }),
      s("squbn", {
        t "⋢",
      }),
      s("squb", {
        t "⊑",
      }),
      s("squpn", {
        t "⋣",
      }),
      s("squp", {
        t "⊒",
      }),
      s("square", {
        t "□",
      }),
      s("squigarrowright", {
        t "⇝",
      }),
      s("sqb", {
        t "■",
      }),
      s("sqw", {
        t "□",
      }),
      s("sq.", {
        t "▣",
      }),
      s("sqo", {
        t "▢",
      }),
      s("sqcap", {
        t "⊓",
      }),
      s("sqcup", {
        t "⊔",
      }),
      s("sqrt", {
        t "√",
      }),
      s("sqsubseteq", {
        t "⊑",
      }),
      s("sqsubset", {
        t "⊏",
      }),
      s("sqsupseteq", {
        t "⊒",
      }),
      s("sqsupset", {
        t "⊐",
      }),
      s("sq", {
        t "◾",
      }),
      s("sy", {
        t "⁻¹",
      }),
      s("symmdiff", {
        t "∆",
      }),
      s("st4", {
        t "✦",
      }),
      s("st6", {
        t "✶",
      }),
      s("st8", {
        t "✴",
      }),
      s("st12", {
        t "✹",
      }),
      s("stigma", {
        t "ϛ",
      }),
      s("star", {
        t "⋆",
      }),
      s("straightphi", {
        t "φ",
      }),
      s("st", {
        t "⋆",
      }),
      s("spesmilo", {
        t "₷",
      }),
      s("span", {
        t "∙",
      }),
      s("spadesuit", {
        t "♠",
      }),
      s("sphericalangle", {
        t "∢",
      }),
      s("section", {
        t "§",
      }),
      s("searrow", {
        t "↘",
      }),
      s("setminus", {
        t "\\",
      }),
      s("san", {
        t "ϻ",
      }),
      s("sampi", {
        t "ϡ",
      }),
      s("shortmid", {
        t "∣",
      }),
      s("sho", {
        t "ϸ",
      }),
      s("shima", {
        t "ϭ",
      }),
      s("shei", {
        t "ϣ",
      }),
      s("sharp", {
        t "♯",
      }),
      s("sigma", {
        t "σ",
      }),
      s("simeq", {
        t "≃",
      }),
      s("sim", {
        t "∼",
      }),
      s("sbs", {
        t "﹨",
      }),
      s("smallamalg", {
        t "∐",
      }),
      s("smallsetminus", {
        t "∖",
      }),
      s("smallsmile", {
        t "⌣",
      }),
      s("smile", {
        t "⌣",
      }),
      s("smul", {
        t "•",
      }),
      s("swarrow", {
        t "↙",
      }),
      s("Tr", {
        t "◀",
      }),
      s("Tb", {
        t "◀",
      }),
      s("Tw", {
        t "◁",
      }),
      s("Tau", {
        t "Τ",
      }),
      s("Theta", {
        t "Θ",
      }),
      s("TH", {
        t "Þ",
      }),
      s("union", {
        t "∪",
      }),
      s("undertie", {
        t "‿",
      }),
      s("uncertainty", {
        t "⯑",
      }),
      s("un", {
        t "∪",
      }),
      s("u+", {
        t "⊎",
      }),
      s("u.", {
        t "⊍",
      }),
      s("ud-|", {
        t "↨",
      }),
      s("ud-", {
        t "↕",
      }),
      s("ud=", {
        t "⇕",
      }),
      s("ud", {
        t "↕",
      }),
      s("ul-", {
        t "↖",
      }),
      s("ul=", {
        t "⇖",
      }),
      s("ulcorner", {
        t "⌜",
      }),
      s("ul", {
        t "↖",
      }),
      s("ur-", {
        t "↗",
      }),
      s("ur=", {
        t "⇗",
      }),
      s("urcorner", {
        t "⌝",
      }),
      s("ur", {
        t "↗",
      }),
      s("u-2", {
        t "⇈",
      }),
      s("u-d-", {
        t "⇅",
      }),
      s("u-|", {
        t "↥",
      }),
      s("u-", {
        t "↑",
      }),
      s("u==", {
        t "⟰",
      }),
      s("u=", {
        t "⇑",
      }),
      s("uu-", {
        t "↟",
      }),
      s("upsilon", {
        t "υ",
      }),
      s("uparrow", {
        t "↑",
      }),
      s("updownarrow", {
        t "↕",
      }),
      s("upleftharpoon", {
        t "↿",
      }),
      s("uplus", {
        t "⊎",
      }),
      s("uprightharpoon", {
        t "↾",
      }),
      s("upuparrows", {
        t "⇈",
      }),
      s("And", {
        t "⋀",
      }),
      s("AA", {
        t "Å",
      }),
      s("AE", {
        t "Æ",
      }),
      s("Alpha", {
        t "Α",
      }),
      s("Or", {
        t "⋁",
      }),
      s("O+", {
        t "⨁",
      }),
      s("directsum", {
        t "⨁",
      }),
      s("Ox", {
        t "⨂",
      }),
      s("O.", {
        t "⨀",
      }),
      s("O*", {
        t "⍟",
      }),
      s("OE", {
        t "Œ",
      }),
      s("Omega", {
        t "Ω",
      }),
      s("Omicron", {
        t "Ο",
      }),
      s("Int", {
        t "ℤ",
      }),
      s("Inter", {
        t "⋂",
      }),
      s("bInter", {
        t "⋂",
      }),
      s("Iota", {
        t "Ι",
      }),
      s("Im", {
        t "ℑ",
      }),
      s("Un", {
        t "⋃",
      }),
      s("Union", {
        t "⋃",
      }),
      s("bUnion", {
        t "⋃",
      }),
      s("U+", {
        t "⨄",
      }),
      s("U.", {
        t "⨃",
      }),
      s("Upsilon", {
        t "Υ",
      }),
      s("Uparrow", {
        t "⇑",
      }),
      s("Updownarrow", {
        t "⇕",
      }),
      s("Gl-", {
        t "ƛ",
      }),
      s("Gl", {
        t "λ",
      }),
      s("Gangia", {
        t "Ϫ",
      }),
      s("Gamma", {
        t "Γ",
      }),
      s("Glb", {
        t "⨅",
      }),
      s("Ga", {
        t "α",
      }),
      s("GA", {
        t "Α",
      }),
      s("Gb", {
        t "β",
      }),
      s("GB", {
        t "Β",
      }),
      s("Gg", {
        t "γ",
      }),
      s("GG", {
        t "Γ",
      }),
      s("Gd", {
        t "δ",
      }),
      s("GD", {
        t "Δ",
      }),
      s("Ge", {
        t "ε",
      }),
      s("GE", {
        t "Ε",
      }),
      s("Gz", {
        t "ζ",
      }),
      s("GZ", {
        t "Ζ",
      }),
      s("Gth", {
        t "θ",
      }),
      s("Gt", {
        t "τ",
      }),
      s("GTH", {
        t "Θ",
      }),
      s("GT", {
        t "Τ",
      }),
      s("Gi", {
        t "ι",
      }),
      s("GI", {
        t "Ι",
      }),
      s("Gk", {
        t "κ",
      }),
      s("GK", {
        t "Κ",
      }),
      s("GL", {
        t "Λ",
      }),
      s("Gm", {
        t "μ",
      }),
      s("GM", {
        t "Μ",
      }),
      s("Gn", {
        t "ν",
      }),
      s("GN", {
        t "Ν",
      }),
      s("Gx", {
        t "ξ",
      }),
      s("GX", {
        t "Ξ",
      }),
      s("Gr", {
        t "ρ",
      }),
      s("GR", {
        t "Ρ",
      }),
      s("Gs", {
        t "σ",
      }),
      s("GS", {
        t "Σ",
      }),
      s("Gu", {
        t "υ",
      }),
      s("GU", {
        t "Υ",
      }),
      s("Gf", {
        t "φ",
      }),
      s("GF", {
        t "Φ",
      }),
      s("Gc", {
        t "χ",
      }),
      s("GC", {
        t "Χ",
      }),
      s("Gp", {
        t "ψ",
      }),
      s("GP", {
        t "Ψ",
      }),
      s("Go", {
        t "ω",
      }),
      s("GO", {
        t "Ω",
      }),
      s("Inf", {
        t "⨅",
      }),
      s("Join", {
        t "⨆",
      }),
      s("Lub", {
        t "⨆",
      }),
      s("Lambda", {
        t "Λ",
      }),
      s("Lamda", {
        t "Λ",
      }),
      s("Leftarrow", {
        t "⇐",
      }),
      s("Leftrightarrow", {
        t "⇔",
      }),
      s("Letter", {
        t "✉",
      }),
      s("Lleftarrow", {
        t "⇚",
      }),
      s("Ll", {
        t "⋘",
      }),
      s("Longleftarrow", {
        t "⇐",
      }),
      s("Longleftrightarrow", {
        t "⇔",
      }),
      s("Longrightarrow", {
        t "⇒",
      }),
      s("Meet", {
        t "⨅",
      }),
      s("Sup", {
        t "⨆",
      }),
      s("Sqcap", {
        t "⨅",
      }),
      s("Sqcup", {
        t "⨆",
      }),
      s("Lsh", {
        t "↰",
      }),
      s("|-n", {
        t "⊬",
      }),
      s("|-", {
        t "⊢",
      }),
      s("|=n", {
        t "⊭",
      }),
      s("|=", {
        t "⊨",
      }),
      s("|->", {
        t "↦",
      }),
      s("|=>", {
        t "⇰",
      }),
      s("||-n", {
        t "⊮",
      }),
      s("||-", {
        t "⊩",
      }),
      s("||=n", {
        t "⊯",
      }),
      s("||=", {
        t "⊫",
      }),
      s("|||-", {
        t "⊪",
      }),
      s("||", {
        t "‖",
      }),
      s("fuzzy", {
        t "‖",
      }),
      s("|n", {
        t "∤",
      }),
      s("Com", {
        t "ℂ",
      }),
      s("Chi", {
        t "Χ",
      }),
      s("Cap", {
        t "⋒",
      }),
      s("Cup", {
        t "⋓",
      }),
      s("cul", {
        t "⌜",
      }),
      s("cuL", {
        t "⌈",
      }),
      s("currency", {
        t "¤",
      }),
      s("curlyeqprec", {
        t "⋞",
      }),
      s("curlyeqsucc", {
        t "⋟",
      }),
      s("curlypreceq", {
        t "≼",
      }),
      s("curlyvee", {
        t "⋎",
      }),
      s("curlywedge", {
        t "⋏",
      }),
      s("curvearrowleft", {
        t "↶",
      }),
      s("curvearrowright", {
        t "↷",
      }),
      s("cur", {
        t "⌝",
      }),
      s("cuR", {
        t "⌉",
      }),
      s("cup", {
        t "∪",
      }),
      s("cu", {
        t "⌜",
      }),
      s("cll", {
        t "⌞",
      }),
      s("clL", {
        t "⌊",
      }),
      s("clr", {
        t "⌟",
      }),
      s("clR", {
        t "⌋",
      }),
      s("clubsuit", {
        t "♣",
      }),
      s("cl", {
        t "⌞",
      }),
      s("construction", {
        t "🚧",
      }),
      s("cong", {
        t "≅",
      }),
      s("con", {
        t "⬝",
      }),
      s("compl", {
        t "ᶜ",
      }),
      s("complement", {
        t "ᶜ",
      }),
      s("complementprefix", {
        t "∁",
      }),
      s("Complement", {
        t "∁",
      }),
      s("comp", {
        t "∘",
      }),
      s("com", {
        t "ℂ",
      }),
      s("coloneq", {
        t "≔",
      }),
      s("colon", {
        t "₡",
      }),
      s("copyright", {
        t "©",
      }),
      s("cdots", {
        t "⋯",
      }),
      s("cdot", {
        t "·",
      }),
      s("cib", {
        t "●",
      }),
      s("ciw", {
        t "○",
      }),
      s("ci..", {
        t "◌",
      }),
      s("ci.", {
        t "◎",
      }),
      s("ciO", {
        t "◯",
      }),
      s("circeq", {
        t "≗",
      }),
      s("circlearrowleft", {
        t "↺",
      }),
      s("circlearrowright", {
        t "↻",
      }),
      s("circledR", {
        t "®",
      }),
      s("circledS", {
        t "Ⓢ",
      }),
      s("circledast", {
        t "⊛",
      }),
      s("circledcirc", {
        t "⊚",
      }),
      s("circleddash", {
        t "⊝",
      }),
      s("circ", {
        t "∘",
      }),
      s("ci", {
        t "●",
      }),
      s("centerdot", {
        t "·",
      }),
      s("cent", {
        t "¢",
      }),
      s("cedi", {
        t "₵",
      }),
      s("celsius", {
        t "℃",
      }),
      s("ce", {
        t "ȩ",
      }),
      s("checkmark", {
        t "✓",
      }),
      s("chi", {
        t "χ",
      }),
      s("cruzeiro", {
        t "₢",
      }),
      s("caution", {
        t "☡",
      }),
      s("cap", {
        t "∩",
      }),
      s("qed", {
        t "∎",
      }),
      s("quot", {
        t "⧸",
      }),
      s("bigsolidus", {
        t "⧸",
      }),
      s("/", {
        t "⧸",
      }),
      s("+ ", {
        t "⊹",
      }),
      s("b+", {
        t "⊞",
      }),
      s("b-", {
        t "⊟",
      }),
      s("bx", {
        t "⊠",
      }),
      s("b.", {
        t "⊡",
      }),
      s("bn", {
        t "ℕ",
      }),
      s("bz", {
        t "ℤ",
      }),
      s("bq", {
        t "ℚ",
      }),
      s("brokenbar", {
        t "¦",
      }),
      s("br", {
        t "ℝ",
      }),
      s("bc", {
        t "ℂ",
      }),
      s("bp", {
        t "ℙ",
      }),
      s("bb", {
        t "𝔹",
      }),
      s("bsum", {
        t "⅀",
      }),
      s("b0", {
        t "𝟘",
      }),
      s("b1", {
        t "𝟙",
      }),
      s("b2", {
        t "𝟚",
      }),
      s("b3", {
        t "𝟛",
      }),
      s("b4", {
        t "𝟜",
      }),
      s("b5", {
        t "𝟝",
      }),
      s("b6", {
        t "𝟞",
      }),
      s("b7", {
        t "𝟟",
      }),
      s("b8", {
        t "𝟠",
      }),
      s("b9", {
        t "𝟡",
      }),
      s("sb0", {
        t "𝟬",
      }),
      s("sb1", {
        t "𝟭",
      }),
      s("sb2", {
        t "𝟮",
      }),
      s("sb3", {
        t "𝟯",
      }),
      s("sb4", {
        t "𝟰",
      }),
      s("sb5", {
        t "𝟱",
      }),
      s("sb6", {
        t "𝟲",
      }),
      s("sb7", {
        t "𝟳",
      }),
      s("sb8", {
        t "𝟴",
      }),
      s("sb9", {
        t "𝟵",
      }),
      s("bub", {
        t "•",
      }),
      s("buw", {
        t "◦",
      }),
      s("but", {
        t "‣",
      }),
      s("bumpeq", {
        t "≏",
      }),
      s("bu", {
        t "•",
      }),
      s("biohazard", {
        t "☣",
      }),
      s("bihimp", {
        t "⇔",
      }),
      s("bigcap", {
        t "⋂",
      }),
      s("bigcirc", {
        t "◯",
      }),
      s("bigcoprod", {
        t "∐",
      }),
      s("bigcup", {
        t "⋃",
      }),
      s("bigglb", {
        t "⨅",
      }),
      s("biginf", {
        t "⨅",
      }),
      s("bigjoin", {
        t "⨆",
      }),
      s("biglub", {
        t "⨆",
      }),
      s("bigmeet", {
        t "⨅",
      }),
      s("bigsqcap", {
        t "⨅",
      }),
      s("bigsqcup", {
        t "⨆",
      }),
      s("bigstar", {
        t "★",
      }),
      s("bigsup", {
        t "⨆",
      }),
      s("bigtriangledown", {
        t "▽",
      }),
      s("bigtriangleup", {
        t "△",
      }),
      s("bigvee", {
        t "⋁",
      }),
      s("bigwedge", {
        t "⋀",
      }),
      s("beta", {
        t "β",
      }),
      s("beth", {
        t "ℶ",
      }),
      s("between", {
        t "≬",
      }),
      s("because", {
        t "∵",
      }),
      s("backcong", {
        t "≌",
      }),
      s("backepsilon", {
        t "∍",
      }),
      s("backprime", {
        t "‵",
      }),
      s("backsimeq", {
        t "⋍",
      }),
      s("backsim", {
        t "∽",
      }),
      s("barwedge", {
        t "⊼",
      }),
      s("blacklozenge", {
        t "✦",
      }),
      s("blacksquare", {
        t "▪",
      }),
      s("blacksmiley", {
        t "☻",
      }),
      s("blacktriangledown", {
        t "▾",
      }),
      s("blacktriangleleft", {
        t "◂",
      }),
      s("blacktriangleright", {
        t "▸",
      }),
      s("blacktriangle", {
        t "▴",
      }),
      s("bot", {
        t "⊥",
      }),
      s("^bot", {
        t "ᗮ",
      }),
      s("bowtie", {
        t "⋈",
      }),
      s("boxminus", {
        t "⊟",
      }),
      s("boxmid", {
        t "◫",
      }),
      s("hcomp", {
        t "◫",
      }),
      s("boxplus", {
        t "⊞",
      }),
      s("boxtimes", {
        t "⊠",
      }),
      s("join", {
        t "⊔",
      }),
      s("r-2", {
        t "⇉",
      }),
      s("r-3", {
        t "⇶",
      }),
      s("r-l-", {
        t "⇄",
      }),
      s("r--", {
        t "⟶",
      }),
      s("r-n", {
        t "↛",
      }),
      s("r-|", {
        t "↦",
      }),
      s("r->", {
        t "↣",
      }),
      s("r-o", {
        t "⊸",
      }),
      s("r-", {
        t "→",
      }),
      s("r==", {
        t "⇛",
      }),
      s("r=n", {
        t "⇏",
      }),
      s("r=", {
        t "⇒",
      }),
      s("r~", {
        t "↝",
      }),
      s("rr-", {
        t "↠",
      }),
      s("reb", {
        t "▬",
      }),
      s("rew", {
        t "▭",
      }),
      s("real", {
        t "ℝ",
      }),
      s("registered", {
        t "®",
      }),
      s("re", {
        t "▬",
      }),
      s("rbag", {
        t "⟆",
      }),
      s("rat", {
        t "ℚ",
      }),
      s("radioactive", {
        t "☢",
      }),
      s("rrbracket", {
        t "〛",
      }),
      s("rangle", {
        t "⟩",
      }),
      s("rq", {
        t "’",
      }),
      s("rightarrowtail", {
        t "↣",
      }),
      s("rightarrow", {
        t "→",
      }),
      s("rightharpoondown", {
        t "⇁",
      }),
      s("rightharpoonup", {
        t "⇀",
      }),
      s("rightleftarrows", {
        t "⇄",
      }),
      s("rightleftharpoons", {
        t "⇌",
      }),
      s("rightrightarrows", {
        t "⇉",
      }),
      s("rightthreetimes", {
        t "⋌",
      }),
      s("risingdotseq", {
        t "≓",
      }),
      s("ruble", {
        t "₽",
      }),
      s("rupee", {
        t "₨",
      }),
      s("rho", {
        t "ρ",
      }),
      s("rhd", {
        t "▷",
      }),
      s("rceil", {
        t "⌉",
      }),
      s("rfloor", {
        t "⌋",
      }),
      s("rtimes", {
        t "⋊",
      }),
      s("rdq", {
        t "”",
      }),
      s("rdata", {
        t "》",
      }),
      s("functor", {
        t "⥤",
      }),
      s("fun", {
        t "λ",
      }),
      s("f<<", {
        t "«",
      }),
      s("f>>", {
        t "»",
      }),
      s("f<", {
        t "‹",
      }),
      s("f>", {
        t "›",
      }),
      s("finprod", {
        t "∏ᶠ",
      }),
      s("finsum", {
        t "∑ᶠ",
      }),
      s("frac12", {
        t "½",
      }),
      s("frac13", {
        t "⅓",
      }),
      s("frac14", {
        t "¼",
      }),
      s("frac15", {
        t "⅕",
      }),
      s("frac16", {
        t "⅙",
      }),
      s("frac18", {
        t "⅛",
      }),
      s("frac1", {
        t "⅟",
      }),
      s("frac23", {
        t "⅔",
      }),
      s("frac25", {
        t "⅖",
      }),
      s("frac34", {
        t "¾",
      }),
      s("frac35", {
        t "⅗",
      }),
      s("frac38", {
        t "⅜",
      }),
      s("frac45", {
        t "⅘",
      }),
      s("frac56", {
        t "⅚",
      }),
      s("frac58", {
        t "⅝",
      }),
      s("frac78", {
        t "⅞",
      }),
      s("frac", {
        t "¼",
      }),
      s("frown", {
        t "⌢",
      }),
      s("frqq", {
        t "»",
      }),
      s("frq", {
        t "›",
      }),
      s("female", {
        t "♀",
      }),
      s("fei", {
        t "ϥ",
      }),
      s("facsimile", {
        t "℻",
      }),
      s("fallingdotseq", {
        t "≒",
      }),
      s("flat", {
        t "♭",
      }),
      s("flqq", {
        t "«",
      }),
      s("flq", {
        t "‹",
      }),
      s("forall", {
        t "∀",
      }),
      s(")b", {
        t "⟆",
      }),
      s("[[", {
        t "⟦",
      }),
      s("]]", {
        t "⟧",
      }),
      s("{{", {
        t "⦃",
      }),
      s("}}", {
        t "⦄",
      }),
      s("((", {
        t "⸨",
      }),
      s("))", {
        t "⸩",
      }),
      s("([", {
        t "⟮",
      }),
      s("])", {
        t "⟯",
      }),
      s("Xi", {
        t "Ξ",
      }),
      s("Nat", {
        t "ℕ",
      }),
      s("Nu", {
        t "Ν",
      }),
      s("Zeta", {
        t "Ζ",
      }),
      s("Rat", {
        t "ℚ",
      }),
      s("Real", {
        t "ℝ",
      }),
      s("Re", {
        t "ℜ",
      }),
      s("Rho", {
        t "Ρ",
      }),
      s("Rightarrow", {
        t "⇒",
      }),
      s("Rrightarrow", {
        t "⇛",
      }),
      s("Rsh", {
        t "↱",
      }),
      s("Fei", {
        t "Ϥ",
      }),
      s("Frowny", {
        t "☹",
      }),
      s("Hori", {
        t "Ϩ",
      }),
      s("Heta", {
        t "Ͱ",
      }),
      s("Khei", {
        t "Ϧ",
      }),
      s("Koppa", {
        t "Ϟ",
      }),
      s("Kappa", {
        t "Κ",
      }),
      s("^a", {
        t "ᵃ",
      }),
      s("^b", {
        t "ᵇ",
      }),
      s("^c", {
        t "ᶜ",
      }),
      s("^d", {
        t "ᵈ",
      }),
      s("^e", {
        t "ᵉ",
      }),
      s("^f", {
        t "ᶠ",
      }),
      s("^g", {
        t "ᵍ",
      }),
      s("^h", {
        t "ʰ",
      }),
      s("^i", {
        t "ⁱ",
      }),
      s("^j", {
        t "ʲ",
      }),
      s("^k", {
        t "ᵏ",
      }),
      s("^l", {
        t "ˡ",
      }),
      s("^m", {
        t "ᵐ",
      }),
      s("^n", {
        t "ⁿ",
      }),
      s("^o", {
        t "ᵒ",
      }),
      s("^p", {
        t "ᵖ",
      }),
      s("^r", {
        t "ʳ",
      }),
      s("^s", {
        t "ˢ",
      }),
      s("^t", {
        t "ᵗ",
      }),
      s("^u", {
        t "ᵘ",
      }),
      s("^v", {
        t "ᵛ",
      }),
      s("^w", {
        t "ʷ",
      }),
      s("^x", {
        t "ˣ",
      }),
      s("^y", {
        t "ʸ",
      }),
      s("^z", {
        t "ᶻ",
      }),
      s("^A", {
        t "ᴬ",
      }),
      s("^B", {
        t "ᴮ",
      }),
      s("^D", {
        t "ᴰ",
      }),
      s("^E", {
        t "ᴱ",
      }),
      s("^G", {
        t "ᴳ",
      }),
      s("^H", {
        t "ᴴ",
      }),
      s("^I", {
        t "ᴵ",
      }),
      s("^J", {
        t "ᴶ",
      }),
      s("^K", {
        t "ᴷ",
      }),
      s("^L", {
        t "ᴸ",
      }),
      s("^M", {
        t "ᴹ",
      }),
      s("^N", {
        t "ᴺ",
      }),
      s("^O", {
        t "ᴼ",
      }),
      s("^P", {
        t "ᴾ",
      }),
      s("^R", {
        t "ᴿ",
      }),
      s("^T", {
        t "ᵀ",
      }),
      s("^U", {
        t "ᵁ",
      }),
      s("^V", {
        t "ⱽ",
      }),
      s("^W", {
        t "ᵂ",
      }),
      s("^0", {
        t "⁰",
      }),
      s("^1", {
        t "¹",
      }),
      s("^2", {
        t "²",
      }),
      s("^3", {
        t "³",
      }),
      s("^4", {
        t "⁴",
      }),
      s("^5", {
        t "⁵",
      }),
      s("^6", {
        t "⁶",
      }),
      s("^7", {
        t "⁷",
      }),
      s("^8", {
        t "⁸",
      }),
      s("^9", {
        t "⁹",
      }),
      s("^)", {
        t "⁾",
      }),
      s("^(", {
        t "⁽",
      }),
      s("^=", {
        t "⁼",
      }),
      s("^+", {
        t "⁺",
      }),
      s("^o_", {
        t "º",
      }),
      s("^-", {
        t "⁻",
      }),
      s("^a_", {
        t "ª",
      }),
      s("^uhook", {
        t "ꭟ",
      }),
      s("^ubar", {
        t "ᶶ",
      }),
      s("^upsilon", {
        t "ᶷ",
      }),
      s("^ltilde", {
        t "ꭞ",
      }),
      s("^ls", {
        t "ꭝ",
      }),
      s("^lhook", {
        t "ᶪ",
      }),
      s("^lretroflexhook", {
        t "ᶩ",
      }),
      s("^oe", {
        t "ꟹ",
      }),
      s("^heng", {
        t "ꭜ",
      }),
      s("^hhook", {
        t "ʱ",
      }),
      s("^hwithhook", {
        t "ʱ",
      }),
      s("^Hstroke", {
        t "ꟸ",
      }),
      s("^theta", {
        t "ᶿ",
      }),
      s("^turnedv", {
        t "ᶺ",
      }),
      s("^turnedmleg", {
        t "ᶭ",
      }),
      s("^turnedm", {
        t "ᵚ",
      }),
      s("^turnedh", {
        t "ᶣ",
      }),
      s("^turnedalpha", {
        t "ᶛ",
      }),
      s("^turnedae", {
        t "ᵆ",
      }),
      s("^turneda", {
        t "ᵄ",
      }),
      s("^turnedi", {
        t "ᵎ",
      }),
      s("^turnede", {
        t "ᵌ",
      }),
      s("^turnedrhook", {
        t "ʵ",
      }),
      s("^turnedrwithhook", {
        t "ʵ",
      }),
      s("^turnedr", {
        t "ʴ",
      }),
      s("^twithpalatalhook", {
        t "ᶵ",
      }),
      s("^otop", {
        t "ᵔ",
      }),
      s("^ezh", {
        t "ᶾ",
      }),
      s("^esh", {
        t "ᶴ",
      }),
      s("^eth", {
        t "ᶞ",
      }),
      s("^eng", {
        t "ᵑ",
      }),
      s("^zcurl", {
        t "ᶽ",
      }),
      s("^zretroflexhook", {
        t "ᶼ",
      }),
      s("^vhook", {
        t "ᶹ",
      }),
      s("^Ismall", {
        t "ᶦ",
      }),
      s("^Lsmall", {
        t "ᶫ",
      }),
      s("^Nsmall", {
        t "ᶰ",
      }),
      s("^Usmall", {
        t "ᶸ",
      }),
      s("^Istroke", {
        t "ᶧ",
      }),
      s("^Rinverted", {
        t "ʶ",
      }),
      s("^ccurl", {
        t "ᶝ",
      }),
      s("^chi", {
        t "ᵡ",
      }),
      s("^shook", {
        t "ᶳ",
      }),
      s("^gscript", {
        t "ᶢ",
      }),
      s("^schwa", {
        t "ᵊ",
      }),
      s("^usideways", {
        t "ᵙ",
      }),
      s("^phi", {
        t "ᶲ",
      }),
      s("^obarred", {
        t "ᶱ",
      }),
      s("^beta", {
        t "ᵝ",
      }),
      s("^obottom", {
        t "ᵕ",
      }),
      s("^nretroflexhook", {
        t "ᶯ",
      }),
      s("^nlefthook", {
        t "ᶮ",
      }),
      s("^mhook", {
        t "ᶬ",
      }),
      s("^jtail", {
        t "ᶨ",
      }),
      s("^iota", {
        t "ᶥ",
      }),
      s("^istroke", {
        t "ᶤ",
      }),
      s("^ereversedopen", {
        t "ᶟ",
      }),
      s("^stop", {
        t "ˤ",
      }),
      s("^varphi", {
        t "ᵠ",
      }),
      s("^vargamma", {
        t "ᵞ",
      }),
      s("^gamma", {
        t "ˠ",
      }),
      s("^ain", {
        t "ᵜ",
      }),
      s("^alpha", {
        t "ᵅ",
      }),
      s("^oopen", {
        t "ᵓ",
      }),
      s("^eopen", {
        t "ᵋ",
      }),
      s("^Ou", {
        t "ᴽ",
      }),
      s("^Nreversed", {
        t "ᴻ",
      }),
      s("^Ereversed", {
        t "ᴲ",
      }),
      s("^Bbarred", {
        t "ᴯ",
      }),
      s("^Ae", {
        t "ᴭ",
      }),
      s("^SM", {
        t "℠",
      }),
      s("^TEL", {
        t "℡",
      }),
      s("^TM", {
        t "™",
      }),
      s("_a", {
        t "ₐ",
      }),
      s("_e", {
        t "ₑ",
      }),
      s("_h", {
        t "ₕ",
      }),
      s("_i", {
        t "ᵢ",
      }),
      s("_j", {
        t "ⱼ",
      }),
      s("_k", {
        t "ₖ",
      }),
      s("_l", {
        t "ₗ",
      }),
      s("_m", {
        t "ₘ",
      }),
      s("_n", {
        t "ₙ",
      }),
      s("_o", {
        t "ₒ",
      }),
      s("_p", {
        t "ₚ",
      }),
      s("_r", {
        t "ᵣ",
      }),
      s("_s", {
        t "ₛ",
      }),
      s("_t", {
        t "ₜ",
      }),
      s("_u", {
        t "ᵤ",
      }),
      s("_v", {
        t "ᵥ",
      }),
      s("_x", {
        t "ₓ",
      }),
      s("_0", {
        t "₀",
      }),
      s("_1", {
        t "₁",
      }),
      s("_2", {
        t "₂",
      }),
      s("_3", {
        t "₃",
      }),
      s("_4", {
        t "₄",
      }),
      s("_5", {
        t "₅",
      }),
      s("_6", {
        t "₆",
      }),
      s("_7", {
        t "₇",
      }),
      s("_8", {
        t "₈",
      }),
      s("_9", {
        t "₉",
      }),
      s("_)", {
        t "₎",
      }),
      s("_(", {
        t "₍",
      }),
      s("_=", {
        t "₌",
      }),
      s("_+", {
        t "₊",
      }),
      s("_-", {
        t "₋",
      }),
      s("!!", {
        t "‼",
      }),
      s("!?", {
        t "⁉",
      }),
      s("San", {
        t "Ϻ",
      }),
      s("Sampi", {
        t "Ϡ",
      }),
      s("Sho", {
        t "Ϸ",
      }),
      s("Shima", {
        t "Ϭ",
      }),
      s("Shei", {
        t "Ϣ",
      }),
      s("Stigma", {
        t "Ϛ",
      }),
      s("Sigma", {
        t "Σ",
      }),
      s("Subset", {
        t "⋐",
      }),
      s("Supset", {
        t "⋑",
      }),
      s("Smiley", {
        t "☺",
      }),
      s("Psi", {
        t "Ψ",
      }),
      s("Phi", {
        t "Φ",
      }),
      s("Pi", {
        t "Π",
      }),
      s("Pi0", {
        t "Π₀",
      }),
      s("P0", {
        t "Π₀",
      }),
      s("Pi_0", {
        t "Π₀",
      }),
      s("P_0", {
        t "Π₀",
      }),
      s("bfA", {
        t "𝐀",
      }),
      s("bfB", {
        t "𝐁",
      }),
      s("bfC", {
        t "𝐂",
      }),
      s("bfD", {
        t "𝐃",
      }),
      s("bfE", {
        t "𝐄",
      }),
      s("bfF", {
        t "𝐅",
      }),
      s("bfG", {
        t "𝐆",
      }),
      s("bfH", {
        t "𝐇",
      }),
      s("bfI", {
        t "𝐈",
      }),
      s("bfJ", {
        t "𝐉",
      }),
      s("bfK", {
        t "𝐊",
      }),
      s("bfL", {
        t "𝐋",
      }),
      s("bfM", {
        t "𝐌",
      }),
      s("bfN", {
        t "𝐍",
      }),
      s("bfO", {
        t "𝐎",
      }),
      s("bfP", {
        t "𝐏",
      }),
      s("bfQ", {
        t "𝐐",
      }),
      s("bfR", {
        t "𝐑",
      }),
      s("bfS", {
        t "𝐒",
      }),
      s("bfT", {
        t "𝐓",
      }),
      s("bfU", {
        t "𝐔",
      }),
      s("bfV", {
        t "𝐕",
      }),
      s("bfW", {
        t "𝐖",
      }),
      s("bfX", {
        t "𝐗",
      }),
      s("bfY", {
        t "𝐘",
      }),
      s("bfZ", {
        t "𝐙",
      }),
      s("bfa", {
        t "𝐚",
      }),
      s("bfb", {
        t "𝐛",
      }),
      s("bfc", {
        t "𝐜",
      }),
      s("bfd", {
        t "𝐝",
      }),
      s("bfe", {
        t "𝐞",
      }),
      s("bff", {
        t "𝐟",
      }),
      s("bfg", {
        t "𝐠",
      }),
      s("bfh", {
        t "𝐡",
      }),
      s("bfi", {
        t "𝐢",
      }),
      s("bfj", {
        t "𝐣",
      }),
      s("bfk", {
        t "𝐤",
      }),
      s("bfl", {
        t "𝐥",
      }),
      s("bfm", {
        t "𝐦",
      }),
      s("bfn", {
        t "𝐧",
      }),
      s("bfo", {
        t "𝐨",
      }),
      s("bfp", {
        t "𝐩",
      }),
      s("bfq", {
        t "𝐪",
      }),
      s("bfr", {
        t "𝐫",
      }),
      s("bfs", {
        t "𝐬",
      }),
      s("bft", {
        t "𝐭",
      }),
      s("bfu", {
        t "𝐮",
      }),
      s("bfv", {
        t "𝐯",
      }),
      s("bfw", {
        t "𝐰",
      }),
      s("bfx", {
        t "𝐱",
      }),
      s("bfy", {
        t "𝐲",
      }),
      s("bfz", {
        t "𝐳",
      }),
      s("MiA", {
        t "𝐴",
      }),
      s("MiB", {
        t "𝐵",
      }),
      s("MiC", {
        t "𝐶",
      }),
      s("MiD", {
        t "𝐷",
      }),
      s("MiE", {
        t "𝐸",
      }),
      s("MiF", {
        t "𝐹",
      }),
      s("MiG", {
        t "𝐺",
      }),
      s("MiH", {
        t "𝐻",
      }),
      s("MiI", {
        t "𝐼",
      }),
      s("MiJ", {
        t "𝐽",
      }),
      s("MiK", {
        t "𝐾",
      }),
      s("MiL", {
        t "𝐿",
      }),
      s("MiM", {
        t "𝑀",
      }),
      s("MiN", {
        t "𝑁",
      }),
      s("MiO", {
        t "𝑂",
      }),
      s("MiP", {
        t "𝑃",
      }),
      s("MiQ", {
        t "𝑄",
      }),
      s("MiR", {
        t "𝑅",
      }),
      s("MiS", {
        t "𝑆",
      }),
      s("MiT", {
        t "𝑇",
      }),
      s("MiU", {
        t "𝑈",
      }),
      s("MiV", {
        t "𝑉",
      }),
      s("MiW", {
        t "𝑊",
      }),
      s("MiX", {
        t "𝑋",
      }),
      s("MiY", {
        t "𝑌",
      }),
      s("MiZ", {
        t "𝑍",
      }),
      s("Mia", {
        t "𝑎",
      }),
      s("Mib", {
        t "𝑏",
      }),
      s("Mic", {
        t "𝑐",
      }),
      s("Mid", {
        t "𝑑",
      }),
      s("Mie", {
        t "𝑒",
      }),
      s("Mif", {
        t "𝑓",
      }),
      s("Mig", {
        t "𝑔",
      }),
      s("Mii", {
        t "𝑖",
      }),
      s("Mij", {
        t "𝑗",
      }),
      s("Mik", {
        t "𝑘",
      }),
      s("Mil", {
        t "𝑙",
      }),
      s("Mim", {
        t "𝑚",
      }),
      s("Min", {
        t "𝑛",
      }),
      s("Mio", {
        t "𝑜",
      }),
      s("Mip", {
        t "𝑝",
      }),
      s("Miq", {
        t "𝑞",
      }),
      s("Mir", {
        t "𝑟",
      }),
      s("Mis", {
        t "𝑠",
      }),
      s("Mit", {
        t "𝑡",
      }),
      s("Miu", {
        t "𝑢",
      }),
      s("Miv", {
        t "𝑣",
      }),
      s("Miw", {
        t "𝑤",
      }),
      s("Mix", {
        t "𝑥",
      }),
      s("Miy", {
        t "𝑦",
      }),
      s("Miz", {
        t "𝑧",
      }),
      s("MIA", {
        t "𝑨",
      }),
      s("MIB", {
        t "𝑩",
      }),
      s("MIC", {
        t "𝑪",
      }),
      s("MID", {
        t "𝑫",
      }),
      s("MIE", {
        t "𝑬",
      }),
      s("MIF", {
        t "𝑭",
      }),
      s("MIG", {
        t "𝑮",
      }),
      s("MIH", {
        t "𝑯",
      }),
      s("MII", {
        t "𝑰",
      }),
      s("MIJ", {
        t "𝑱",
      }),
      s("MIK", {
        t "𝑲",
      }),
      s("MIL", {
        t "𝑳",
      }),
      s("MIM", {
        t "𝑴",
      }),
      s("MIN", {
        t "𝑵",
      }),
      s("MIO", {
        t "𝑶",
      }),
      s("MIP", {
        t "𝑷",
      }),
      s("MIQ", {
        t "𝑸",
      }),
      s("MIR", {
        t "𝑹",
      }),
      s("MIS", {
        t "𝑺",
      }),
      s("MIT", {
        t "𝑻",
      }),
      s("MIU", {
        t "𝑼",
      }),
      s("MIV", {
        t "𝑽",
      }),
      s("MIW", {
        t "𝑾",
      }),
      s("MIX", {
        t "𝑿",
      }),
      s("MIY", {
        t "𝒀",
      }),
      s("MIZ", {
        t "𝒁",
      }),
      s("MIa", {
        t "𝒂",
      }),
      s("MIb", {
        t "𝒃",
      }),
      s("MIc", {
        t "𝒄",
      }),
      s("MId", {
        t "𝒅",
      }),
      s("MIe", {
        t "𝒆",
      }),
      s("MIf", {
        t "𝒇",
      }),
      s("MIg", {
        t "𝒈",
      }),
      s("MIh", {
        t "𝒉",
      }),
      s("MIi", {
        t "𝒊",
      }),
      s("MIj", {
        t "𝒋",
      }),
      s("MIk", {
        t "𝒌",
      }),
      s("MIl", {
        t "𝒍",
      }),
      s("MIm", {
        t "𝒎",
      }),
      s("MIn", {
        t "𝒏",
      }),
      s("MIo", {
        t "𝒐",
      }),
      s("MIp", {
        t "𝒑",
      }),
      s("MIq", {
        t "𝒒",
      }),
      s("MIr", {
        t "𝒓",
      }),
      s("MIs", {
        t "𝒔",
      }),
      s("MIt", {
        t "𝒕",
      }),
      s("MIu", {
        t "𝒖",
      }),
      s("MIv", {
        t "𝒗",
      }),
      s("MIw", {
        t "𝒘",
      }),
      s("MIx", {
        t "𝒙",
      }),
      s("MIy", {
        t "𝒚",
      }),
      s("MIz", {
        t "𝒛",
      }),
      s("McA", {
        t "𝒜",
      }),
      s("McB", {
        t "ℬ",
      }),
      s("McC", {
        t "𝒞",
      }),
      s("McD", {
        t "𝒟",
      }),
      s("McE", {
        t "ℰ",
      }),
      s("McF", {
        t "ℱ",
      }),
      s("McG", {
        t "𝒢",
      }),
      s("McH", {
        t "ℋ",
      }),
      s("McI", {
        t "ℐ",
      }),
      s("McJ", {
        t "𝒥",
      }),
      s("McK", {
        t "𝒦",
      }),
      s("McL", {
        t "ℒ",
      }),
      s("McM", {
        t "ℳ",
      }),
      s("McN", {
        t "𝒩",
      }),
      s("McO", {
        t "𝒪",
      }),
      s("McP", {
        t "𝒫",
      }),
      s("McQ", {
        t "𝒬",
      }),
      s("McR", {
        t "ℛ",
      }),
      s("McS", {
        t "𝒮",
      }),
      s("McT", {
        t "𝒯",
      }),
      s("McU", {
        t "𝒰",
      }),
      s("McV", {
        t "𝒱",
      }),
      s("McW", {
        t "𝒲",
      }),
      s("McX", {
        t "𝒳",
      }),
      s("McY", {
        t "𝒴",
      }),
      s("McZ", {
        t "𝒵",
      }),
      s("Mca", {
        t "𝒶",
      }),
      s("Mcb", {
        t "𝒷",
      }),
      s("Mcc", {
        t "𝒸",
      }),
      s("Mcd", {
        t "𝒹",
      }),
      s("Mce", {
        t "ℯ",
      }),
      s("Mcf", {
        t "𝒻",
      }),
      s("Mcg", {
        t "ℊ",
      }),
      s("Mch", {
        t "𝒽",
      }),
      s("Mci", {
        t "𝒾",
      }),
      s("Mcj", {
        t "𝒿",
      }),
      s("Mck", {
        t "𝓀",
      }),
      s("Mcl", {
        t "𝓁",
      }),
      s("Mcm", {
        t "𝓂",
      }),
      s("Mcn", {
        t "𝓃",
      }),
      s("Mco", {
        t "ℴ",
      }),
      s("Mcp", {
        t "𝓅",
      }),
      s("Mcq", {
        t "𝓆",
      }),
      s("Mcr", {
        t "𝓇",
      }),
      s("Mcs", {
        t "𝓈",
      }),
      s("Mct", {
        t "𝓉",
      }),
      s("Mcu", {
        t "𝓊",
      }),
      s("Mcv", {
        t "𝓋",
      }),
      s("Mcw", {
        t "𝓌",
      }),
      s("Mcx", {
        t "𝓍",
      }),
      s("Mcy", {
        t "𝓎",
      }),
      s("Mcz", {
        t "𝓏",
      }),
      s("MCA", {
        t "𝓐",
      }),
      s("MCB", {
        t "𝓑",
      }),
      s("MCC", {
        t "𝓒",
      }),
      s("MCD", {
        t "𝓓",
      }),
      s("MCE", {
        t "𝓔",
      }),
      s("MCF", {
        t "𝓕",
      }),
      s("MCG", {
        t "𝓖",
      }),
      s("MCH", {
        t "𝓗",
      }),
      s("MCI", {
        t "𝓘",
      }),
      s("MCJ", {
        t "𝓙",
      }),
      s("MCK", {
        t "𝓚",
      }),
      s("MCL", {
        t "𝓛",
      }),
      s("MCM", {
        t "𝓜",
      }),
      s("MCN", {
        t "𝓝",
      }),
      s("MCO", {
        t "𝓞",
      }),
      s("MCP", {
        t "𝓟",
      }),
      s("MCQ", {
        t "𝓠",
      }),
      s("MCR", {
        t "𝓡",
      }),
      s("MCS", {
        t "𝓢",
      }),
      s("MCT", {
        t "𝓣",
      }),
      s("MCU", {
        t "𝓤",
      }),
      s("MCV", {
        t "𝓥",
      }),
      s("MCW", {
        t "𝓦",
      }),
      s("MCX", {
        t "𝓧",
      }),
      s("MCY", {
        t "𝓨",
      }),
      s("MCZ", {
        t "𝓩",
      }),
      s("MCa", {
        t "𝓪",
      }),
      s("MCb", {
        t "𝓫",
      }),
      s("MCc", {
        t "𝓬",
      }),
      s("MCd", {
        t "𝓭",
      }),
      s("MCe", {
        t "𝓮",
      }),
      s("MCf", {
        t "𝓯",
      }),
      s("MCg", {
        t "𝓰",
      }),
      s("MCh", {
        t "𝓱",
      }),
      s("MCi", {
        t "𝓲",
      }),
      s("MCj", {
        t "𝓳",
      }),
      s("MCk", {
        t "𝓴",
      }),
      s("MCl", {
        t "𝓵",
      }),
      s("MCm", {
        t "𝓶",
      }),
      s("MCn", {
        t "𝓷",
      }),
      s("MCo", {
        t "𝓸",
      }),
      s("MCp", {
        t "𝓹",
      }),
      s("MCq", {
        t "𝓺",
      }),
      s("MCr", {
        t "𝓻",
      }),
      s("MCs", {
        t "𝓼",
      }),
      s("MCt", {
        t "𝓽",
      }),
      s("MCu", {
        t "𝓾",
      }),
      s("MCv", {
        t "𝓿",
      }),
      s("MCw", {
        t "𝔀",
      }),
      s("MCx", {
        t "𝔁",
      }),
      s("MCy", {
        t "𝔂",
      }),
      s("MCz", {
        t "𝔃",
      }),
      s("MfA", {
        t "𝔄",
      }),
      s("MfB", {
        t "𝔅",
      }),
      s("MfC", {
        t "ℭ",
      }),
      s("MfD", {
        t "𝔇",
      }),
      s("MfE", {
        t "𝔈",
      }),
      s("MfF", {
        t "𝔉",
      }),
      s("MfG", {
        t "𝔊",
      }),
      s("MfH", {
        t "ℌ",
      }),
      s("MfI", {
        t "ℑ",
      }),
      s("MfJ", {
        t "𝔍",
      }),
      s("MfK", {
        t "𝔎",
      }),
      s("MfL", {
        t "𝔏",
      }),
      s("MfM", {
        t "𝔐",
      }),
      s("MfN", {
        t "𝔑",
      }),
      s("MfO", {
        t "𝔒",
      }),
      s("MfP", {
        t "𝔓",
      }),
      s("MfQ", {
        t "𝔔",
      }),
      s("MfR", {
        t "ℜ",
      }),
      s("MfS", {
        t "𝔖",
      }),
      s("MfT", {
        t "𝔗",
      }),
      s("MfU", {
        t "𝔘",
      }),
      s("MfV", {
        t "𝔙",
      }),
      s("MfW", {
        t "𝔚",
      }),
      s("MfX", {
        t "𝔛",
      }),
      s("MfY", {
        t "𝔜",
      }),
      s("MfZ", {
        t "ℨ",
      }),
      s("Mfa", {
        t "𝔞",
      }),
      s("Mfb", {
        t "𝔟",
      }),
      s("Mfc", {
        t "𝔠",
      }),
      s("Mfd", {
        t "𝔡",
      }),
      s("Mfe", {
        t "𝔢",
      }),
      s("Mff", {
        t "𝔣",
      }),
      s("Mfg", {
        t "𝔤",
      }),
      s("Mfh", {
        t "𝔥",
      }),
      s("Mfi", {
        t "𝔦",
      }),
      s("Mfj", {
        t "𝔧",
      }),
      s("Mfk", {
        t "𝔨",
      }),
      s("Mfl", {
        t "𝔩",
      }),
      s("Mfm", {
        t "𝔪",
      }),
      s("Mfn", {
        t "𝔫",
      }),
      s("Mfo", {
        t "𝔬",
      }),
      s("Mfp", {
        t "𝔭",
      }),
      s("Mfq", {
        t "𝔮",
      }),
      s("Mfr", {
        t "𝔯",
      }),
      s("Mfs", {
        t "𝔰",
      }),
      s("Mft", {
        t "𝔱",
      }),
      s("Mfu", {
        t "𝔲",
      }),
      s("Mfv", {
        t "𝔳",
      }),
      s("Mfw", {
        t "𝔴",
      }),
      s("Mfx", {
        t "𝔵",
      }),
      s("Mfy", {
        t "𝔶",
      }),
      s("Mfz", {
        t "𝔷",
      }),
      s("yen", {
        t "¥",
      }),
      s("varrho", {
        t "ϱ",
      }),
      s("varkappa", {
        t "ϰ",
      }),
      s("varkai", {
        t "ϗ",
      }),
      s("varnothing", {
        t "∅",
      }),
      s("varpi", {
        t "ϖ",
      }),
      s("varphi", {
        t "ϕ",
      }),
      s("varprime", {
        t "′",
      }),
      s("varpropto", {
        t "∝",
      }),
      s("vartheta", {
        t "ϑ",
      }),
      s("vartriangleleft", {
        t "⊲",
      }),
      s("vartriangleright", {
        t "⊳",
      }),
      s("varbeta", {
        t "ϐ",
      }),
      s("varsigma", {
        t "ς",
      }),
      s("veebar", {
        t "⊻",
      }),
      s("vee", {
        t "∨",
      }),
      s("ve", {
        t "ě",
      }),
      s("vE", {
        t "Ě",
      }),
      s("vdash", {
        t "⊢",
      }),
      s("vdots", {
        t "⋮",
      }),
      s("vd", {
        t "ď",
      }),
      s("vDash", {
        t "⊨",
      }),
      s("vD", {
        t "Ď",
      }),
      s("vc", {
        t "č",
      }),
      s("vC", {
        t "Č",
      }),
      s("koppa", {
        t "ϟ",
      }),
      s("kip", {
        t "₭",
      }),
      s("ki", {
        t "į",
      }),
      s("kI", {
        t "Į",
      }),
      s("kelvin", {
        t "K",
      }),
      s("kappa", {
        t "κ",
      }),
      s("khei", {
        t "ϧ",
      }),
      s("warning", {
        t "⚠",
      }),
      s("won", {
        t "₩",
      }),
      s("wedge", {
        t "∧",
      }),
      s("wp", {
        t "℘",
      }),
      s("wr", {
        t "≀",
      }),
      s("Dei", {
        t "Ϯ",
      }),
      s("Delta", {
        t "Δ",
      }),
      s("Digamma", {
        t "Ϝ",
      }),
      s("Diamond", {
        t "◇",
      }),
      s("Downarrow", {
        t "⇓",
      }),
      s("DH", {
        t "Ð",
      }),
      s("zeta", {
        t "ζ",
      }),
      s("Eta", {
        t "Η",
      }),
      s("Epsilon", {
        t "Ε",
      }),
      s("Beta", {
        t "Β",
      }),
      s("Box", {
        t "□",
      }),
      s("Bumpeq", {
        t "≎",
      }),
      s("bbA", {
        t "𝔸",
      }),
      s("bbB", {
        t "𝔹",
      }),
      s("bbC", {
        t "ℂ",
      }),
      s("bbD", {
        t "𝔻",
      }),
      s("bbE", {
        t "𝔼",
      }),
      s("bbF", {
        t "𝔽",
      }),
      s("bbG", {
        t "𝔾",
      }),
      s("bbH", {
        t "ℍ",
      }),
      s("bbI", {
        t "𝕀",
      }),
      s("bbJ", {
        t "𝕁",
      }),
      s("bbK", {
        t "𝕂",
      }),
      s("bbL", {
        t "𝕃",
      }),
      s("bbM", {
        t "𝕄",
      }),
      s("bbN", {
        t "ℕ",
      }),
      s("bbO", {
        t "𝕆",
      }),
      s("bbP", {
        t "ℙ",
      }),
      s("bbQ", {
        t "ℚ",
      }),
      s("bbR", {
        t "ℝ",
      }),
      s("bbS", {
        t "𝕊",
      }),
      s("bbT", {
        t "𝕋",
      }),
      s("bbU", {
        t "𝕌",
      }),
      s("bbV", {
        t "𝕍",
      }),
      s("bbW", {
        t "𝕎",
      }),
      s("bbX", {
        t "𝕏",
      }),
      s("bbY", {
        t "𝕐",
      }),
      s("bbZ", {
        t "ℤ",
      }),
      s("bba", {
        t "𝕒",
      }),
      s("bbb", {
        t "𝕓",
      }),
      s("bbc", {
        t "𝕔",
      }),
      s("bbd", {
        t "𝕕",
      }),
      s("bbe", {
        t "𝕖",
      }),
      s("bbf", {
        t "𝕗",
      }),
      s("bbg", {
        t "𝕘",
      }),
      s("bbh", {
        t "𝕙",
      }),
      s("bbi", {
        t "𝕚",
      }),
      s("bbj", {
        t "𝕛",
      }),
      s("bbk", {
        t "𝕜",
      }),
      s("bbl", {
        t "𝕝",
      }),
      s("bbm", {
        t "𝕞",
      }),
      s("bbn", {
        t "𝕟",
      }),
      s("bbo", {
        t "𝕠",
      }),
      s("bbp", {
        t "𝕡",
      }),
      s("bbq", {
        t "𝕢",
      }),
      s("bbr", {
        t "𝕣",
      }),
      s("bbs", {
        t "𝕤",
      }),
      s("bbt", {
        t "𝕥",
      }),
      s("bbu", {
        t "𝕦",
      }),
      s("bbv", {
        t "𝕧",
      }),
      s("bbw", {
        t "𝕨",
      }),
      s("bbx", {
        t "𝕩",
      }),
      s("bby", {
        t "𝕪",
      }),
      s("bbz", {
        t "𝕫",
      }),
      s("Rge0", {
        t "ℝ≥0",
      }),
      s("R>=0", {
        t "ℝ≥0",
      }),
      s("nnreal", {
        t "ℝ≥0",
      }),
      s("ennreal", {
        t "ℝ≥0∞",
      }),
      s("enat", {
        t "ℕ∞",
      }),
      s("Zsqrt", {
        t "ℤ√",
      }),
      s("zsqrtd", {
        t "ℤ√",
      }),
      s("liel", {
        t "⁅",
      }),
      s("bracketl", {
        t "⁅",
      }),
      s("lier", {
        t "⁆",
      }),
      s("[-", {
        t "⁅",
      }),
      s("-]", {
        t "⁆",
      }),
      s("lsimplex", {
        t "⦋",
      }),
      s("rsimplex", {
        t "⦌",
      }),
      s("bracketr", {
        t "⁆",
      }),
      s("nhds", {
        t "𝓝",
      }),
      s("nbhds", {
        t "𝓝",
      }),
      s("X", {
        t "⨯",
      }),
      s("vectorproduct", {
        t "⨯",
      }),
      s("crossproduct", {
        t "⨯",
      }),
      s("xs", {
        t "×ˢ",
      }),
      s("coprod", {
        t "⨿",
      }),
      s("sigmaobj", {
        t "∐",
      }),
      s("xf", {
        t "×ᶠ",
      }),
      s("exf", {
        t "∃ᶠ",
      }),
      s("Yot", {
        t "Ϳ",
      }),
      s("goal", {
        t "⊢",
      }),
      s("Vdash", {
        t "⊩",
      }),
      s("Vert", {
        t "‖",
      }),
      s("Vvdash", {
        t "⊪",
      }),
      s("tiny", {
        t "⧾",
      }),
      s("miny", {
        t "⧿",
      }),
      s("heq", {
        t "≍",
      }),
      s("r!", {
        t "¡",
      }),
    })
  end,
}
