/usr/local/bin/git-achievements:
  file:
    - absent

/opt/git-achievements:
  file.directory:
    - user: {{ pillar.user }}
    - group: {{ pillar.user }}
    - mode: 755

git@github.com:{{ pillar.github.username }}/git-achievements.git:
  git.latest:
    - rev: gh-pages
    - target: /opt/git-achievements
    - runas: {{ pillar.user }}

/home/{{ pillar.user }}/.bash_aliases:
  file.managed:
    - user: {{ pillar.user }}
    - group: {{ pillar.user }}

echo "alias git=git-achievements" >> $HOME/.bash_aliases:
  cmd:
    - run
    - unless: grep -q "alias git=git-achievements" $HOME/.bash_aliases
    - user: {{ pillar.user }}

echo "export PATH=$PATH:/opt/git-achievements" >> $HOME/.bashrc:
  cmd:
    - run
    - unless: grep -q "/opt/git-achievements" $HOME/.bashrc
    - user: {{ pillar.user }}

git config --global achievement.upload "true":
  cmd.run:
    - unless: git config achievement.upload | grep -q "true"
    - require:
      - pkg: git