#!/bin/sh
#eval `ssh-agent`
export SSH_ASKPASS=/usr/bin/ksshaskpass
ssh-add < /dev/null
