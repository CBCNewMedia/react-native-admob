#!/usr/bin/env bash
_NPM_PACKAGE=$(npm list | head -n 1 | cut -d ' ' -f1)
if [ -z "$(npm info ${_NPM_PACKAGE} 2> /dev/null)" ]
then
	echo "Publishing package ${_NPM_PACKAGE} to npmjs.com"
	npm publish
else
	echo "Error: Package ${_NPM_PACKAGE} has already been published to npmjs.com"
    echo "       Use \"npm version patch\" or edit \"package.json\" to update the package version before publishing"
    exit 1
fi
