#!/bin/vbash
# shellcheck shell=bash
# shellcheck source=/dev/null

#### iot ----------------------------------------------------------------------------
# (00) From iot to management
set firewall ipv4 name iot-mgmt default-action 'drop'
set firewall ipv4 name iot-mgmt description 'From iot to mgmt'
set firewall ipv4 name iot-mgmt enable-default-log
### --- 999-mgmt : Drop Invalid Packets
set firewall ipv4 name iot-mgmt rule 999 action 'drop'
set firewall ipv4 name iot-mgmt rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name iot-mgmt rule 999 log
set firewall ipv4 name iot-mgmt rule 999 state invalid

# (10) From iot to infra
set firewall ipv4 name iot-infra default-action 'drop'
set firewall ipv4 name iot-infra description 'From iot to infra'
set firewall ipv4 name iot-infra enable-default-log
### ---10-infra : Accept MQTT Traffic (1883/tcp)
set firewall ipv4 name iot-infra rule 10 action 'accept'
set firewall ipv4 name iot-infra rule 10 description 'Rule: Accept_MQTT'
set firewall ipv4 name iot-infra rule 10 destination port '1883'
set firewall ipv4 name iot-infra rule 10 protocol 'tcp'
### ---11-infra: Accept HTTP/HTTPS Traffic (80/443)
set firewall ipv4 name iot-infra rule 11 action 'accept'
set firewall ipv4 name iot-infra rule 11 description 'Rule: Accept_HTTP_HTTPS'
set firewall ipv4 name iot-infra rule 11 destination port 'http,https'
set firewall ipv4 name iot-infra rule 11 protocol 'tcp'
### --- 999-infra : Drop Invalid Packets
set firewall ipv4 name iot-infra rule 999 action 'drop'
set firewall ipv4 name iot-infra rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name iot-infra rule 999 log
set firewall ipv4 name iot-infra rule 999 state invalid

# (20) From iot to home
set firewall ipv4 name iot-home default-action 'drop'
set firewall ipv4 name iot-home description 'From iot to home'
set firewall ipv4 name iot-home enable-default-log
### --- 999-home : Drop Invalid Packets
set firewall ipv4 name iot-home rule 999 action 'drop'
set firewall ipv4 name iot-home rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name iot-home rule 999 log
set firewall ipv4 name iot-home rule 999 state invalid

# (40) From iot to cctv
set firewall ipv4 name iot-cctv default-action 'drop'
set firewall ipv4 name iot-cctv description 'From iot to cctv'
set firewall ipv4 name iot-cctv enable-default-log
### --- 999-cctv : Drop Invalid Packets
set firewall ipv4 name iot-cctv rule 999 action 'drop'
set firewall ipv4 name iot-cctv rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name iot-cctv rule 999 log
set firewall ipv4 name iot-cctv rule 999 state invalid

# (97) From iot to containers
set firewall ipv4 name iot-containers default-action 'drop'
set firewall ipv4 name iot-containers description 'From iot to containers'
set firewall ipv4 name iot-containers enable-default-log
### --- 10-containers : Accept DNS Traffic (53/953)
set firewall ipv4 name iot-containers rule 10 action 'accept'
set firewall ipv4 name iot-containers rule 10 description 'Rule: Accept_DNS'
set firewall ipv4 name iot-containers rule 10 destination port 'domain,domain-s'
set firewall ipv4 name iot-containers rule 10 destination group address-group 'dns_svc' 
set firewall ipv4 name iot-containers rule 10 protocol 'tcp_udp'
### --- 999-containers : Drop Invalid Packets
set firewall ipv4 name iot-containers rule 999 action 'drop'
set firewall ipv4 name iot-containers rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name iot-containers rule 999 log
set firewall ipv4 name iot-containers rule 999 state invalid

# (98) From iot to local
set firewall ipv4 name iot-local default-action 'drop'
set firewall ipv4 name iot-local description 'From iot to local'
set firewall ipv4 name iot-local enable-default-log
### --- 010-local : Accept DHCP Traffic (67/udp,68/udp)
set firewall ipv4 name iot-local rule 10 action 'accept'
set firewall ipv4 name iot-local rule 10 description 'Rule: Accept_DHCP'
set firewall ipv4 name iot-local rule 10 destination port '67,68'
set firewall ipv4 name iot-local rule 10 protocol 'udp'
set firewall ipv4 name iot-local rule 10 source port '67,68'
### --- 011-local : Accept NTP Traffic (123/udp)
set firewall ipv4 name iot-local rule 11 action 'accept'
set firewall ipv4 name iot-local rule 11 description 'Rule: Accept_NTP'
set firewall ipv4 name iot-local rule 11 destination port 'ntp'
set firewall ipv4 name iot-local rule 11 protocol 'udp'
### --- 999-local : Drop Invalid Packets
set firewall ipv4 name iot-local rule 999 action 'drop'
set firewall ipv4 name iot-local rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name iot-local rule 999 log
set firewall ipv4 name iot-local rule 999 state invalid

# (99) From iot to wan
set firewall ipv4 name iot-wan default-action 'accept'
set firewall ipv4 name iot-wan description 'From iot to wan'