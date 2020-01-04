#!/bin/sh

# Handle Container start and stop
pid=0

#Define cleanup procedure
cleanup() {
	if [ $pid -ne 0 ] ; then
		echo "Container stopped, performing cleanup"
		# wait "$pid"
	fi
	exit 143; # 128 + 15 -- SIGTERM
}

# Setup handlers
# On callback, kill the last background process, which is `tail -f /dev/null` and execute the specified handler
trap 'kill ${!}; cleanup' SIGTERM

# Start the application
/usr/local/bin/networkpolicy-collector.sh &
pid="$!"

# wait forever
while true
do
  tail -f /dev/null & wait ${!}
done