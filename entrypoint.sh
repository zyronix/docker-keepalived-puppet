#!/bin/bash

# Set localtime
ln -sf /usr/share/zoneinfo/$LOCALTIME /etc/localtime

# Run Puppet
if [ $MANIFEST_FILE ]
then
  puppet apply --modulepath=/puppet/modules $MANIFEST_FILE 
else
  puppet apply --modulepath=/puppet/modules /puppet/run.pp
fi

# Run
/usr/sbin/keepalived -P -C -d -D -S 7 -f /etc/keepalived/keepalived.conf --dont-fork --log-console
