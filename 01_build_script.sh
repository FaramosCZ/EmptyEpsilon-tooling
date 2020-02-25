#
# This script assumes, there are directories "EmptyEpsilon" and "SeriousProton" available
#
# This script requires 3 arguments: year, month, day.
# In a format <this_script.sh> YYYY MM DD
# This date is then used as a hard-coded version
#

# ====================================================

if [ -z "$3" ] ; then
  echo -e "SPECIFY 3 ARGUMENTS: YYYY MM DD"
  exit 1;
fi

YEAR=$1
MONTH=$2
DAY=$3

# ====================================================

pushd EmptyEpsilon

mkdir -p _build
cd _build

cmake .. -DSERIOUS_PROTON_DIR=$PWD/../../SeriousProton/ -DCPACK_PACKAGE_VERSION="$YEAR.$MONTH.$DAY" -DCPACK_PACKAGE_VERSION_MAJOR="$YEAR" -DCPACK_PACKAGE_VERSION_MINOR="$MONTH" -DCPACK_PACKAGE_VERSION_PATCH="$DAY"

make

# ====================================================

#sudo make install
#popd
echo "NOW RUN 'sudo make install' IN THE BUILD FOLDER (usually ./EmptyEpsilon/_build/)"