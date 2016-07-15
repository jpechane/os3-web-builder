#/bin/bash
export APACHE_LOCK_DIR=/apache2/lock
export APACHE_LOG_DIR=/apache2/log
export APACHE_PID_FILE=/apache2/apache.pid
/usr/sbin/apache2 -d /apache2/etc -DNO_DETACH -DFOREGROUND
