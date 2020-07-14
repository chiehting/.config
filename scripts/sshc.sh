#!/bin/sh

type=$1
file1=$2
file2=$3

echo "convert $file1 to $file2"

openssl $type -in $file1 -out $file2

