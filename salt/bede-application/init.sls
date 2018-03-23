cleanup-logging:
  file.managed:
    - name: /home/bede-user/application/scripts/cleanup-logging.sh
    - create: True
    - source: salt://bede-application/cleanup-logging.sh
    - user: bede-user
    - group: bede-group
    - mode: 774

watch-user:
  file.managed:
    - name: /home/bede-user/application/scripts/watches/watch-user.sh
    - create: True
    - source: salt://bede-application/watches/watch-user.sh
    - user: bede-user
    - group: bede-group
    - mode: 774

watch-directory:
  file.managed:
    - name: /home/bede-user/application/scripts/watches/watch-directory.sh
    - create: True
    - source: salt://bede-application/watches/watch-directory.sh
    - user: bede-user
    - group: bede-group
    - mode: 774

watch-group:
  file.managed:
    - name: /home/bede-user/application/scripts/watches/watch-group.sh
    - create: True
    - source: salt://bede-application/watches/watch-group.sh
    - user: bede-user
    - group: bede-group
    - mode: 774

watch-permissions:
  file.managed:
    - name: /home/bede-user/application/scripts/watches/watch-permissions.sh
    - create: True
    - source: salt://bede-application/watches/watch-permissions.sh
    - user: bede-user
    - group: bede-group
    - mode: 774
