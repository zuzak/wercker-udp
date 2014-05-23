#!/bin/sh
command="nc -up"
message="[wercker] "
if [ -n "$WERCKER_UDP_HOST" ] ; then
	command="$command $WERCKER_UDP_HOST"
else
	command="$command localhost"
fi

if [ -n "$WERCKER_UDP_PORT" ] ; then
	command="$command $WERCKER_UDP_PORT"
else
	command-"$command 3000"
fi

message="[wercker] $WERCKER_APPLICATION_OWNER_NAME/$WERCKER_APPLICATION_NAME:"
message="$message build $WERCKER_RESULT ($WERCKER_STARTED_BY on $WECKER_GIT_BRANCH"

echo $message > $command
echo "Sent $WERCKER_RESULT message to $WERCKER_UDP_HOST:$WERCKER_UDP_PORT"
