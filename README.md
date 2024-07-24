# CPU Usage Monitor Script

This script monitors the CPU usage of all cores and sends a notification to a Telegram chat if all cores exceed 80% usage.

## Script Configuration

1. **Replace the placeholders** in the script with your actual Telegram bot token and chat ID:

    ```bash
    BOT_TOKEN="your_bot_token_here"
    CHAT_ID="your_chat_id_here"
    ```

    You need to replace `your_bot_token_here` with the token you received from BotFather and `your_chat_id_here` with the ID of the chat where you want to receive notifications.

## Prerequisites

Ensure you have the following installed on your system:

- `curl`: for sending notifications to Telegram.
- `sysstat` package: for the `sar` command.

To install the required packages on a Debian-based system (e.g., Ubuntu), run:

```bash
sudo apt-get install curl sysstat
