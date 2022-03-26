#!/bin/bash

FILE=.env
if [ -f "$FILE" ]; then
    echo "Set GitHub Action Secrets"
    export $(echo $(cat .env | sed 's/#.*//g'| xargs) | envsubst)
    gh secret set AWS_ACCESS_KEY_ID --body "$AWS_ACCESS_KEY_ID"
    gh secret set AWS_SECRET_ACCESS_KEY --body "$AWS_SECRET_ACCESS_KEY"
else
    echo "Please create .env file!"
fi
