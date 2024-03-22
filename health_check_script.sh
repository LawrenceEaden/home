#!/bin/bash

# Function to check Mullvad connection status
check_mullvad_status() {
    # Check Mullvad connection status
    mullvad_response=$(curl -sS https://am.i.mullvad.net/connected)
    if [[ "$mullvad_response" == *"You are connected to Mullvad"* ]]; then
        echo "Mullvad ✅"
        return 0  # Exit code 0 for success
    else
        echo "Mullvad ❌"
        return 1  # Exit code 1 for failure
    fi
}

# Function to check localhost service port
check_localhost_port() {
    # Check if localhost service port is reachable
    port=$1
    localhost_response=$(curl -IsS http://localhost:$port)
    if [[ "$localhost_response" == *"HTTP"*"200"* ]]; then
        echo "localhost:$port ✅"
        return 0  # Exit code 0 for success
    else
        echo "localhost:$port ❌"
        return 1  # Exit code 1 for failure
    fi
}

# Function to check Tailscale connection status
check_tailscale_status() {
    # Check Tailscale connection status
    tailscale_response=$(curl -IsS http://100.100.100.100)
    if [[ "$tailscale_response" == *"HTTP"*"200"* ]]; then
        echo "Tailscale ✅"
        return 0  # Exit code 0 for success
    else
        echo "Tailscale ❌"
        return 1  # Exit code 1 for failure
    fi
}

# Usage: ./health_check_script.sh <port>
# Example: ./health_check_script.sh 8080

# Check if port argument is provided
if [ $# -ne 1 ]; then
  echo "Usage: $0 <port>"
  exit 1
fi

# Call functions to perform health checks
check_mullvad_status
mullvad_status=$?

check_localhost_port "$1"
localhost_status=$?

check_tailscale_status
tailscale_status=$?

# Determine overall health status based on individual checks
if [ $mullvad_status -eq 0 ] && [ $localhost_status -eq 0 ] && [ $tailscale_status -eq 0 ]; then
  exit 0  # Exit with success status code
else
  exit 1  # Exit with failure status code
fi

