#!/bin/bash

USER_ID=${USER_ID:-1000}
GROUP_ID=${GROUP_ID:-1000}
USER_NAME=${USER_NAME:-user}
GROUP_NAME=${GROUP_NAME:-group}

userdel -r ubuntu > /dev/null 2>&1 # For Ubuntu 24.04 image
groupadd -g ${GROUP_ID} ${GROUP_NAME} > /dev/null 2>&1
useradd -u ${USER_ID} -g ${GROUP_NAME} -G sudo -o -m ${USER_NAME} > /dev/null 2>&1

if [[ $# -eq 0 ]]; then
    exec /usr/sbin/gosu ${USER_NAME} bash
else
    /usr/sbin/gosu ${USER_NAME} "$@"
fi
