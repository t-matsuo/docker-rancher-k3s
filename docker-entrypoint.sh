#!/bin/sh

echo "$1" | grep -q -e "^agent" -e "^server"
if [ $? -eq 0 ]; then
    CMD="$@"
elif [ "$1" != "" ]; then
    exec $@
fi

if [ -d /hook ]; then
   cd /hook
   for i in `ls *.sh`; do
       cd /hook
       echo "---- hook: /hook/$i ----"
       source /hook/$i || exit 1
       echo "------------------------"
   done
   cd /
fi

echo "----- env ----"
env
echo "--------------"
exec /bin/k3s $CMD
