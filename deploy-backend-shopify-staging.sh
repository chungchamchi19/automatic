#!/bin/bash
echo "Enter staging number:"
read staging
echo "What branch you want to deploy?(or enter 'no' to deploy current branch)"
read branch
while (($staging != 1 && $staging != 2 && $staging != 3))
do 
  echo "Enter staging 1, 2 or 3: "
  read staging
done
echo "Prepare to deploy staging-$staging....."
cd ../backend-shopify && \
git checkout staging/es-shopify-staging-$staging
if (($branch != "no"))
then 
  git pull origin $branch
fi
npm update es-core && \
yarn build && \
git add . && \
git commit -m "test" && \
git push origin staging/es-shopify-staging-$staging -f 
echo "Success.................."
