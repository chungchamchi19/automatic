#!/bin/bash

cd ../editor && \
git checkout master && \
git pull origin master && \
npm update es-core && \
npm run build && \
cd ../backend && \
git checkout master && \
git pull origin master && \
rm -rf ./client/dist && \
cp -r ../editor/dist ./client && \
git add .
echo "Enter message commit:"
read message
if ($message == "")
then 
  $message = "build client"
fi
git commit -m "$message" && \
git push origin master
echo "Success.................."