#!/bin/vbash
# shellcheck shell=bash
# shellcheck source=/dev/null

#### infra ----------------------------------------------------------------------------
# (00) From infra to management
set firewall ipv4 name infra-management default-action 'accept'
set firewall ipv4 name infra-management description 'From infra to management'
### --- 999-management : Drop Invalid Packets
set firewall ipv4 name infra-management rule 999 action 'drop'
set firewall ipv4 name infra-management rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name infra-management rule 999 log 'enable'
set firewall ipv4 name infra-management rule 999 state invalid 'enable'

# (20) From infra to home
set firewall ipv4 name infra-home default-action 'drop'
set firewall ipv4 name infra-home description 'From infra to home'
set firewall ipv4 name infra-home enable-default-log
### --- 010-home : Accept HTTP Traffic (80)
set firewall ipv4 name infra-home rule 10 action 'accept'
set firewall ipv4 name infra-home rule 10 description 'Rule: Accept_HTTP'
set firewall ipv4 name infra-home rule 10 destination port '80'
set firewall ipv4 name infra-home rule 10 protocol 'tcp'
### --- 020-home : Accept HTTPS Traffic (443)
set firewall ipv4 name infra-home rule 20 action 'accept'
set firewall ipv4 name infra-home rule 20 description 'Rule: Accept_HTTPS'
set firewall ipv4 name infra-home rule 20 destination port '443'
set firewall ipv4 name infra-home rule 20 protocol 'tcp'
### --- 999-home : Drop Invalid Packets
set firewall ipv4 name infra-home rule 999 action 'drop'
set firewall ipv4 name infra-home rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name infra-home rule 999 log 'enable'
set firewall ipv4 name infra-home rule 999 state invalid 'enable'

# (30) From infra to iot
set firewall ipv4 name infra-iot default-action 'drop'
set firewall ipv4 name infra-iot description 'From infra to iot'
set firewall ipv4 name infra-iot enable-default-log
### --- 010-iot : Accept HTTP Traffic (80)
set firewall ipv4 name infra-iot rule 10 action 'accept'
set firewall ipv4 name infra-iot rule 10 description 'Rule: Accept_HTTP'
set firewall ipv4 name infra-iot rule 10 destination port '80'
set firewall ipv4 name infra-iot rule 10 protocol 'tcp'
### --- 020-iot : Accept HTTPS Traffic (443)
set firewall ipv4 name infra-iot rule 20 action 'accept'
set firewall ipv4 name infra-iot rule 20 description 'Rule: Accept_HTTPS'
set firewall ipv4 name infra-iot rule 20 destination port '443'
set firewall ipv4 name infra-iot rule 20 protocol 'tcp'
### --- 999-iot : Drop Invalid Packets
set firewall ipv4 name infra-iot rule 999 action 'drop'
set firewall ipv4 name infra-iot rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name infra-iot rule 999 log 'enable'
set firewall ipv4 name infra-iot rule 999 state invalid 'enable'

# (40) From infra to cctv
set firewall ipv4 name infra-cctv default-action 'drop'
set firewall ipv4 name infra-cctv description 'From infra to cctv'
set firewall ipv4 name infra-cctv enable-default-log
### --- 010-cctv : Accept HTTP Traffic (80)
set firewall ipv4 name infra-cctv rule 10 action 'accept'
set firewall ipv4 name infra-cctv rule 10 description 'Rule: Accept_HTTP'
set firewall ipv4 name infra-cctv rule 10 destination port '80'
set firewall ipv4 name infra-cctv rule 10 protocol 'tcp'
### --- 020-cctv : Accept HTTPS Traffic (443)
set firewall ipv4 name infra-cctv rule 20 action 'accept'
set firewall ipv4 name infra-cctv rule 20 description 'Rule: Accept_HTTPS'
set firewall ipv4 name infra-cctv rule 20 destination port '443'
set firewall ipv4 name infra-cctv rule 20 protocol 'tcp'
### --- 999-cctv : Drop Invalid Packets
set firewall ipv4 name infra-cctv rule 999 action 'drop'
set firewall ipv4 name infra-cctv rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name infra-cctv rule 999 log 'enable'
set firewall ipv4 name infra-cctv rule 999 state invalid 'enable'

