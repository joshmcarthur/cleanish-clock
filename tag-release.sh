#!/bin/bash
tagname="v$(/usr/libexec/PlistBuddy -c "Print CFBundleVersion" "Cleanish Clock/Info.plist")"
git tag $tagname
git push origin $tagname