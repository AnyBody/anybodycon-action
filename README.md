# Run AnyBody on GitHub actions

This actions enables simulations with the console version of the AnyBody Modeling System as part of a GitHub action flow. Behind the scenes the simualtion runs in a [linux docker image](https://github.com/AnyBody/anybody-container/pkgs/container/anybodycon-linux) with AnyBody preinstalled.

> **Note:** A valid license is necessary for this action to work. I.e. you must provide a floating license server where the action can obtain a license while it is running. 

Currently the action uses version `7.4.1` of the AnyBody Modeling System available as a [linux docker container](https://github.com/AnyBody/anybody-container/pkgs/container/anybodycon-linux).


## Inputs

### `run`

**Required** The commands start the anybody simulation. For example launching anybody directly `anybodycon -m macro.anymcr` or maybe a python script which runs your simualtion: `python my-simulation.py` 


### `license_server`

**Required** the ip/url of the AnyBody license server.

### `license_server_pass`

**Required** The password for accessing the license server. Use the github  action system for [encrypted secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets) (e.g. `${{ secrets.server_password }}`)

### `license_server_port`

**Optional** The port where the license server is hosted. Defaults to 5053.


### `shell`

**Optional** The shell used to execute the `run` script. Defaults to `/bin/bash`.


## Outputs

### `anybody_version`

The exeact version of AnyBody used by the action.

## Example usage

```
uses: anybody/anybodycon-action@v7.4.3
with:
  license_server: license-server.com
  license_server_password: ${{ secrets.server_password }}
  run: 
    anybodycon -m macro.anymcr
```

## Alternatives:

An alternative to this action is to just specify the following in the job workflow:
  
```container: ghcr.io/anybody/anybodycon-linux:latest```
 
But that will run the all job steps in the docker image and prevent the use of other docker-based actions. 
