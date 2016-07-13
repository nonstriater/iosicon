#! /bin/bash

#########################
# usage: iosicon.sh 1024-icon.png
#########################


function print_usage(){

	echo "################################"
	echo "usage: iosicon.sh <1024-icon.png>"
	echo "################################"
}


#check arg
if [[ -z "$1" && $# -ne 1 ]]; then
	print_usage
	exit 1
fi

# prepare
ROOT_DIR=$(pwd)

#check file exist
SOURCE_FILE="${ROOT_DIR}/$1"
if [[ ! -e ${SOURCE_FILE} ]]; then
	echo "source file not exist!"
	exit 2
fi
DEST_DIR="${ROOT_DIR}/ios-icon"
mkdir -p "${DEST_DIR}"
ICON_ARRAY_NAME=("Icon-29.png" "Icon-29@2x.png" "Icon-29@3x.png"
                 "Icon-40.png" "Icon-40@2x.png" "Icon-40@3x.png"
                 "Icon-57.png" "Icon-57@2x.png"
                 "Icon-60@2x.png" "Icon-60@3x.png"

                 "Icon-50.png" "Icon-50@2x.png"
                 "Icon-72.png" "Icon-72@2x.png"
                 "Icon-76.png" "Icon-76@2x.png"
                 "Icon-167.png")

ICON_ARRAY_SIZE=("29" "58" "87"
                 "40" "80" "120"
                 "57" "114"
                 "120" "180"

                 "50" "100"
                 "72" "144"
                 "76" "152"
                 "167")


#sips starting
cp "${SOURCE_FILE}" "${DEST_DIR}"
for ((i=0; i<${#ICON_ARRAY_SIZE[@]} ;i++)); do
	size=${ICON_ARRAY_SIZE[i]}
	sips -Z ${size} "${SOURCE_FILE}" --out "${DEST_DIR}/${ICON_ARRAY_NAME[i]}"
done










