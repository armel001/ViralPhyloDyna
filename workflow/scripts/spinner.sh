#!/bin/bash

# Spinner function
spin() {
    local pid=$1
    local delay=0.2
    local spinstr='|/-\\'
    while kill -0 $pid 2>/dev/null; do
        for i in {1..4}; do
            printf "\r${spinstr:i%4:1}"
            sleep $delay
        done
    done
    printf "\r|\n"  # clear the spinner when done
}

# Ensure the script is run with a PID as an argument
if [ -z "$1" ]; then
    echo "Error: No PID provided. Please pass the PID of the background process."
    exit 1
fi

# Start the spinner function with the provided PID
spin $1
