#!/bin/sh

# Increase script robustness
# @see http://www.davidpashley.com/articles/writing-robust-shell-scripts/#id2382181
set -o nounset  # fail on unset variable
set -e errexit  # fail on any error

# Bootstrap Salt minion
# @see http://docs.saltstack.com/topics/tutorials/quickstart.html
wget -O - http://bootstrap.saltstack.org | sudo sh

# Install Git
sudo apt-get install -y --force-yes git

# Clone Github project
if [ -d "$PWD/net.constructions-incongrues.salt" ]; then
  cd $PWD/net.constructions-incongrues.salt
  git pull origin master
else
  git clone https://github.com/constructions-incongrues/net.constructions-incongrues.salt.git
  cd net.constructions-incongrues.salt
fi

# Create symlinks
sudo ln -sf $PWD/srv/salt /srv/salt
sudo ln -sf $PWD/srv/pillar /srv/pillar

# Dist files
for f in `find . -name *-dist | xargs`; do
	sed "s/@username@/`whoami`/" $f > "`dirname $f`/`basename $f -dist`";
done

# Call highstate
sudo salt-call --local state.highstate