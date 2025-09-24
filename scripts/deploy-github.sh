#!/bin/bash

# Set the latest version
LATEST_VERSION="25.3"

# Move back to the root
cd ../

# Convert symbolic links to the directories they link to
rm docs
cp -r ./versions/${LATEST_VERSION}/ ./docs

rm latest
cp -r ${LATEST_VERSION} ./latest

rm mkdocs.yml
cp -r ./versions/${LATEST_VERSION}/mkdocs.yml .

# Return to scripts dir
cd scripts
