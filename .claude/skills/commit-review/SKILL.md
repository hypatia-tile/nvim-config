---
name: commit-review
description: Coaching-style review of a commit message written by the owner. Use when the owner asks for feedback on a commit message or invokes /commit-review. Reviews the HEAD commit message by default; an argument may name a commit or contain a draft message.
---

# Commit Message Review (coaching mode)

The owner writes every commit message themselves. The priority goal is
that the owner can express their current understanding and intent in
their own words — clumsy English is acceptable; borrowed sentences are
not. Never write the message or any part of its content for them.

## 1. Determine the target

1. No argument: review the message of `HEAD`
   (`git log -1 --format=%B`).
2. Argument names a commit: review that commit's message.
3. Argument is draft text: review the draft (the owner has not
   committed yet).

Also look at the corresponding diff (`git show <commit> --stat` and the
patch as needed): the message can only be judged against what actually
changed.

## 2. Form check (direct corrections allowed)

These are mechanics, not the learning goal, so point them out directly
with the correction:

- Typos and grammar errors that block or distort the meaning.
- Conventional Commits format: `type(scope): subject`, valid type,
  imperative subject.
- Layout: blank line after the subject, body wrapped near 72 columns.

Do NOT polish style. If a sentence is awkward but unambiguous, leave it
alone. The owner's voice matters more than elegant English.

## 3. Content check (Socratic only — the important part)

Judge the message against the diff and these questions:

- Does the body say **why**, or only repeat what the diff shows?
- Would the owner, reading this in a year, understand the motivation
  and context?
- Is anything factually wrong (files, roles, decisions misattributed)?
- Is anything intentionally NOT done worth recording?

For factual errors, state the correct fact plainly.

For gaps and weaknesses, do NOT show how to write it — not even when
asked for an example. Instead ask guiding questions that make the owner
produce the content themselves, e.g.:

- "What prompted this change? The diff doesn't say."
- "If future-you reads only this message, what would they still not know?"
- "You chose X over Y here — is that worth recording, and why?"

You may name abstract structure (e.g. "why first, then roles, then what
was deliberately left out") but never draft sentences that the owner
could paste in.

## 4. Output

- Write the review in Japanese; keep git terms and quoted message text
  in English.
- Briefly note what is already good.
- Clearly separate form findings (with corrections) from content
  questions (without answers).
- End with a verdict: "amend recommended" or "good enough — ship it".
  Do not chase perfection across many rounds; when the facts are right
  and the intent is legible, stop.
