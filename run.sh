#!/bin/sh
cmd="nc -u"
message="[wercker] "
if [ -n "$WERCKER_UDP_HOST" ] ; then
	cmd="$cmd $WERCKER_UDP_HOST"
else
	cmd="$cmd localhost"
fi

if [ -n "$WERCKER_UDP_PORT" ] ; then
	cmd="$cmd $WERCKER_UDP_PORT"
else
	cmd="$cmd 3000"
fi

message="[wercker] $WERCKER_APPLICATION_OWNER_NAME/$WERCKER_APPLICATION_NAME:"
message="$message build $WERCKER_RESULT ($WERCKER_STARTED_BY on $WECKER_GIT_BRANCH)"

echo "Sending $message"
echo $message | $cmd
echo "Sent $WERCKER_RESULT message to $WERCKER_UDP_HOST:$WERCKER_UDP_PORT"
