import subprocess

bluetooth_output = subprocess.getoutput("bluetoothctl devices")
devices = bluetooth_output.splitlines()
bluetooth_options = ["on", "off"] + devices

result = subprocess.run(["tofi", "--prompt-text", "Bluetooth:"], input="\n".join(bluetooth_options), text=True, capture_output=True)
if result.returncode == 0:
    chosen = result.stdout.strip()
    if chosen == "on":
        subprocess.run(["bluetoothctl", "power", "on"])
    elif chosen == "off":
        subprocess.run(["bluetoothctl", "power", "off"])
    else:
        subprocess.run(["bluetoothctl", "connect", chosen.split(" ")[1]])
