#!/bin/sh

if [ "$#" -ne "3" ]; then
  echo "Usage : $0 <local_path> <remote_path> <instance_name>"
  exit 1
fi

SSH_PATH=/root/.ssh
LOCAL_PATH=$GITHUB_WORKSPACE/$1
REMOTE_PATH=$3
ARMA_INSTANCE=$3

if [ ! -f "$LOCAL_PATH" ]; then
  echo "Mission pbo not found"
  exit 2
fi

if [ ! -d "$SSH_PATH" ]; then
  mkdir --parents "$SSH_PATH"
fi

echo "$SSH_KNOWN_HOSTS" > "$SSH_PATH/known_hosts"
(umask 077 && echo "$SSH_KEY" > "$SSH_PATH/id_ed25519")
ssh-keygen -yf "$SSH_PATH/id_ed25519" > "$SSH_PATH/id_ed25519.pub"

ssh "$SSH_USERNAME@$SSH_HOSTNAME" "Start-Process -Verb RunAs powershell '-File C:\Arma3\Stop-ArmaInstance.ps1 $ARMA_INSTANCE'"
scp "$LOCAL_PATH" "$SSH_USERNAME@$SSH_HOSTNAME:$REMOTE_PATH"
ssh "$SSH_USERNAME@$SSH_HOSTNAME" "Start-Process -Verb RunAs powershell '-Command Get-ScheduledTask $ARMA_INSTANCE | Start-ScheduledTask'"
