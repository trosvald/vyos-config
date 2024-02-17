#!/bin/vbash

# Bond0 eth1 & eth2
set interfaces bonding bond0 address '172.16.10.254/24'
set interfaces bonding bond0 description 'MANAGEMENT'
set interfaces bonding bond0 hash-policy 'layer2'
set interfaces bonding bond0 member interface 'eth1'
set interfaces bonding bond0 member interface 'eth2'
set interfaces bonding bond0 mode '802.3ad'
set interfaces bonding bond0 vif 1612 address '172.16.12.254/24'
set interfaces bonding bond0 vif 1612 description 'HOME'
set interfaces bonding bond0 vif 1614 address '172.16.14.254/24'
set interfaces bonding bond0 vif 1614 description 'CCTV'

# Bond1 eth3 & eth4
set interfaces bonding bond1 address '172.16.11.254/24'
set interfaces bonding bond1 description 'INFRA'
set interfaces bonding bond1 hash-policy 'layer2'
set interfaces bonding bond1 member interface 'eth3'
set interfaces bonding bond1 member interface 'eth4'
set interfaces bonding bond0 mode '802.3ad'
set interfaces bonding bond0 vif 1613 address '172.16.13.254/24'
set interfaces bonding bond0 vif 1613 description 'IoT'

# PPPoE on eth0
set interfaces pppoe pppoe0 authentication password "${SECRET_ISP_AUTH_PASSWORD}"
set interfaces pppoe pppoe0 authentication username "${SECRET_ISP_AUTH_USER}"
set interfaces pppoe pppoe0 description 'WAN - PPPoE'
set interfaces pppoe pppoe0 ip adjust-mss 'clamp-mss-to-pmtu'
set interfaces pppoe pppoe0 mtu '1492'
set interfaces pppoe pppoe0 source-interface 'eth0'

# Wireguard
set interfaces wireguard wg01 address '10.12.12.1/24'
set interfaces wireguard wg01 description 'Wireguard VPN'
set interfaces wireguard wg01 peer monosense allowed-ips '10.12.12.2/32'
set interfaces wireguard wg01 peer monosense public-key "${SECRET_WIREGUARD_PUBLIC_KEY}"
set interfaces wireguard wg01 port '51820'
set interfaces wireguard wg01 private-key "${SECRET_WIREGUARD_PRIVATE_KEY}"
