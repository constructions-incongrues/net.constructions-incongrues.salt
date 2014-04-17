nodejs_base:
  pkgrepo.managed:
    - name: deb http://ppa.launchpad.net/chris-lea/node.js/ubuntu raring main
    - dist: raring
    - file: /etc/apt/sources.list.d/nodejs.list
    - keyid: C7917B12 
    - keyserver: keyserver.ubuntu.com:80
    - require_in:
      - pkg: nodejs

nodejs:
  pkg.installed
