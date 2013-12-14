SVC_NAME="mmsagent"
SVC_AUTHOR="Max Cantor <nax@docmunch.com>"
SVC_USER=${SVC_NAME}


MMS_URL="https://mms.mongodb.com/settings/mms-monitoring-agent.tar.gz"
MMS_HOMEDIR="/srv/mongo-management-service/agent"
MMS_UNPACKED_DIR="mms-agent"
MMS_HOME="${MMS_HOME}/${MMS_UNPACKED_DIR}"

HOSTS_FILE="/etc/hosts"

SVC_HOME=$MMS_HOME
