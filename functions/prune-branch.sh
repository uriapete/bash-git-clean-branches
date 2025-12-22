if [ "$GITPV" = "1" ]; then
    echo "            loading gitp-prunebr"
fi

gitp-prunebr(){
    # fetch and prune all remotes
    git fetch --all --prune

    # get the path of the list of branches to preserve
    BRLI="$(_gitp-getpresbr)"

    # check if the data file exists. if it does not, prompt and terminate
    if [ "$BRLI" = "NULL" ]; then
        echo "Required GitPlus data not found! Please run gitp-init"
        return
    fi;

    # set up string for branch names to skip
    # skips current branch
    anti_match="(\\*|^\\+"

    while read -r ln; do
        echo "Keeping branch $ln";
        anti_match+="|$ln";
    done < "$BRLI"

    echo "Also keeping current branch";

    # finish skip string
    anti_match+=")"

    # get all local merged branch names, pass to next
    # filter for branch names that are not current or in arguments, pass to next
    # for each given branch, delete if merged
    git branch --merged | grep -Ev "$anti_match" | xargs -r git branch -d;
    # btw, this line was taken from StackOverflow:
    # https://stackoverflow.com/a/6127884
}