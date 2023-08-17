#!/bin/bash

date

ls /var/run/httpd/httpd.pid &> /dev/null

# if [ $? -eq 0 ]
if [ -f /var/run/httpd/httpd.pid ]
then 
    echo "HTTPD process is running"
else
    echo "HTTPD process is not running"
    echo "Starting the process"
    systemctl start httpd
    if [ $? -eq 0 ]
    then
        echo "Process started successfully"
    else
        echo "Process starting failed"
    fi
fi

