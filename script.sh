# TODO: UPDATE VERSION
# version: v1.0.0.0 (Epoch Semver)
# (MARKETING.BREAKING.FEATURE.PATCH)

# name of the directory (child directory of this) that holds all gp functions
FNS_DIR="functions"

# get pathnames of the above directory
# from https://stackoverflow.com/a/59916
FNS_DIR=$( cd -- "$( dirname -- "$0" )/$FNS_DIR" && pwd )

echo "        loading gp- functions in $FNS_DIR";

for FILE in "$FNS_DIR"/*.sh; do
    echo "        loading $FILE"
    . "$FILE"
done

git-brclean() {
    # fetch and prune all remotes
    git fetch --all --prune

    # set up string for branch names to skip
    # skips current branch
    anti_match="(\\*|^\\+"

    # for each branch name in arguments,
    # add to skip string
    for name in "$@"; do
        echo "keeping branch $name";
        anti_match+="|$name";
    done

    # finish skip string
    anti_match+=")"
    
    # get all local merged branch names, pass to next
    # filter for branch names that are not current or in arguments, pass to next
    # for each given branch, delete if merged
    git branch --merged | grep -Ev "$anti_match" | xargs -r git branch -d;
    # btw, this line was taken from StackOverflow:
    # https://stackoverflow.com/a/6127884
}

gitp-prunebr(){
    echo "I clean branches!"
}