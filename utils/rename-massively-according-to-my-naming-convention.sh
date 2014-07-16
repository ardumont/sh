#!bash -x

DIR=$1
if [ -z $DIR ]; then
    echo "Usage: $0 <directory>"
    exit 1;
fi

cd $DIR

rename 's/_/-/g' *

for i in $(ls); do
    cd $DIR/$i
    rename 's/---/./g' *
    rename 's/_-_/./g' *
    rename 's/-_-/./g' *
    rename 's/ /-/g' *
    rename 's/_/-/g' *
done
