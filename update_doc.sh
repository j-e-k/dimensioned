#!/usr/bin/env bash

set -o errexit -o nounset

rev=$(git rev-parse --short HEAD)

git config --global user.name "Paho Lurie-Gregg (via Travis)"
git config --global user.email "paho@paholg.com"

git clone "https://$GH_TOKEN@github.com/paholg/paholg.github.io.git" site/

rm -rf site/doc/dimensioned site/doc/src/dimensioned site/doc/implementors/dimensioned

rsync -a target/doc site/

cd site

git add -A .
git commit -m "Update doc at ${rev} of dimensioned"
git push
