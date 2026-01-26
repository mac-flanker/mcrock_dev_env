#!/bin/sh

HOSTNAME=$(hostname)
home-manager switch --flake ".#${HOSTNAME}" --show-trace -v --print-build-logs
