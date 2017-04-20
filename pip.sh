#!/usr/bin/env bash

function pip_install() {
  sudo -H pip list --outdated --format=freeze \
    | grep -v '^\-e' \
    | cut -d = -f 1  \
    | xargs -n1 sudo -H pip install --upgrade

  sudo -H pip install ipython
  sudo -H pip install pylint
  sudo -H pip install requests
  sudo -H pip install setuptools
  sudo -H pip install speedtest-cli
  sudo -H pip install virtualenv
}

function pip3_install() {
  sudo -H pip3 list --outdated --format=freeze \
    | grep -v '^\-e' \
    | cut -d = -f 1  \
    | xargs -n1 sudo -H pip3 install --upgrade

  sudo -H pip3 install ipython
  sudo -H pip3 install you-get
}

which pip &> /dev/null && pip_install
which pip3 &> /dev/null && pip3_install
