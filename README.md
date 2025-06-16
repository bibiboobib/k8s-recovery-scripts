# Kubernetes Recovery Automation
Scripts to automate recovery of failed Kubernetes pods and Docker containers, reducing downtime from 15 to 2 minutes.

## Features
- Restarts Kubernetes pods in CrashLoopBackOff/Error states.
- Checks and restarts Docker containers via health endpoints.
- Sends Telegram alerts.

## Setup
1. Install kubectl and Docker.
2. Configure Telegram bot token.
3. Run via cron: `*/5 * * * * /path/to/restart_failed_pods.sh`.

## Results
- Achieved 99.9%+ uptime for a gambling platform.
