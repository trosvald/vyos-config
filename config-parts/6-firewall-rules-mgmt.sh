#!/bin/vbash

# Firewall Rules for MGMT Zone
# From mgmt to IOT
set firewall ipv4 name mgmt-iot default-action 'accept'
set firewall ipv4 name mgmt-iot description 'From mgmt to IOT'
set firewall ipv4 name mgmt-iot default-log
set firewall ipv4 name mgmt-iot rule 999 action 'drop'
set firewall ipv4 name mgmt-iot rule 999 description 'Rule: drop_invalid'
set firewall ipv4 name mgmt-iot rule 999 state invalid
set firewall ipv4 name mgmt-iot rule 999 log

# From mgmt to home
set firewall ipv4 name mgmt-home default-action 'accept'
set firewall ipv4 name mgmt-home description 'From mgmt to home'
set firewall ipv4 name mgmt-home default-log
set firewall ipv4 name mgmt-home rule 999 action 'drop'
set firewall ipv4 name mgmt-home rule 999 description 'Rule: drop_invalid'
set firewall ipv4 name mgmt-home rule 999 state invalid
set firewall ipv4 name mgmt-home rule 999 log

# From mgmt to LOCAL
set firewall ipv4 name mgmt-local default-action 'accept'
set firewall ipv4 name mgmt-local description 'From mgmt to LOCAL'
set firewall ipv4 name mgmt-local default-log
set firewall ipv4 name mgmt-local rule 999 action 'drop'
set firewall ipv4 name mgmt-local rule 999 description 'Rule: drop_invalid'
set firewall ipv4 name mgmt-local rule 999 state invalid
set firewall ipv4 name mgmt-local rule 999 log

# From mgmt to SERVERS
set firewall ipv4 name mgmt-servers default-action 'accept'
set firewall ipv4 name mgmt-servers description 'From mgmt to SERVERS'
set firewall ipv4 name mgmt-servers default-log
set firewall ipv4 name mgmt-servers rule 999 action 'drop'
set firewall ipv4 name mgmt-servers rule 999 description 'Rule: drop_invalid'
set firewall ipv4 name mgmt-servers rule 999 state invalid
set firewall ipv4 name mgmt-servers rule 999 log

# From mgmt to CONTAINERS
set firewall ipv4 name mgmt-containers default-action 'accept'
set firewall ipv4 name mgmt-containers description 'From mgmt to CONTAINERS'
set firewall ipv4 name mgmt-containers default-log
set firewall ipv4 name mgmt-containers rule 999 action 'drop'
set firewall ipv4 name mgmt-containers rule 999 description 'Rule: drop_invalid'
set firewall ipv4 name mgmt-containers rule 999 state invalid
set firewall ipv4 name mgmt-containers rule 999 log

# From mgmt to cctv
set firewall ipv4 name mgmt-cctv default-action 'accept'
set firewall ipv4 name mgmt-cctv description 'From mgmt to cctv'
set firewall ipv4 name mgmt-cctv default-log
set firewall ipv4 name mgmt-cctv rule 999 action 'drop'
set firewall ipv4 name mgmt-cctv rule 999 description 'Rule: drop_invalid'
set firewall ipv4 name mgmt-cctv rule 999 state invalid
set firewall ipv4 name mgmt-cctv rule 999 log

# From mgmt to WAN
set firewall ipv4 name mgmt-wan default-action 'accept'
set firewall ipv4 name mgmt-wan description 'From mgmt to WAN'