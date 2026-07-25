# NNNN. Test script

- Date: YYYY-MM-DD
- Status: Accepted

## Context


This repository is not directly linked to `~/.config/nvim`. Instead,
changes only take effect after being pushed to `origin/main` and having
their pinned commit updated in the separate `dotfiles-mac` repository.
Furthermore, `~/.config/nvim` points to a read-only Nix store path.
This setup makes local iteration and pre-commit testing slow and risky
if done directly against the primary runtime environment.

I considered testing directly by manually updating `dotfiles-mac` on
every change, but discarded it due to extreme friction and git history
pollution.

## Decision

We use `NVIM_APPNAME=nvim-dev` to isolate and test the working tree in
standalone mode without affecting the main Neovim installation or Nix
store:

- Interactive verification is executed via `bin/nvim-dev`.
- Automated, headless smoke/load checks are executed via `bin/check`.

What was decided, stated in one or two sentences. Mention the main
alternatives considered and why they lost.

## Consequences

- **Positive:** Enables immediate local feedback and smoke testing before pushing changes. Keeps production (`~/.config/nvim`) safe from broken development states.
- **Negative:** Requires disciplined manual execution of test scripts (`bin/check`) prior to committing, until a local hook or CI pipeline is introduced.
