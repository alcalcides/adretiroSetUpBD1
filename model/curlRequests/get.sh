#!/bin/bash

uri=$1
outputRepository=$2

curl $uri -o $outputRepository

