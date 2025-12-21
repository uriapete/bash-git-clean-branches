echo "            loading gitp-presbr"

# adds the desired branches to .gitplus/preserve_branches
# to prevent them from being automatically pruned
gitp-preserve-branch() {
    # check if the data file exists. if it does not, prompt and terminate
    if ! [ -f ".gitplus/preserve_branches" ]; then
        echo "Required GitPlus data not found! Please run gitp-init"
        return
    fi;

    echo "pb found"
}