if [ "$GITPV" = "1" ]; then
    echo "            loading gitp-allow-prune"
fi

# removes the specified branch from preserve_branches.
gitp-allow-prune() {
    # get the path of the list of branches to preserve
    BRLI="$(_gitp-getpresbr)"

    # check if the data file exists. if it does not, prompt and terminate
    if [ "$BRLI" = "NULL" ]; then
        echo "Required GitPlus data not found! Please run gitp-init"
        return
    fi;
    
    # remove the line with the branch name from BRLI
    for BRNM in "$@"; do
        echo "Allowing $BRNM to be automatically pruned by gitp-prunebr"
        sed -i "/$BRNM/d" "$BRLI";
    done
}