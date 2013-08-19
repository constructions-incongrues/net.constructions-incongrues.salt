# Git
git:
  pkg:
    - installed

git-cola:
  pkg:
    - installed

gitsh_clone:
  git.latest:
    - name: https://github.com/rtomayko/git-sh.git
    - rev: master
    - target: /tmp/git-sh

gitsh_install:
  cmd.run:
    - name: "make && make install"
    - cwd: /tmp/git-sh
    - unless: which git-sh
  require:
    - git: gitsh_clone

git config --global color.sh auto:
  cmd.run:
    - unless: git config color.sh | grep -q "auto"
    - require:
      - pkg: git

git config --global user.email "tristan@rivoallan.net":
  cmd.run:
    - unless: git config user.email | grep -q "tristan@rivoallan.net"
    - require:
      - pkg: git

git config --global user.name "Tristan Rivoallan":
  cmd.run:
    - unless: git config user.name | grep -q "Tristan Rivoallan"
    - require:
      - pkg: git

git config --global --bool pull.rebase true:
  cmd.run:
    - unless: git config --global --bool pull.rebase | grep -q "true"
    - require:
      - pkg: git