inotify-tools:
  pkg:
    - installed

supervisor:
  pkg:
    - installed
  service.running:
    - enable: True
    - reload: True
    - watch:
      - file: /etc/supervisor/conf.d/watches.conf

/etc/supervisor/conf.d/watches.conf:
  file.managed:
    - source: salt://base-packages/supervisor/watches.conf
    - require:
      - pkg: supervisor



