#!/bin/bash

rm alci_local_repo*

echo "repo-add"
repo-add -n -R alci_local_repo.db.tar.gz *.pkg.tar.zst

echo "####################################"
echo "Repo Updated!!"
echo "####################################"
