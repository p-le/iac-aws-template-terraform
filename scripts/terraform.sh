#!/bin/bash

if [[ $1 == "init" ]]; then
    terraform $@ -backend-config=config.s3.tfbackend
else
    terraform $@
fi