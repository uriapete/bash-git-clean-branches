# bash-git-clean-branches
Bash function which automatically prunes remotes and cleans merged local branches.

## How to use:
Copy and paste the contents of `script.sh` to the end of your `.bashrc`, `.zshrc`, or whatever "run at start" script that belongs to the bash-based shell you use. Then, reload your terminal shell.

Upon reloading your terminal session, calling `git-brclean [branches...]` will prune any tracking branches that do not exist in any of your remotes as well as delete all merged local branches except those called as arguments in `[branches...]`.

For example:
`git-brclean main dev 95-my-issue`
This will clean all merged branches except for `main`, `dev`, and `95-my-issue`.
