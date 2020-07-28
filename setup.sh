#!/bin/sh

SSH_PATH=/root/.ssh

if [ ! -d "$SSH_PATH" ]; then
  mkdir --parents "$SSH_PATH"
fi

echo "$SSH_KNOWN_HOSTS" > "$SSH_PATH/known_hosts"
(umask 077 && echo "$SSH_KEY" > "$SSH_PATH/id_ed25519")
ssh-keygen -yf "$SSH_PATH/id_ed25519" > "$SSH_PATH/id_ed25519.pub"
