# Arma 3 mission publish

Publish an arma3 mission pbo on a GSRI server

## Inputs

### `localPath`

**Required** Path to the pbo file, relative to the repository root.

### `remotePath`

**Required** Path to the pbo file on the server, absolute.

### `instanceName`

**Required** Name of the arma 3 server instance, based on GSRI tools.

## Outputs

*There is no output*

## Environment

This action requires the following envrionment variables :

### `SSH_HOSTNAME`

This environment variable contains the hostname of the remote server

### `SSH_USERNAME`

This environment variable contains the ssh login on the remote server

### `SSH_KEY`

This environment variable contains the ssh private key (in ed25519 format)

### `SSH_KNOWN_HOSTS`

This environement variable contains the ~/.ssh/known_hosts file to use

## Example

```yml
uses: actions/mission-set-briefingName
env:
  SSH_HOSTNAME: ${{ secrets.SSH_HOSTNAME }}
  SSH_USERNAME: ${{ secrets.SSH_USERNAME }}
  SSH_KEY: ${{ secrets.SSH_KEY }}
  SSH_KNOWN_HOSTS: ${{ secrets.SSH_KNOWN_HOSTS }}
with:
  localPath: CONT_Orion.Malden.pbo
  remotePath: C:/Arma3/master/mpmissions/CONT_Orion.Malden.pbo
  instanceName: gsri.argon
```