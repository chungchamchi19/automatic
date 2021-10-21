#!/bin/bash
echo "Enter staging number:"
read staging
while (($staging != 1 && $staging != 2 && $staging != 3))
do 
  echo "Enter staging 1, 2 or 3: "
  read staging
done
echo "Prepare to deploy staging-$staging....."
cd ../editor && \
npm update es-core && \
yarn build && \
cd ../backend && \
# git add . && \
# git stash && \
# git fetch origin staging/es-staging-$staging && \
# git co staging/es-staging-$staging && \
rm -rf ./client/dist && \
cp -r ../editor/dist ./client && \
git add . && \
git commit -m "test" && \
# git pull origin staging/es-staging-$staging && \
git push origin staging/es-staging-$staging -f 
echo "Success.................."
