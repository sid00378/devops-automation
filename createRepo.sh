#!/bin/bash
# https://gist.github.com/robwierzbowski/5430952/
# Create and push to a new github repo from the command line.  
# Grabs sensible defaults from the containing folder and `.gitconfig`.  
# Refinements welcome.
# Gather constant vars
# author Raghavendra Jupudi
REPONAME=$1
PROJECTKEY=$2
#PROJECT=$3
# Get user input
echo "Entered Git repository name is $REPONAME"
echo "Entered Git ProjectKey is $PROJECTKEY"
echo "Here we go..."

# Curl some json to the github API oh damn we so fancy
curl -X POST -v -u $3:$4 --header "Content-Type: application/json" https://bitbucket.tjx.com/rest/api/1.0/projects/${PROJECTKEY}/repos -d '{"name": "'${REPONAME}'","scmId": "git","forkable": true}' -k 
if [ $? -eq 0 ]
then
 echo "Repository has been created"
else
 echo "Error has been occurred during Repo creation"
fi
