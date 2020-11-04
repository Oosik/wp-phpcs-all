#!bin/bash

## this script will loop thru the project and fix (or check) all the code standards issues.
## for safety the script should be run from the theme root.
## pass in either 'fix' or 'check' as an argument.
CURRENT_PATH=$(pwd)
if [ ! -f "${CURRENT_PATH}/composer.json" ]
then
	echo ""
	echo -e "\e[31mCan't find composer.json - you are probably in the wrong directory\e[0m"
	echo ""
	exit
fi

FIX_OR_CHECK=$1
if [[ "$FIX_OR_CHECK" != "fix" ]] && [[ "$FIX_OR_CHECK" != "check" ]]; then
	echo "Error: Pass in either 'fix' or 'check'"
	exit
fi

##
## exclude the node_modules and vendor
FILES=$(find . -name '*.php' -not -path './vendor/*' -not -path './node_modules/*')

echo ""
echo "===============[ VERIFY ]==============="
echo ""
echo 'you are about to run PHPCS on these files:'
printf "$FILES"
echo ""
echo ""
echo "==== Running a ${FIX_OR_CHECK} ===="
echo ""
echo "these are relative to: "
echo $CURRENT_PATH
echo ""

read -r -p "$(tput setaf 1)$(tput setab 7)Do you want to continue? Type Y to continue. N to exit. $(tput sgr 0) " VERIFY

if [[ "$VERIFY" != "y" ]] && [[ "$VERIFY" != "Y" ]]; then
	exit
fi

for FILE in $FILES
do
	composer run standards:$FIX_OR_CHECK $FILE
done

exit
