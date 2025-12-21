# shellcheck disable=SC2148

echo "            loading gitp-add-verify"

# this function performs git add, diff --cached, status.
# takes same arguments as git add.
function gitp-add-verify {
    # base command for git add
    ADD_COMM="git add"

    # append arguments to git add
    for ARG in "$@"; do
        ADD_COMM="$ADD_COMM $ARG"
    done
    
    # execute the git add
    eval "$ADD_COMM"

    # show what's staged
    git diff --cached

    # show the status of git
    git status
}