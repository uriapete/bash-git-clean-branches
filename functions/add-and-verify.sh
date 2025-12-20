# shellcheck disable=SC2148

echo "            loading gitp-add-verify"

function gitp-add-verify {
    # base command for git add
    ADD_COMM="git add"

    # append arguments to git add
    for ARG in "$@"; do
        ADD_COMM="$ADD_COMM $ARG"
    done
    echo "$ADD_COMM"
}