#!/usr/bin/env bash

VERSION="0.19.0"

if [ -e ./geckodriver ]; then
  rm -f ./geckodriver
fi

case $(uname -s) in
Darwin)
  URL="https://github.com/mozilla/geckodriver/releases/download/v$VERSION/geckodriver-v$VERSION-macos.tar.gz"
  ;;
*)
  URL="https://github.com/mozilla/geckodriver/releases/download/v$VERSION/geckodriver-v$VERSION-linux64.tar.gz"
  ;;
esac

curl -sSL -o - "$URL" | tar -xvz

if [ ! -x ./geckodriver ]; then
  echo "Error downloading geckodriver."
  exit 1
fi
