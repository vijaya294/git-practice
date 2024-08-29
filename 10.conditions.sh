#!/bin/bash

NUMBER=$1

if [ $NUMBER -gt 20 ]  #gt, lt, eq, -ne
then
    echo "given no : $NUMBER is greater than 20 "
else
    echo "given no : $NUMBER is leass than 20"