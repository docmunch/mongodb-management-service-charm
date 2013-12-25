SVC_NAME="mmsagent"
SVC_AUTHOR="Max Cantor <max@docmunch.com>"
SVC_USER=${SVC_NAME}

MMS_HOMEDIR="/srv/mongo-management-service/agent"

MMS_BACKUP_AGENT_URL="https://mms.mongodb.com/settings/mms-backup-agent-docmunch-linux_amd64.tar.gz"
MMS_BACKUP_AGENT_UNPACKED_DIR="backup-agent"
MMS_BACKUP_HOME="${MMS_HOMEDIR}/${MMS_BACKUP_AGENT_UNPACKED_DIR}"

MMS_MONITORING_AGENT_URL="https://mms.mongodb.com/settings/mms-monitoring-agent.tar.gz"
MMS_MONITORING_AGENT_UNPACKED_DIR="mms-agent"
MMS_MONITORING_HOME="${MMS_HOMEDIR}/${MMS_MONITORING_AGENT_UNPACKED_DIR}"

HOSTS_FILE="/etc/hosts"

JOB_MONITORING="mmsagent"
JOB_BACKUP="mmsbackup"

startJobs () {
  juju-log "starting ${JOB_BACKUP}"
  if [ -f /etc/init/${JOB_BACKUP} ]; then
    service ${JOB_BACKUP} start || service ${JOB_BACKUP} restart
  else
    juju-log "cannot start ${JOB_BACKUP}.  no upstart"
  fi
  juju-log "starting ${JOB_MONITORING}"
  if [ -f /etc/init/${JOB_MONITORING} ]; then
    service ${JOB_MONITORING} start || service ${JOB_MONITORING} restart
  else
    juju-log "cannot start ${JOB_MONITORING}.  no upstart"
  fi
}

stopJobs () {
  if [ -f /etc/init/${JOB_MONITORING}.conf ]; then
    service "${JOB_MONITORING}" stop || echo "not running"
    rm /etc/init/${JOB_MONITORING}.conf
  else
    juju-log "${JOB_MONITORING} not ready yet.  cannot stop"
  fi
  if [ -f /etc/init/${JOB_BACKUP}.conf ]; then
    service "${JOB_BACKUP}" stop || echo "not running"
    rm /etc/init/${JOB_BACKUP}.conf
  else
    juju-log "${JOB_BACKUP} not ready yet.  cannot stop"
  fi
}
