#!/bin/bash
hostline=$(flyctl status | grep Hostname)
if [[ $? -ne 0 ]]; then
    echo "$0: flyctl status exited with an error. Please fix that error before continuing."
    exit;
fi
found_hostname=$(echo $hostline | grep -c Hostname)
if [ "$found_hostname" != "1" ]; then
    echo "$0: hostname not found in output for flyctl status. Exiting setup script."
    exit;
fi

hostname=$(echo $hostline | grep Hostname | cut -d '=' -f 2 | xargs)

sed -i '' -e "s/<FLY_HOSTNAME>/$hostname/g" */settings.py

echo "$0: Hostname set to $hostname. You can now delete this script:"
echo "> rm $0"