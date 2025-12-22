# version: v2.0.0.0 (Epoch Semver)
# (MARKETING.BREAKING.FEATURE.PATCH)

# name of the directory (child directory of this) that holds all gp functions
FNS_DIR="functions"

# get pathnames of the above directory
# from https://stackoverflow.com/a/59916
FNS_DIR=$( cd -- "$( dirname -- "$0" )/$FNS_DIR" && pwd )

if [ "$GITPV" = "1" ]; then
    echo "        loading gitp- functions in $FNS_DIR";
fi

for FILE in "$FNS_DIR"/*.sh; do
    if [ "$GITPV" = "1" ]; then
        echo "        loading $FILE"
    fi
    . "$FILE"
done