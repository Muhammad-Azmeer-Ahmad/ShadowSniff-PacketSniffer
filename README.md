# ShadowSniff

A lightweight C++ packet sniffer for Linux. Captures live network traffic from a network interface, logs raw packets to file, and includes a Python script for post-capture analysis.

> **Requires root privileges.** Only use on networks you own or have authorization to monitor.

---

## Features

- **Live Capture** — Captures packets in real time from any available network interface
- **Packet Logging** — Writes raw packet data to `logs/packet.log` for offline review
- **Python Analyzer** — `src/analyzer.py` parses and summarizes captured log data
- **CLI-driven** — No GUI dependencies; minimal footprint

---

## Requirements

- Linux OS (raw socket support required)
- G++ compiler
- Python 3
- Root privileges (`sudo`)

---

## Getting Started

```bash
git clone https://github.com/Muhammad-Azmeer-Ahmad/ShadowSniff-PacketSniffer.git
cd ShadowSniff-PacketSniffer

# Compile
g++ src/main.cpp src/packet_sniffer.cpp src/protocol_parser.cpp -o src/shadowsniff

# Make run script executable
chmod +x run.sh

# Run
sudo ./run.sh
```

---

## Analyze Captured Packets

```bash
python3 src/analyzer.py
```

Reads from `logs/packet.log` and outputs a structured summary of captured traffic.

---

## Project Structure

```
ShadowSniff/
├── run.sh                        # Build and run script
├── logs/
│   └── packet.log                # Captured packet output
└── src/
    ├── main.cpp                  # Entry point
    ├── packet_sniffer.cpp        # Capture logic (raw sockets)
    ├── packet_sniffer.h
    ├── protocol_parser.cpp       # Protocol parsing (TCP/UDP/ICMP)
    └── analyzer.py               # Python log analyzer
```

---

## License

MIT
