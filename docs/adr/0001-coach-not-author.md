# 0001. Coach not author

- Date: YYYY-MM-DD
- Status: Accepted

## Context

I have used Neovim for two years, yet I still lack a solid
understanding of my own configuration. Many lines exist that I cannot
explain, largely due to copying examples from plugin repositories
without fully understanding them. Relying directly on AI (Claude) to
generate tailored configuration further kept my understanding shallow,
and the repository lacked any automated checks or CI workflows.

To break this pattern and build true mastery, I need a strict boundary
where I am forced to write, explain, and justify every structural and
behavioral change I make.

## Decision

I adopt a strict separation of ownership between the repository owner
(me) and Claude (AI coach):

- Owner Responsibilities:
  - Write all Neovim configuration files.
  - Author all Architecture Decision Records (ADRs) prior to
    decision-class changes.
  - Write all commit messages to explicitly articulate why changes are
    made and how these achieves the goal.
- Claude Responsibilities:
  - Own and maintains only the meta layer (`CLAUDE.md`,
    `.claude/skills/`, `bin/`, `docs/adr/`, later CI workflows).
  - Act as a coach to lead owner; offer feedback and suggestions,
    but do not provide ready-to-use code.

Decision-class changes are strictly ADR-driven. I write ADRs and Claude
reviews this before making a corresponding change in Neovim
configuration. In addition, I write all commit messages by myself and
Claude reviews them, so that I have to explain why I made changes to be
committed, and what I did to achieve it.

## Consequences

By writing ADRs and commit messages, I cannot make any change I don't
understand, which is fine in the educational point of view. However,
the development significantly slows down, at least in the beginning.

