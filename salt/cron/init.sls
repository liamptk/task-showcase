bash /home/bede-user/application/scripts/cleanup-logging.sh:
  cron.present:
    - user: bede-user
    - minute: '*'
    - hour: '*'
    - daymonth: '*'
    - month: '*'
    - dayweek: '*'
