## Git worktree sessions

Claude Code 2.1.331's isolation guard refuses some commands in a git worktree session. This may change.

- Never `cd` or `git -C` into the shared checkout. Run git from the worktree.
- Keep git commands plain, one per Bash call. No loops, `(( ))`, or heredoc scripts that mention git mixed in.
- A script that uses git is created with the Write tool, then run with `bash <file>`.
