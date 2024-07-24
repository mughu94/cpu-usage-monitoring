# CPU Monitor Script (`cpumonitor.sh`)

This script monitors the CPU usage of all cores on a Linux system and sends a notification to a specified Telegram chat if all cores are using more than 80% of their capacity.

## Prerequisites

- Linux system with `sar` (part of the `sysstat` package) installed.
- A Telegram bot token and chat ID for sending notifications.

## Setup

1. **Install the `sysstat` package** (if not already installed):

    ```sh
    sudo apt-get update
    sudo apt-get install sysstat
    ```

2. **Create a Telegram bot** to get a bot token. Follow the instructions on the [Telegram Bot API page](https://core.telegram.org/bots).

3. **Get your chat ID**. You can use the [IDBot](https://telegram.me/myidbot) on Telegram to get your chat ID.

## Usage

1. **Clone the repository**:

    ```sh
    git clone [https://github.com/yourusername/yourrepository.git](https://github.com/mughu94/cpu-usage-monitoring.git)
    cd cpu-usage-monitoring
    ```

2. **Edit the script** to add your Telegram bot token and chat ID:

    ```sh
    nano cpumonitor.sh
    ```

    Replace the placeholders `your_bot_token_here` and `your_chat_id_here` with your actual bot token and chat ID:

    ```sh
    BOT_TOKEN="your_bot_token_here"
    CHAT_ID="your_chat_id_here"
    ```

3. **Make the script executable** (if not already executable):

    ```sh
    chmod +x cpumonitor.sh
    ```

4. **Run the script**:

    ```sh
    ./cpumonitor.sh
    ```

## Scheduling the Script

To run the script at regular intervals, you can add a cron job. For example, to check CPU usage every 5 minutes:

1. Open the crontab editor:

    ```sh
    crontab -e
    ```

2. Add the following line to the crontab file:

    ```sh
    */5 * * * * /path/to/cpumonitor.sh
    ```

    This will run the script every 5 minutes.

## License

This project is licensed under the MIT License.
