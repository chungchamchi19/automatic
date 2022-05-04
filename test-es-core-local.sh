#!/bin/bash
pathRepoTest="editor"
echo "Enter 1 to test editor or 2 to test backend-shopify: "
read repo
while (($repo != 1 && $repo != 2))
do 
	echo "Reenter: "
	read repo
done
if (($repo == 1))
then 
	pathRepoTest="editor"
else 
	pathRepoTest="backend-shopify"
fi
echo "Prepare to test es-core at $pathRepoTest....."
cd ../es-core && \
yarn build:uploadScripts && \
yarn build && \
cd ../$pathRepoTest && \
rm -f ./node_modules/es-core/dist/index.js && \
cp ../es-core/dist/index.js ./node_modules/es-core/dist/ 
echo "Success.................."