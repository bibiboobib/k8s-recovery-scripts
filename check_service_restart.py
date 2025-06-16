import requests
import subprocess
import telegram_send
from datetime import datetime

SERVICE_URL = ""
CONTAINER_NAME = ""

def check_service():
    try:
        response = requests.get(SERVICE_URL, timeout=5)
        return response.status_code == 200
    except requests.RequestException:
        return False

def restart_container():
    subprocess.run(["docker", "restart", CONTAINER_NAME], check=True)
    telegram_send.send(messages=[f"Restarted {CONTAINER_NAME} at {datetime.now()}"])

if __name__ == "__main__":
    if not check_service():
        restart_container()
    else:
        print("Service is healthy")
