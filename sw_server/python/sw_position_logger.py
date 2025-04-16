import time
import re
from pathlib import Path

log_dir = Path (r"Y:\sw_server\tf\logs")
log_pattern = re.compile(r"\[RCBOTPOS\] .*?pos: ([\d\.\-]+) ([\d\.\-]+) ([\d\.\-]+)")

def follow_log_file(log_file)
    with open(log_file, "r") as f:
        f.seek(0, 2)
        while True:
            line = f.readline()
            if not line:
                time.sleep(0.1)
                continue
            match = log_pattern.search(line)
            if match:
                x, y, z, = match.groups()
                print(f"Bot Position -> X: {x} | Y: {y} | Z: {z}")

def find_latest_log():
    log_files = list(log_dir.glob("L*.log"))
    if not log_files:
        print("No log files found.")
        return None
    latest = max(log_files, key=lambda f: f.stat().st_mime)
    return latest

if __name__ == "__main__":
    log_file = find_latest_log()
    if log_file:
        print(f"Monitoring: {log_file}")
        follow_log_file(log_file)