#!/sbin/openrc-run

depend() {
	need net
	after dns
}

servername=$(echo $1 | awk -F . '{print $NF}')

AUTOSSH_PIDFILE=/run/autossh/$servername.pid
AUTOSSH_LOGFILE=/var/log/autossh/$servername.log

start() {
	mkdir -p /run/autossh /var/log/autossh
	chown autossh:autossh /run/autossh /var/log/autossh

	forwards=''
	for forward in $LOCALFORWARDS; do
		forwards="$forwards -L $(echo $forward | sed 's/:/:localhost:/')"
	done

	export AUTOSSH_PIDFILE
	export AUTOSSH_LOGFILE

	ebegin "Setting up SSH tunnel(s) to $servername"
	start-stop-daemon --start \
		--user autossh \
		--pidfile "${AUTOSSH_PIDFILE}" \
		--exec /usr/bin/autossh -- -M 0 -f \
			-N -o 'ServerAliveInterval 60' -o 'ServerAliveCountMax 3' \
			-l $LOGIN \
			$HOST -p $PORT \
			-i /home/autossh/.ssh/$servername \
			$forwards
	eend $?
}

stop() {
	ebegin "Closing SSH tunnel(s) to $servername"
	start-stop-daemon --stop --pidfile "${AUTOSSH_PIDFILE}"
	eend $?
}
