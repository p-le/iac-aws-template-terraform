#!/bin/bash

if [ ! -d ".ssh" ]; then
    mkdir -p .ssh
fi

ssh-keygen -t rsa -b 4096 -f .ssh/id_rsa
