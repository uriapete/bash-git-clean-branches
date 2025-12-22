echo "            loading _gitp-getpresbr"

_gitp-getpresbr(){
    # get the path of the gitplus folder
    DATA_PATH="$(_gitp-getdir)"

    # get the path of the list of branches to preserve
    BRLI="$DATA_PATH/preserve_branches"

    # if the preserve branches file doesnt exist,
    # prompt and terminate
    if ! [ -f "$BRLI" ]; then
        echo "NULL"
        return
    fi

    # if we got here, the file exists.
    # echo so other functions can capture output.
    echo "$BRLI"
}