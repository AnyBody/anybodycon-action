#!/bin/bash

set -e

export RLM_LICENSE=$1@$2
export RLM_LICENSE_PASSWORD=$3
export RUN_SHELL=$4

export WINEPREFIX=/rootwine

echo -e "$5" > _action_run_script

version=$(python -c "import anypytools;print(anypytools.tools.anybodycon_version().partition(' (')[0].replace(' ', ''))" 2> /dev/null)
echo "::set-output name=anybody_version::$version"

$RUN_SHELL _action_run_script

rm _action_run_script

