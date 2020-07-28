#!/bin/sh

if [ "$#" -ne "3" ]; then
  echo "Usage : $0 <local_path> <remote_path> <instance_name>"
  exit 1
fi

LOCAL_PATH=$GITHUB_WORKSPACE/$1
REMOTE_PATH=$3
ARMA_INSTANCE=$3

if [ ! -f "$LOCAL_PATH" ]; then
  echo "Mission pbo not found"
  exit 2
fi

ssh -vvv "$SSH_USERNAME@$SSH_HOSTNAME" "Start-Process -Verb RunAs powershell '-File C:\Arma3\Stop-ArmaInstance.ps1 $ARMA_INSTANCE'"
scp -vvv "$LOCAL_PATH" "$SSH_USERNAME@$SSH_HOSTNAME:$REMOTE_PATH"
ssh -vvv "$SSH_USERNAME@$SSH_HOSTNAME" "Start-Process -Verb RunAs powershell '-Command Get-ScheduledTask $ARMA_INSTANCE | Start-ScheduledTask'"
