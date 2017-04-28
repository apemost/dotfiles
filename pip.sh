#!/usr/bin/env bash

if which pip &> /dev/null; then
  sudo -H pip install --upgrade pip
fi

if which pip3 &> /dev/null; then
  sudo -H pip3 install --upgrade pip
  sudo -H pip3 install ipython
  sudo -H pip3 install pylint
  sudo -H pip3 install requests
  sudo -H pip3 install setuptools
  sudo -H pip3 install speedtest-cli
  sudo -H pip3 install virtualenv
  sudo -H pip3 install you-get
fi
