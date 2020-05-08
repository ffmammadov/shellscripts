#!/bin/bash
#This script migrates git repository with all branches and commits. Usage ./migrate.sh orginial-repo-url destination-repo-url
echo "Moving repo from $1 to $2..."
if [ -z $1 ]; then
    read -p "Original repo: " ORIGINAL_REPO
else
    ORIGINAL_REPO=$1
fi
if [ -z $2 ]; then
    read -p "Destination repo: " DESTINATION_REPO
else
    DESTINATION_REPO=$2
fi

mkdir temp_repo
echo "Clonning $ORIGINAL_REPO"
git clone --mirror $ORIGINAL_REPO temp_repo 
cd temp_repo

echo "Replacing origin with $DESTINATION_REPO"
git remote rm origin
git remote add origin $DESTINATION_REPO

echo "Pushing into $DESTINATION_REPO..."
git push origin --all
git push --tags
cd ../ && rm -rf temp_repo

echo "Repo successfully migrated! :)"
