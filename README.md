# GitPlus
A collection of bash function which compile multiple git functions.

## How to use:
Locally clone this repo. Then, in your `.bashrc`, `.zshrc`, or whatever "run at start" script that belongs to the bash-based shell you use, source this repo's `script.sh`. Then, reload your terminal shell.

Upon reloading your terminal session, you can now use all `gitp-` functions.

- `gitp-init` - Create a `.gitplus` directory in the terminal's current directory.
- `gitp-add-verify` or `gitp-av` - Performs `git add`, `git diff --cached`, and `git status`. All arguments are passed to `git add`.
- `gitp-preserve-branch [...branches]` - Prevents the specified branches from being deleted/pruned by `gitp-prunebr`.
- `gitp-allow-prune [...branches]` - Allows the specified branches to be deleted/pruned by `gitp-prunebr`.
- `gitp-prunebr` - Fetches remotes and prunes tracking branches which track non-existant branches (`git fetch --all --prune`), then deletes all low branches that have already been merged into the current branch EXCEPT branch names that have been marked for preservation by `gitp-preserve-branch`.
  - It's recommended to add your default branch to your preserve list using `gitp-preserve-branch` and switch to it before doing this. Although, as long as your default branch has been marked to preserve and your current branch is up to date with the default branch, it should not matter what branch you are on when you run `gitp-prunebr`. Perhaps later I will add functions to set the default branch and `gitp-prunebr` will switch to the default branch automatically.

For example:
`git-brclean main dev 95-my-issue`
This will clean all merged branches except for `main`, `dev`, and `95-my-issue`.
