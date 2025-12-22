# shellcheck disable=SC2148

echo "            loading gitp-add-verify"

# this function performs git add, diff --cached, status.
# takes same arguments as git add.
function gitp-add-verify {
    # perform the git add, append args
    eval "git add $*"

    # show what's staged
    git diff --cached

    # show the status of git
    git status
}

alias gitp-av="gitp-add-verify"