# (97) From infra to containers
set firewall ipv4 name infra-containers default-action 'accept'
set firewall ipv4 name infra-containers description 'From infra to containers'
### --- 010-containers : Accept DNS Traffic (domain,domain-s)
set firewall ipv4 name infra-containers rule 10 action 'accept'
set firewall ipv4 name infra-containers rule 10 description 'Rule: Accept_DNS'
set firewall ipv4 name infra-containers rule 10 destination port 'domain,domain-s'
set firewall ipv4 name infra-containers rule 10 protocol 'tcp_udp'
### --- 999-containers : Drop Invalid Packets
set firewall ipv4 name infra-containers rule 999 action 'drop'
set firewall ipv4 name infra-containers rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name infra-containers rule 999 log 'enable'
set firewall ipv4 name infra-containers rule 999 state invalid 'enable'

# (98) From infra to local
set firewall ipv4 name infra-local default-action 'drop'
set firewall ipv4 name infra-local description 'From infra to local'
set firewall ipv4 name infra-local enable-default-log
### --- 010-local : Accept DHCP Traffic (67/udp,68/udp)
set firewall ipv4 name infra-local rule 10 action 'accept'
set firewall ipv4 name infra-local rule 10 description 'Rule: Accept_DHCP'
set firewall ipv4 name infra-local rule 10 destination port '67,68'
set firewall ipv4 name infra-local rule 10 protocol 'udp'
set firewall ipv4 name infra-local rule 10 source port '67,68'
### --- 020-local : Accept NTP Traffic (123/udp)
set firewall ipv4 name infra-local rule 20 action 'accept'
set firewall ipv4 name infra-local rule 20 description 'Rule: Accept_NTP'
set firewall ipv4 name infra-local rule 20 destination port 'ntp'
set firewall ipv4 name infra-local rule 20 protocol 'udp'
### --- 030-local : Accept BGP Traffic (179/tcp)
set firewall ipv4 name infra-local rule 30 action 'accept'
set firewall ipv4 name infra-local rule 30 description 'Rule: Accept_BGP'
set firewall ipv4 name infra-local rule 30 destination port 'bgp'
set firewall ipv4 name infra-local rule 30 protocol 'tcp'
### --- 040-local : Accept TFTP Traffic (69/udp)
set firewall ipv4 name infra-local rule 40 action 'accept'
set firewall ipv4 name infra-local rule 40 description 'Rule: Accept_TFTP'
set firewall ipv4 name infra-local rule 40 destination port '69'
set firewall ipv4 name infra-local rule 40 protocol 'udp'
### --- 050-local : Accept Prometheus Exporter from K8S Nodes Traffic (9100/tcp)
set firewall ipv4 name infra-local rule 50 action 'accept'
set firewall ipv4 name infra-local rule 50 description 'Rule: Accept_Prometheus_from_k8s'
set firewall ipv4 name infra-local rule 50 destination port '9100'
set firewall ipv4 name infra-local rule 50 protocol 'tcp'
set firewall ipv4 name infra-local rule 50 source group address-group 'k8s_nodes'
### --- 060-local : Accept Speedtest Exporter from K8S Nodes Traffic (9798/tcp)
set firewall ipv4 name infra-local rule 50 action 'accept'
set firewall ipv4 name infra-local rule 50 description 'Rule: Accept_Prometheus_from_k8s'
set firewall ipv4 name infra-local rule 50 destination port '9798'
set firewall ipv4 name infra-local rule 50 protocol 'tcp'
set firewall ipv4 name infra-local rule 50 source group address-group 'k8s_nodes'
### --- 999-local : Drop Invalid Packets
set firewall ipv4 name infra-local rule 999 action 'drop'
set firewall ipv4 name infra-local rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name infra-local rule 999 log 'enable'
set firewall ipv4 name infra-local rule 999 state invalid 'enable'

# (99) From infra to wan
set firewall ipv4 name infra-wan default-action 'accept'
set firewall ipv4 name infra-wan description 'From infra to wan'