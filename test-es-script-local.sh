#!/bin/bash
pathRepoTest="editor"
echo -e "Enter: \n 1 to test atom\n 2 to test section\n 3 to test addon"
read repo
while (($repo != 1 && $repo != 2 && $repo != 3))
do 
	echo "Reenter: "
	read repo
done
if (($repo == 1))
then 
	pathRepoTest="atoms"
elif (($repo == 2)) 
then
  pathRepoTest="sections"
else 
	pathRepoTest="addons"
fi
echo "Prepare to test es-script at $pathRepoTest....."
cd ../es-script && \
yarn build && \
cd ../$pathRepoTest && \
rm -f ./node_modules/es-script/dist/index.js && \
cp ../es-script/dist/index.js ./node_modules/es-script/dist/ 
echo "Success.................."