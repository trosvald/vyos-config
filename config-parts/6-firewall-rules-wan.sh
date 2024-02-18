#!/bin/vbash

# Firewall Rules for wan Zone
# From WAN to IOT
set firewall ipv4 name wan-iot default-action 'drop'
set firewall ipv4 name wan-iot description 'From WAN to IOT'
set firewall ipv4 name wan-iot default-log
set firewall ipv4 name wan-iot rule 999 action 'drop'
set firewall ipv4 name wan-iot rule 999 description 'Rule: drop_invalid'
set firewall ipv4 name wan-iot rule 999 state invalid
set firewall ipv4 name wan-iot rule 999 log

# From WAN to home
set firewall ipv4 name wan-home default-action 'drop'
set firewall ipv4 name wan-home description 'From WAN to home'
set firewall ipv4 name wan-home default-log
set firewall ipv4 name wan-home rule 999 action 'drop'
set firewall ipv4 name wan-home rule 999 description 'Rule: drop_invalid'
set firewall ipv4 name wan-home rule 999 state invalid
set firewall ipv4 name wan-home rule 999 log

# From WAN to LOCAL
set firewall ipv4 name wan-local default-action 'drop'
set firewall ipv4 name wan-local description 'From WAN to LOCAL'
set firewall ipv4 name wan-local default-log
set firewall ipv4 name wan-local rule 1 action 'drop'
set firewall ipv4 name wan-local rule 1 description 'Rule: drop_invalid'
set firewall ipv4 name wan-local rule 1 state invalid
set firewall ipv4 name wan-local rule 1 log
set firewall ipv4 name wan-local rule 100 action 'accept'
set firewall ipv4 name wan-local rule 100 description 'Rule: accept_wireguard'
set firewall ipv4 name wan-local rule 100 destination port '51820'
set firewall ipv4 name wan-local rule 100 protocol 'udp'

# From WAN to SERVERS
set firewall ipv4 name wan-servers default-action 'drop'
set firewall ipv4 name wan-servers description 'From WAN to SERVERS'
set firewall ipv4 name wan-servers default-log
set firewall ipv4 name wan-servers rule 999 action 'drop'
set firewall ipv4 name wan-servers rule 999 description 'Rule: drop_invalid'
set firewall ipv4 name wan-servers rule 999 state invalid
set firewall ipv4 name wan-servers rule 999 log

# From WAN to CONTAINERS
set firewall ipv4 name wan-containers default-action 'drop'
set firewall ipv4 name wan-containers description 'From WAN to CONTAINERS'
set firewall ipv4 name wan-containers default-log
set firewall ipv4 name wan-containers rule 999 action 'drop'
set firewall ipv4 name wan-containers rule 999 description 'Rule: drop_invalid'
set firewall ipv4 name wan-containers rule 999 state invalid
set firewall ipv4 name wan-containers rule 999 log

# From WAN to mgmt
set firewall ipv4 name wan-mgmt default-action 'drop'
set firewall ipv4 name wan-mgmt description 'From WAN to mgmt'
set firewall ipv4 name wan-mgmt default-log
set firewall ipv4 name wan-mgmt rule 999 action 'drop'
set firewall ipv4 name wan-mgmt rule 999 description 'Rule: drop_invalid'
set firewall ipv4 name wan-mgmt rule 999 state invalid
set firewall ipv4 name wan-mgmt rule 999 log

# From WAN to cctv
set firewall ipv4 name wan-cctv default-action 'drop'
set firewall ipv4 name wan-cctv description 'From WAN to cctv'
set firewall ipv4 name wan-cctv default-log
set firewall ipv4 name wan-cctv rule 999 action 'drop'
set firewall ipv4 name wan-cctv rule 999 description 'Rule: drop_invalid'
set firewall ipv4 name wan-cctv rule 999 state invalid
set firewall ipv4 name wan-cctv rule 999 log