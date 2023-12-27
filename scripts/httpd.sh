#!/bin/bash

# Check if httpd service is running
if systemctl status httpd | grep -q 'running'; then
    echo "httpd service is running."
else
    echo "httpd service is not running. Starting httpd..."
    # Attempt to start httpd service
    systemctl start httpd

    # Check if the service started successfully
    if systemctl status httpd | grep -q 'running'; then
        echo "httpd service started successfully."
    else
        echo "Failed to start httpd service."
    fi
fi