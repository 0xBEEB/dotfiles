#!/bin/bash

PASSKEY="my_mailbox_pass"

PWD=$(gpg -dq ~/.my-pwds.gpg | grep $PASSKEY | awk '{ print $4 }')

echo $PWD | awk '{print substr($0,2,length($0)-2)}'
