rb-inotify:
  gem:
    - installed

sass:
  gem:
    - installed
    # @see http://stackoverflow.com/a/19073391
    - version: 3.2.10
    - require:
      - gem: rb-inotify

compass:
  gem:
    - installed
    - require:
      - gem: sass
