#!/bin/vbash
# shellcheck shell=bash
# shellcheck source=/dev/null

#### wan ----------------------------------------------------------------------------
# (00) From wan to mgmt
set firewall ipv4 name wan-mgmt default-action 'drop'
set firewall ipv4 name wan-mgmt description 'From wan to mgmt'
set firewall ipv4 name wan-mgmt enable-default-log
### --- 999-mgmt : Drop Invalid Packets
set firewall ipv4 name wan-mgmt rule 999 action 'drop'
set firewall ipv4 name wan-mgmt rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name wan-mgmt rule 999 log
set firewall ipv4 name wan-mgmt rule 999 state invalid

# (10) From wan to infra
set firewall ipv4 name wan-infra default-action 'drop'
set firewall ipv4 name wan-infra description 'From wan to infra'
set firewall ipv4 name wan-infra enable-default-log
### --- 999-infra : Drop Invalid Packets
set firewall ipv4 name wan-infra rule 999 action 'drop'
set firewall ipv4 name wan-infra rule 999 description 'Rule: drop_invalid'
set firewall ipv4 name wan-infra rule 999 state invalid
set firewall ipv4 name wan-infra rule 999 log

# (20) From wan to home
set firewall ipv4 name wan-home default-action 'drop'
set firewall ipv4 name wan-home description 'From wan to home'
set firewall ipv4 name wan-home enable-default-log
### --- 999-home : Drop Invalid Packets
set firewall ipv4 name wan-home rule 999 action 'drop'
set firewall ipv4 name wan-home rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name wan-home rule 999 log
set firewall ipv4 name wan-home rule 999 state invalid

# (30) From wan to iot
set firewall ipv4 name wan-iot default-action 'drop'
set firewall ipv4 name wan-iot description 'From wan to iot'
set firewall ipv4 name wan-iot enable-default-log
### --- 999-iot : Drop Invalid Packets
set firewall ipv4 name wan-iot rule 999 action 'drop'
set firewall ipv4 name wan-iot rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name wan-iot rule 999 log
set firewall ipv4 name wan-iot rule 999 state invalid

# (40) From wan to cctv
set firewall ipv4 name wan-cctv default-action 'drop'
set firewall ipv4 name wan-cctv description 'From wan to cctv'
set firewall ipv4 name wan-cctv enable-default-log
### --- 999-cctv : Drop Invalid Packets
set firewall ipv4 name wan-cctv rule 999 action 'drop'
set firewall ipv4 name wan-cctv rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name wan-cctv rule 999 log
set firewall ipv4 name wan-cctv rule 999 state invalid

# (97) From wan to containers
set firewall ipv4 name wan-containers default-action 'accept'
set firewall ipv4 name wan-containers description 'From wan to containers'
### --- 999-containers : Drop Invalid Packets
set firewall ipv4 name wan-containers rule 999 action 'drop'
set firewall ipv4 name wan-containers rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name wan-containers rule 999 log
set firewall ipv4 name wan-containers rule 999 state invalid

# (98) From wan to local
set firewall ipv4 name wan-local default-action 'drop'
set firewall ipv4 name wan-local description 'From wan to local'
### --- 010-local : Accept WIREGUARD Traffic (51820)
set firewall ipv4 name wan-local rule 10 action 'accept'
set firewall ipv4 name wan-local rule 10 description 'Rule: Accept_wireguard'
set firewall ipv4 name wan-local rule 10 destination port '51820'
set firewall ipv4 name wan-local rule 10 protocol 'udp'
### --- 999-local : Drop Invalid Packets
set firewall ipv4 name wan-local rule 999 action 'drop'
set firewall ipv4 name wan-local rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name wan-local rule 999 log
set firewall ipv4 name wan-local rule 999 state invalid