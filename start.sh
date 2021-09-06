#!/bin/sh -x

# Edited from the default forge launch.sh
# Original notice below:
# ===========
# Server Launch Script
#
# Thrown together by Neeve in under five minutes, Public Domain
# https://github.com/Neeve01
#

# DO NOT EDIT UNLESS YOU KNOW WHAT YOU'RE DOING
FORGEJAR='forge-1.12.2-14.23.5.2847-universal.jar'
JAVA_PARAMETERS=''

# these you can edit
MIN_RAM='4096M'
MAX_RAM='4096M'

# DO NOT EDIT ANYTHING PAST THIS LINE
LAUNCHPARAMS="-server -Xms$MIN_RAM -Xmx$MAX_RAM $JAVA_PARAMETERS -jar $FORGEJAR nogui"

echo "Launching the server...\n"
echo "> java $LAUNCHPARAMS\n"

export PATH=/opt/java/openjdk/bin:$PATH

java $LAUNCHPARAMS

echo "The server has stopped."
