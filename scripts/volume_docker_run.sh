#!/usr/bin/env bash
set -xeuo pipefail
if [ $# -lt 2 ]; then
    echo "Usage: compile.sh <gradle taskname> [gradlew options]"; exit 1;
fi

#Iterate throught the arguments to set script parameter
shell=""
for word in "$*"; do shell="$shell$word"; done
#COPY ANDROID SDK LICENSE
cp -vr ./scripts/licenses "$ANDROID_HOME/"

docker run \
	-t --rm \
	-v "$PWD":/application \
	-v "$HOME/.gradle":/root/.gradle \
    -v "$ANDROID_HOME":/usr/local/android/sdk \
	volumeandroiddocker.image \
    sh -c "$shell"
