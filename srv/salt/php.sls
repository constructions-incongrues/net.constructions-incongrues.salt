# PHP
php5-cli:
  pkg:
    - installed

# Install Box .phar maker
# @see http://box-project.org
box_install:
  cmd.run:
    - name: curl -s http://box-project.org/installer.php | php
    - cwd: /usr/local/bin
    - unless: test -f /usr/local/bin/box.phar
    - require:
      - pkg: php5-cli
      - pkg: curl

# Install Boris REPL
# @see https://github.com/d11wtq/boris
boris_clone:
  git.latest:
    - name: https://github.com/d11wtq/boris.git
    - rev: master
    - target: /opt/boris

/usr/local/bin/boris:
  file:
    - symlink
    - target: /opt/boris/bin/boris
    - require:
      - git: boris_clone