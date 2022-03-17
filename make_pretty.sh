#!/bin/bash

for i in $(find . -name \*.nim)
do
    echo "----- $i"
    nimpretty $i
done