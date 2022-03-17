#!/bin/bash

for i in $(find . -name \*.nim)
do
    nimpretty $i
done