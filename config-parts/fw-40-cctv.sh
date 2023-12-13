#!/bin/vbash
# shellcheck shell=bash
# shellcheck source=/dev/null

#### cctv ----------------------------------------------------------------------------
# (00) From cctv to management
set firewall ipv4 name cctv-mgmt default-action 'drop'
set firewall ipv4 name cctv-mgmt description 'From cctv to mgmt'
set firewall ipv4 name cctv-mgmt enable-default-log
### --- 999-mgmt : Drop Invalid Packets
set firewall ipv4 name cctv-mgmt rule 999 action 'drop'
set firewall ipv4 name cctv-mgmt rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name cctv-mgmt rule 999 log 
set firewall ipv4 name cctv-mgmt rule 999 state invalid

# (10) From cctv to infra
set firewall ipv4 name cctv-infra default-action 'drop'
set firewall ipv4 name cctv-infra description 'From cctv to infra'
set firewall ipv4 name cctv-infra enable-default-log
### --- 999-infra : Drop Invalid Packets
set firewall ipv4 name cctv-infra rule 999 action 'drop'
set firewall ipv4 name cctv-infra rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name cctv-infra rule 999 log
set firewall ipv4 name cctv-infra rule 999 state invalid

# (20) From cctv to home
set firewall ipv4 name cctv-home default-action 'drop'
set firewall ipv4 name cctv-home description 'From cctv to home'
set firewall ipv4 name cctv-home enable-default-log
### --- 999-home : Drop Invalid Packets
set firewall ipv4 name cctv-home rule 999 action 'drop'
set firewall ipv4 name cctv-home rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name cctv-home rule 999 log
set firewall ipv4 name cctv-home rule 999 state invalid

# (30) From cctv to iot
set firewall ipv4 name cctv-iot default-action 'drop'
set firewall ipv4 name cctv-iot description 'From cctv to iot'
set firewall ipv4 name cctv-iot enable-default-log
### --- 999-iot : Drop Invalid Packets
set firewall ipv4 name cctv-iot rule 999 action 'drop'
set firewall ipv4 name cctv-iot rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name cctv-iot rule 999 log
set firewall ipv4 name cctv-iot rule 999 state invalid

# (97) From cctv to containers
set firewall ipv4 name cctv-containers default-action 'drop'
set firewall ipv4 name cctv-containers description 'From cctv to containers'
set firewall ipv4 name cctv-containers enable-default-log
### --- 10-containers : Accept DNS Traffic (53/953)
set firewall ipv4 name cctv-containers rule 10 action 'accept'
set firewall ipv4 name cctv-containers rule 10 description 'Rule: Accept_DNS'
set firewall ipv4 name cctv-containers rule 10 destination port 'domain,domain-s'
set firewall ipv4 name cctv-containers rule 10 destination group address-group 'dns_svc' 
set firewall ipv4 name cctv-containers rule 10 protocol 'tcp_udp'
### --- 999-containers : Drop Invalid Packets
set firewall ipv4 name cctv-containers rule 999 action 'drop'
set firewall ipv4 name cctv-containers rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name cctv-containers rule 999 log
set firewall ipv4 name cctv-containers rule 999 state invalid

# (98) From cctv to local
set firewall ipv4 name cctv-local default-action 'drop'
set firewall ipv4 name cctv-local description 'From cctv to local'
set firewall ipv4 name cctv-local enable-default-log
### --- 010-local : Accept DHCP Traffic (67/udp,68/udp)
set firewall ipv4 name cctv-local rule 10 action 'accept'
set firewall ipv4 name cctv-local rule 10 description 'Rule: Accept_DHCP'
set firewall ipv4 name cctv-local rule 10 destination port '67,68'
set firewall ipv4 name cctv-local rule 10 protocol 'udp'
set firewall ipv4 name cctv-local rule 10 source port '67,68'
### --- 011-local : Accept NTP Traffic (123/udp)
set firewall ipv4 name cctv-local rule 11 action 'accept'
set firewall ipv4 name cctv-local rule 11 description 'Rule: Accept_NTP'
set firewall ipv4 name cctv-local rule 11 destination port 'ntp'
set firewall ipv4 name cctv-local rule 11 protocol 'udp'
### --- 999-local : Drop Invalid Packets
set firewall ipv4 name cctv-local rule 999 action 'drop'
set firewall ipv4 name cctv-local rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name cctv-local rule 999 log
set firewall ipv4 name cctv-local rule 999 state invalid

# (99) From cctv to wan
set firewall ipv4 name cctv-wan default-action 'accept'
set firewall ipv4 name cctv-wan description 'From cctv to wan'