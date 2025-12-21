echo "            loading _gitp-getdir"

_gitp-getdir() {
    # name of gitplus folder
    GP_PATH=".gitplus"

    # get current directory
    DIR="$(pwd)"
    # echo "$DIR";
    # echo "$(cd ~ && pwd;)";

    # while the current directory is not user home...
    while [ "$DIR" != "$(cd ~ && pwd;)" ]; do
        # check if the .gitplus folder is there and return the path if it does
        if [ -d "$DIR/$GP_PATH" ]; then
            echo "$DIR/$GP_PATH";
            return;
        fi

        # else, go up in the tree
        DIR="$(cd "$DIR/.." && pwd)"
    done

    # if the while loop has closed without a return, we have not found a .gitplus folder
    # therefore,
    echo "NULL";
}