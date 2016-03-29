#!/bin/bash

if ln test1.sh lock 
then
    echo "made lock\n"
else
    echo "couldn't make lock\n"
fi