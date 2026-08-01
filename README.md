# ShadowSniff

**A lightweight C++ packet sniffer for Linux — real-time capture, raw logging, and Python-based traffic analysis.**

[![Language](https://img.shields.io/badge/language-C%2B%2B-blue.svg)](https://isocpp.org/)
[![Platform](https://img.shields.io/badge/platform-Linux-lightgrey.svg)](https://www.linux.org/)
[![Python](https://img.shields.io/badge/analyzer-Python%203-yellow.svg)](https://www.python.org/)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](#license)
[![Status](https://img.shields.io/badge/status-active-success.svg)](#)

> ⚠️ **Requires root privileges.** ShadowSniff opens raw sockets and must be run with `sudo`. Only use it on networks you own or are explicitly authorized to monitor. Unauthorized packet capture may be illegal in your jurisdiction.

> 🐧 **Linux only — will not run on native Windows.** ShadowSniff uses raw sockets (`AF_PACKET`), a Linux kernel feature with no equivalent on Windows — this includes Git Bash, MINGW64, and Cygwin, which only emulate a Unix-like shell on top of the Windows kernel. Attempting to compile or run it there will fail with errors like `g++: command not found` or `Exec format error`. **Windows users must run this inside [WSL2](https://learn.microsoft.com/en-us/windows/wsl/install)** (`wsl --install`, then use an Ubuntu shell) or a Linux VM.

---

## Demo

<p align="center">
  <img src="assets/demo.gif" alt="ShadowSniff running: live packet capture followed by Python analyzer output" width="800">
</p>

<p align="center"><i>Live capture with <code>run.sh</code>, followed by traffic summary via <code>analyzer.py</code>.</i></p>

---

## Features

| Feature | Description |
|---|---|
| **Live Capture** | Captures packets in real time from any available network interface using raw sockets |
| **Packet Logging** | Writes raw packet data to `logs/packet.log` for offline review |
| **Protocol Parsing** | Parses TCP, UDP, and ICMP headers at the packet level |
| **Python Analyzer** | `src/analyzer.py` parses captured logs and outputs a structured traffic summary |
| **Zero GUI Overhead** | Pure CLI tool — no GUI dependencies, minimal footprint |

---

## Requirements

- **Linux OS** (raw socket support required) — native Linux, WSL2, or a Linux VM. **Not compatible with native Windows, Git Bash, MINGW64, or Cygwin.**
- `g++` (C++11 or later)
- Python 3
- Root privileges (`sudo`)

### Windows Users

Native Windows cannot run ShadowSniff — there's no raw-socket equivalent outside the Linux kernel. Use **WSL2** instead:

```bash
# In PowerShell (one-time setup)
wsl --install

# Then open the Ubuntu shell it installs and continue below
sudo apt update && sudo apt install g++ python3 -y
```

Once inside WSL2's Ubuntu shell, follow the standard steps below as normal.

---

## Installation & Usage

> The package already includes a ready-to-use `run.sh` script — no setup required beyond compiling, so you can build and test instantly.

```bash
# Clone the repository
git clone https://github.com/Muhammad-Azmeer-Ahmad/ShadowSniff-PacketSniffer.git
cd ShadowSniff-PacketSniffer

# Compile
g++ src/main.cpp src/packet_sniffer.cpp src/protocol_parser.cpp -o src/shadowsniff

# Make the run script executable
chmod +x run.sh

# Run (root required for raw sockets)
sudo ./run.sh
```

### Analyze Captured Packets

```bash
python3 src/analyze.py
```

Reads from `logs/packet.log` and prints a structured summary of captured traffic (packet counts, protocol breakdown, top talkers, etc.).

---

## Project Structure

```
ShadowSniff/
├── run.sh                        # Build and run script
├── assets/
│   └── demo.gif                  # Demo recording (see below)
├── logs/
│   └── packet.log                # Captured packet output
└── src/
    ├── main.cpp                  # Entry point
    ├── packet_sniffer.cpp        # Capture logic (raw sockets)
    ├── packet_sniffer.h
    ├── protocol_parser.cpp       # Protocol parsing (TCP/UDP/ICMP)
    └── analyzer.py                # Python log analyzer
```

---

## Roadmap

- [ ] Add packet filtering by protocol/IP/port
- [ ] Export captures to `.pcap` format for Wireshark compatibility
- [ ] Add unit tests for `protocol_parser.cpp`
- [ ] Optional JSON output mode for `analyzer.py`

---

## License

This project is licensed under the [MIT License](LICENSE).

---

## Author

Built by [Muhammad Azmeer Ahmad](https://github.com/Muhammad-Azmeer-Ahmad).
