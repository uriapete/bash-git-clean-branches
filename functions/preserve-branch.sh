echo "            loading gitp-presbr"

# adds the desired branches to .gitplus/preserve_branches
# to prevent them from being automatically pruned
gitp-preserve-branch() {
    DATA_PATH=".gitplus/preserve_branches"

    # check if the data file exists. if it does not, prompt and terminate
    if ! [ -f "$DATA_PATH" ]; then
        echo "Required GitPlus data not found! Please run gitp-init"
        return
    fi;

    # for each specified branch name, append to list of branches to preserve
    for BR_NM in "$@"; do
        echo "$BR_NM" >> $DATA_PATH
    done
}