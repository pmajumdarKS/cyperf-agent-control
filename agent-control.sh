#!/bin/bash -l

source .agent-control/bin/activate
python ./agent-control.py "$@"
