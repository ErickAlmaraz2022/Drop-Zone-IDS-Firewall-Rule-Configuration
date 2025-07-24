# Drop Zone: IDS & Firewall Rule Configuration

## Overview
This project simulates the role of a Junior Security Administrator at an indoor skydiving company to enforce PCI/DSS compliance through Snort rule analysis and firewalld zone management. The project is divided into two key components:

- **Part 1: Snort Rule Analysis**  
  Analyze two Emerging Threats Snort rules to understand how they detect VNC scans and Windows binary downloads over HTTP.

- **Part 2: Firewall Configuration with firewalld**  
  Create and configure firewall zones (public, web, sales, mail) using `firewalld` inside Docker. Apply access control rules based on service types and network interfaces, and drop traffic from known malicious IPs.

## Skills Demonstrated
- Intrusion Detection System (IDS) rule analysis
- Snort rule syntax and thresholding
- `firewalld` zone and interface configuration
- Rich rules for traffic blocking
- PCI/DSS-compliant firewall practices
- Docker-based network simulation

## Tools Used
- Snort (ET Open Rules)
- firewalld
- Docker
- Linux CLI

## Threat IPs Blocked
- `10.208.56.23`
- `135.95.103.76`
- `76.34.169.118`
