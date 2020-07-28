#!/bin/sh

echo "$SSH_KNOWN_HOSTS" > ~/.ssh/known_hosts
echo "$SSH_KEY" > ~/.ssh/id_ed25519 && chmod 400 ~/.ssh/id_ed25519
ssh-keygen -y -f ~/.ssh/id_ed25519 > ~/.ssh/id_ed25519.pub