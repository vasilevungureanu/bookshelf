#!/usr/bin/env bash
#
# Runs the static code analysis tools.

# If a command fails then do not proceed and fail this script too
set -o errexit
set -o pipefail

#######################################
# Find all shell scripts and check them
# Globals:
#  None
# Arguments:
#  None
# Returns:
#  None
#######################################
checkAllShellScripts() {
  # shellcheck disable=SC2044
  for file in $(find . -type f \( -name "*.sh" \)); do
    shellcheck "${file}"
  done
}

checkAllShellScripts
