#!/bin/vbash

# Firewall Rules for CONTAINERS Zone

# From CONTAINERS to IOT
set firewall ipv4 name containers-iot default-action 'drop'
set firewall ipv4 name containers-iot description 'From CONTAINERS to IOT'
set firewall ipv4 name containers-iot default-log
set firewall ipv4 name containers-iot rule 999 action 'drop'
set firewall ipv4 name containers-iot rule 999 description 'Rule: drop_invalid'
set firewall ipv4 name containers-iot rule 999 state invalid
set firewall ipv4 name containers-iot rule 999 log

# From CONTAINERS to HOME
set firewall ipv4 name containers-home default-action 'drop'
set firewall ipv4 name containers-home description 'From CONTAINERS to HOME'
set firewall ipv4 name containers-home default-log
set firewall ipv4 name containers-home rule 999 action 'drop'
set firewall ipv4 name containers-home rule 999 description 'Rule: drop_invalid'
set firewall ipv4 name containers-home rule 999 state invalid
set firewall ipv4 name containers-home rule 999 log

# From CONTAINERS to LOCAL
set firewall ipv4 name containers-local default-action 'drop'
set firewall ipv4 name containers-local description 'From CONTAINERS to LOCAL'
set firewall ipv4 name containers-local default-log
set firewall ipv4 name containers-local rule 40 action 'accept'
set firewall ipv4 name containers-local rule 40 description 'Rule: accept_dns'
set firewall ipv4 name containers-local rule 40 destination port 'domain,domain-s'
set firewall ipv4 name containers-local rule 40 protocol 'tcp_udp'
set firewall ipv4 name containers-local rule 50 action 'accept'
set firewall ipv4 name containers-local rule 50 description 'Rule: accept_dhcp'
set firewall ipv4 name containers-local rule 50 destination port '67,68'
set firewall ipv4 name containers-local rule 50 protocol 'udp'
set firewall ipv4 name containers-local rule 50 source port '67,68'
set firewall ipv4 name containers-local rule 60 action 'accept'
set firewall ipv4 name containers-local rule 60 description 'Rule: accept_ntp'
set firewall ipv4 name containers-local rule 60 destination port 'ntp'
set firewall ipv4 name containers-local rule 60 protocol 'udp'
set firewall ipv4 name containers-local rule 999 action 'drop'
set firewall ipv4 name containers-local rule 999 description 'Rule: drop_invalid'
set firewall ipv4 name containers-local rule 999 state invalid
set firewall ipv4 name containers-local rule 999 log

# From CONTAINERS to SERVERS/INFRA
set firewall ipv4 name containers-servers default-action 'accept'
set firewall ipv4 name containers-servers description 'From CONTAINERS to SERVERS'
set firewall ipv4 name containers-servers rule 999 action 'drop'
set firewall ipv4 name containers-servers rule 999 description 'Rule: drop_invalid'
set firewall ipv4 name containers-servers rule 999 state invalid
set firewall ipv4 name containers-servers rule 999 log

# From CONTAINERS to MGMT 
set firewall ipv4 name containers-mgmt default-action 'drop'
set firewall ipv4 name containers-mgmt description 'From CONTAINERS to MGMT'
set firewall ipv4 name containers-mgmt default-log
set firewall ipv4 name containers-mgmt rule 999 action 'drop'
set firewall ipv4 name containers-mgmt rule 999 description 'Rule: drop_invalid'
set firewall ipv4 name containers-mgmt rule 999 state invalid
set firewall ipv4 name containers-mgmt rule 999 log

# From CONTAINERS to CCTV
set firewall ipv4 name containers-cctv default-action 'drop'
set firewall ipv4 name containers-cctv description 'From CONTAINERS to CCTV'
set firewall ipv4 name containers-cctv default-log
set firewall ipv4 name containers-cctv rule 999 action 'drop'
set firewall ipv4 name containers-cctv rule 999 description 'Rule: drop_invalid'
set firewall ipv4 name containers-cctv rule 999 state invalid
set firewall ipv4 name containers-cctv rule 999 log

# From CONTAINERS to WAN
set firewall ipv4 name containers-wan default-action 'accept'
set firewall ipv4 name containers-wan description 'From CONTAINERS to WAN'
