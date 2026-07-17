# Architecture Decision Records

Decisions about this Neovim configuration that are not obvious from the
code itself. One file per decision, written by the owner, in English.

- Naming: `NNNN-kebab-case-title.md`, numbered sequentially from `0001`.
- Format: copy `template.md`.
- A superseded ADR is never deleted; set its status to
  `Superseded by NNNN` and add the new one.
- An ADR gates its decision, as in `.emacs.d`: a decision-class change
  (policy, structure, tool adoption) takes effect only after the owner
  has written the ADR. Day-to-day configuration edits need no ADR.
  Claude updates CLAUDE.md and the skills only after the ADR exists.

## Planned ADRs

Awaiting write-up by the owner (these predate the gate: they were decided
on 2026-07-16 under an initial after-the-fact policy, which was flipped to
ADR-first on 2026-07-18):

- `0001` — Adopt the coaching regime: the owner writes all Lua
  configuration; Claude coaches and owns only the meta layer
  (CLAUDE.md, `.claude/skills/`, `bin/`, `docs/adr/`, later CI).
  Decision-class changes are gated on owner-written ADRs.
- `0002` — Verify the working tree standalone via `NVIM_APPNAME=nvim-dev`
  (`bin/nvim-dev` for interactive use, `bin/check` for the headless load
  check), because `~/.config/nvim` is a read-only Nix store copy pinned
  by dotfiles-mac.
