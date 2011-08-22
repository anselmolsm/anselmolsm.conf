#!/bin/sh
eval `ssh-agent`
SSH_ASKPASS=/usr/lib/ssh/ksshaskpass ssh-add < /dev/null
