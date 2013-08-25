/usr/local/bin/git-achievements:
  file.managed:
    - source: https://raw.github.com/icefox/git-achievements/gh-pages/git-achievements
    - source_hash: md5=0969d735fc944475b8bbc5a602cd1d9b
    - mode: 755


echo "alias git=git-achievements" >> /home/{{ pillar.user }}/.bash_aliases:
  cmd:
    - run
    - unless: grep -q "alias git=git-achievements" /home/{{ pillar.user }}/.bash_aliases