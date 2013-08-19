#!/bin/sh

# Increase script robustness
# @see http://www.davidpashley.com/articles/writing-robust-shell-scripts/#id2382181
set -o nounset  # fail on unset variable
set -e errexit  # fail on any error

# Bootstrap Salt minion
# @see http://docs.saltstack.com/topics/tutorials/quickstart.html
wget -O - http://bootstrap.saltstack.org | sh

# Clone Github project
if [ -d "$PWD/net.constructions-incongrues.salt" ]; then
  cd $PWD/net.constructions-incongrues.salt
  git pull origin master
else
  git clone https://github.com/constructions-incongrues/net.constructions-incongrues.salt.git
fi

# Create symlinks
ln -sf $PWD/net.constructions-incongrues.salt/srv/salt /srv/salt
ln -sf $PWD/net.constructions-incongrues.salt/srv/pillar /srv/pillar

# Call highstate
salt-call --local state.highstate