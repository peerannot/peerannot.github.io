#!/bin/bash

echo $PWD
dirquarto="./assets/quarto_files/"

rm -rf ./_posts/datasets/build/
for folder in _freeze .quarto build temp; do
    rm -rf ${dirquarto}/${folder};
done;

quarto render ${dirquarto}
mkdir ./_posts/datasets/build/
for file in ${dirquarto}/*.qmd; do
    name="${file##*/}";
    name="${name%.*}";
done;

npm run build
bundle exec jekyll serve