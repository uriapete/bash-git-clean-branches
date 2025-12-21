echo "            loading gitp-presbr"

# adds the desired branches to .gitplus/preserve_branches
# to prevent them from being automatically pruned
gitp-preserve-branch() {
    # get the path of the gitplus folder
    DATA_PATH="$(_gitp-getdir)"

    # get the path of the list of branches to preserve
    BRLI="$DATA_PATH/preserve_branches"

    # check if the data file exists. if it does not, prompt and terminate
    if [ "$DATA_PATH" = "NULL" ]; then
        echo "Required GitPlus data not found! Please run gitp-init"
        return
    fi;

    # for each specified branch name, append to list of branches to preserve
    for BR_NM in "$@"; do
        echo "$BR_NM" >> "$DATA_PATH/preserve_branches"
    done
}