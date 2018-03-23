/home/bede-user/application/logging:
  file.directory:
    - user: bede-user
    - group: bede-group
    - dir_mode: 774
    - recurse:
      - user
      - group
      - mode
    - makedirs: True

/home/bede-user/application/scripts/watches:
  file.directory:
    - user: bede-user
    - group: bede-group
    - dir_mode: 774
    - recurse:
      - user
      - group
      - mode
    - makedirs: True

/var/log/watches/:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 774
    - recurse:
      - user
      - group
      - mode
    - makedirs: True
