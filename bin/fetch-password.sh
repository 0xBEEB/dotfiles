#!/bin/bash

PWD=$(gpg -dq ~/.my-pwds.gpg | grep $1 | awk '{ print $4 }')

echo $PWD | awk '{print substr($0,2,length($0)-2)}'
