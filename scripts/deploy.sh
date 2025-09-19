#!/bin/bash

# Move back to the root
cd ../

# Identify the Git branch you're using
GIT_BRANCH=$(git symbolic-ref --short HEAD)

# v25.2
VER="25.2"; rm docs; rm mkdocs.yml; ln -s ./versions/${VER}/ ./docs; ln -s ./versions/${VER}/mkdocs.yml ./;
mike deploy --branch "$GIT_BRANCH" --update-aliases "$VER"
rm -rf ${VER}
mv site ${VER}

# v25.3
VER="25.3"; rm docs; rm mkdocs.yml; ln -s ./versions/${VER}/ ./docs; ln -s ./versions/${VER}/mkdocs.yml ./;
mike deploy --branch "$GIT_BRANCH" --push --update-aliases "$VER" latest
rm -rf ${VER}
mv site ${VER}

# Set latest
ln -sf ${VER} ./latest
mike set-default --branch "$GIT_BRANCH" latest

# Return to scripts dir
cd scripts
