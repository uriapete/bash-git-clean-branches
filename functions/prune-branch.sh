echo "            loading gitp-prunebr"

gitp-prunebr(){
    # get the path of the list of branches to preserve
    BRLI="$(_gitp-getpresbr)"

    # check if the data file exists. if it does not, prompt and terminate
    if [ "$BRLI" = "NULL" ]; then
        echo "Required GitPlus data not found! Please run gitp-init"
        return
    fi;

    while read -r ln; do
        echo "Keeping branch $ln";
    done < "$BRLI"
}