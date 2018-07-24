#!/usr/bin/env bash
set -xeuo pipefail
#if [ $# -ne 1 ]; then echo "\nUsage: compile.sh <gradle taskname>"
echo "$@"
if [ $# -lt 1 ]; then
#if [ test -n "$@" ]; then
    echo "Usage: compile.sh <gradle taskname> [gradlew options]"; exit 1;
fi
rm -f local.properties
env
#ldd build-tools/${ANDROID_BUILD_TOOLS_VERSION}/aapt
./gradlew clean --stacktrace
./gradlew $@
#Install and start the app
