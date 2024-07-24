#!/bin/bash

# Replace these with your bot token and chat ID
BOT_TOKEN="your_bot_token_here"
CHAT_ID="your_chat_id_here"

# Function to send notification to Telegram
send_notification() {
    MESSAGE="Warning: All CPU cores are using more than 80%!"
    URL="https://api.telegram.org/bot$BOT_TOKEN/sendMessage"
    curl -s -X POST $URL -d chat_id=$CHAT_ID -d text="$MESSAGE"
}

# Get the number of CPU cores
NUM_CORES=$(grep -c ^processor /proc/cpuinfo)

# Flag to determine if all cores are above 80%
ALL_CORES_HIGH=1

# Check CPU usage
for i in $(seq 0 $((NUM_CORES - 1))); do
    USAGE=$(sar -P $i 1 1 | grep "Average" | awk '{print 100 - $NF}')

    # Debugging output
    echo "Core $i: USAGE=$USAGE"

    # Ensure the USAGE value is valid
    if [[ ! $USAGE =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
        echo "Core $i: Invalid usage value: $USAGE"
        continue
    fi

    # Convert usage to integer
    USAGE_INT=$(printf "%.0f" "$USAGE")

    # Debugging output
    echo "Core $i: USAGE_INT=$USAGE_INT"

    # Check if the core usage is 80% or below
    if (( USAGE_INT <= 80 )); then
        ALL_CORES_HIGH=0
        break
    fi
done

# Debugging output
echo "ALL_CORES_HIGH=$ALL_CORES_HIGH"

# Send notification if all cores are above 80%
if (( ALL_CORES_HIGH == 1 )); then
    send_notification
fi
