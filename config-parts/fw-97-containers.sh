#!/bin/vbash
# shellcheck shell=bash
# shellcheck source=/dev/null

#### containers ----------------------------------------------------------------------------
# (00) From containers to management
set firewall ipv4 name containers-mgmt default-action 'drop'
set firewall ipv4 name containers-mgmt description 'From containers to mgmt'
set firewall ipv4 name containers-mgmt enable-default-log
### --- 999-mgmt : Drop Invalid Packets
set firewall ipv4 name containers-mgmt rule 999 action 'drop'
set firewall ipv4 name containers-mgmt rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name containers-mgmt rule 999 log
set firewall ipv4 name containers-mgmt rule 999 state invalid

# (10) From containers to infra
set firewall ipv4 name containers-infra default-action 'accept'
set firewall ipv4 name containers-infra description 'From containers to infra'
### --- 010-infra : Accept K8S-API From HAPROXY (6443/tcp)
set firewall ipv4 name containers-infra rule 10 action 'accept'
set firewall ipv4 name containers-infra rule 10 description 'Rule: Accept_K8S_API_From_HAPROXY'
set firewall ipv4 name containers-infra rule 10 destination port '6443'
set firewall ipv4 name containers-infra rule 10 protocol 'tcp'
set firewall ipv4 name containers-infra rule 10 source group address-group 'vyos_haproxy'
set firewall ipv4 name containers-infra rule 10 destination group address-group 'k8s_nodes'
### --- 011-infra : Accept Talos API From HAPROXY (50000/tcp)
set firewall ipv4 name containers-infra rule 11 action 'accept'
set firewall ipv4 name containers-infra rule 11 description 'Rule: Accept_Talos_API_From_HAPROXY'
set firewall ipv4 name containers-infra rule 11 destination port '50000'
set firewall ipv4 name containers-infra rule 11 protocol 'tcp'
set firewall ipv4 name containers-infra rule 11 source group address-group 'vyos_haproxy'
set firewall ipv4 name containers-infra rule 11 destination group address-group 'k8s_nodes'
### --- 999-infra : Drop Invalid Packets
set firewall ipv4 name containers-infra rule 999 action 'drop'
set firewall ipv4 name containers-infra rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name containers-infra rule 999 log
set firewall ipv4 name containers-infra rule 999 state invalid

# (20) From containers to home
set firewall ipv4 name containers-home default-action 'drop'
set firewall ipv4 name containers-home description 'From containers to home'
set firewall ipv4 name containers-home enable-default-log
### --- 999-home : Drop Invalid Packets
set firewall ipv4 name containers-home rule 999 action 'drop'
set firewall ipv4 name containers-home rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name containers-home rule 999 log
set firewall ipv4 name containers-home rule 999 state invalid

# (30) From containers to iot
set firewall ipv4 name containers-iot default-action 'drop'
set firewall ipv4 name containers-iot description 'From containers to iot'
set firewall ipv4 name containers-iot enable-default-log
### --- 999-iot : Drop Invalid Packets
set firewall ipv4 name containers-iot rule 999 action 'drop'
set firewall ipv4 name containers-iot rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name containers-iot rule 999 log
set firewall ipv4 name containers-iot rule 999 state invalid

# (40) From containers to cctv
set firewall ipv4 name containers-cctv default-action 'drop'
set firewall ipv4 name containers-cctv description 'From containers to cctv'
set firewall ipv4 name containers-cctv enable-default-log
### --- 999-cctv : Drop Invalid Packets
set firewall ipv4 name containers-cctv rule 999 action 'drop'
set firewall ipv4 name containers-cctv rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name containers-cctv rule 999 log
set firewall ipv4 name containers-cctv rule 999 state invalid

# (98) From containers to local
set firewall ipv4 name containers-local default-action 'drop'
set firewall ipv4 name containers-local description 'From containers to local'
set firewall ipv4 name containers-local enable-default-log
### --- 010-local : Accept DHCP Traffic (67/udp,68/udp)
set firewall ipv4 name containers-local rule 10 action 'accept'
set firewall ipv4 name containers-local rule 10 description 'Rule: Accept_DHCP'
set firewall ipv4 name containers-local rule 10 destination port '67,68'
set firewall ipv4 name containers-local rule 10 protocol 'udp'
set firewall ipv4 name containers-local rule 10 source port '67,68'
### --- 011-local : Accept NTP Traffic (123/udp)
set firewall ipv4 name containers-local rule 11 action 'accept'
set firewall ipv4 name containers-local rule 11 description 'Rule: Accept_NTP'
set firewall ipv4 name containers-local rule 11 destination port 'ntp'
set firewall ipv4 name containers-local rule 11 protocol 'udp'
### --- 999-local : Drop Invalid Packets
set firewall ipv4 name containers-local rule 999 action 'drop'
set firewall ipv4 name containers-local rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name containers-local rule 999 log
set firewall ipv4 name containers-local rule 999 state invalid

# (99) From containers to wan
set firewall ipv4 name containers-wan default-action 'accept'
set firewall ipv4 name containers-wan description 'From containers to wan'