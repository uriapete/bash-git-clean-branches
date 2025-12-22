echo "            loading gitp-presbr"

# adds the desired branches to .gitplus/preserve_branches
# to prevent them from being automatically pruned
gitp-preserve-branch() {
    # get the path of the list of branches to preserve
    BRLI="$(_gitp-getpresbr)"

    # check if the data file exists. if it does not, prompt and terminate
    if [ "$BRLI" = "NULL" ]; then
        echo "Required GitPlus data not found! Please run gitp-init"
        return
    fi;

    # for each specified branch name, append to list of branches to preserve IF it does not exist yet
    for BR_NM in "$@"; do
        # case statement taken from https://stackoverflow.com/a/4749368
        # plus syntax taken from https://www.geeksforgeeks.org/linux-unix/bash-scripting-case-statement/
        case $(grep -Fx "$BR_NM" "$BRLI" > /dev/null; echo $?) in
            # if found (code 0), skip
            0)
                continue
                ;;
            # if not found (code 1), append
            1)
                echo "$BR_NM" >> "$BRLI"
                ;;
            # anything else, it is an error
            *)
                echo "Something has gone wrong!"
                ;;
        esac
    done
}