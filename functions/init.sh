echo "            loading gitp-init"

gitp-init() {
    # what name should we use for the directory that will hold gitplus data?
    DIR_NAME=".gitplus"

    # if our data directory does not exist, then create it
    if ! [ -d "$DIR_NAME/" ]; then
        echo "Creating $DIR_NAME in $(pwd)"
        mkdir "$DIR_NAME/"
    else
        echo "$DIR_NAME already exists in $(pwd)"
    fi

    # check for and create if needed: the list of branches to preserve
    if ! [ -f "$DIR_NAME/preserve_branches" ]; then
        touch "$DIR_NAME/preserve_branches";
    fi
}