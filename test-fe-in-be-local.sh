#!/bin/bash
echo "Processing.................."
cd ../editor && \
npm update es-core && \
yarn build && \
cd ../backend && \
rm -rf ./client/dist && \
cp -r ../editor/dist ./client
echo "Success.................."
