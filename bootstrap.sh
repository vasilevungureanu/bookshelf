#!/usr/bin/env bash
#
# Running this script will:
# * Install all git hooks.
# * Install shellcheck.

# If a command fails then do not proceed and fail this script too
set -o errexit
set -o pipefail

echo 'Starting bootstrap process'

echo 'Install all git hooks'
rm -f .git/hooks/*

cp quality.sh .git/hooks/pre-push
chmod +x .git/hooks/pre-push

curl https://cdn.rawgit.com/tommarshall/git-good-commit/v0.6.1/hook.sh >.git/hooks/commit-msg && chmod +x .git/hooks/commit-msg

echo 'Installing shellcheck'
if [[ "${OSTYPE}" == "linux-gnu" ]]; then
  sudo apt-get install shellcheck
elif [[ "${OSTYPE}" == "darwin"* ]]; then
  brew install shellcheck 2>/dev/null && true
fi

echo 'Bootstrap process completed'
