# CPU Usage Monitor Script

This script monitors the CPU usage of all cores and sends a notification to a Telegram chat if all cores exceed 80% usage.

## Prerequisites

Ensure you have the following installed on your system:

- `curl`: for sending notifications to Telegram.
- `sysstat` package: for the `sar` command.

To install the required packages on a Debian-based system (e.g., Ubuntu), run:

```bash
sudo apt-get install curl sysstat
