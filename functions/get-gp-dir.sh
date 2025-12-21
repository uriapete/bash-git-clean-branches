echo "            loading _gitp-getdir"

_gitp-getdir() {
    DIR="$(pwd)"
    echo "$DIR";
    echo "$(cd ~ && pwd;)";
}