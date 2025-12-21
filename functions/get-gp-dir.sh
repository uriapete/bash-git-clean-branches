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
        # testing if while loop works
        echo "$DIR"
        DIR="$(cd "$DIR/.." && pwd)"
    done
}