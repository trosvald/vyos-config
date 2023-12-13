#!/bin/vbash
# shellcheck shell=bash
# shellcheck source=/dev/null

#### infra ----------------------------------------------------------------------------
# (00) From infra to management
set firewall ipv4 name infra-mgmt default-action 'accept'
set firewall ipv4 name infra-mgmt description 'From infra to management'
### --- 999-management : Drop Invalid Packets
set firewall ipv4 name infra-mgmt rule 999 action 'drop'
set firewall ipv4 name infra-mgmt rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name infra-mgmt rule 999 log
set firewall ipv4 name infra-mgmt rule 999 state invalid

# (20) From infra to home
set firewall ipv4 name infra-home default-action 'drop'
set firewall ipv4 name infra-home description 'From infra to home'
set firewall ipv4 name infra-home enable-default-log
### --- 010-home : Accept HTTP/HTTPS Traffic (80,443)
set firewall ipv4 name infra-home rule 10 action 'accept'
set firewall ipv4 name infra-home rule 10 description 'Rule: Accept_HTTP_HTTPS'
set firewall ipv4 name infra-home rule 10 destination port 'http,https'
set firewall ipv4 name infra-home rule 10 protocol 'tcp'
### --- 999-home : Drop Invalid Packets
set firewall ipv4 name infra-home rule 999 action 'drop'
set firewall ipv4 name infra-home rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name infra-home rule 999 log
set firewall ipv4 name infra-home rule 999 state invalid

# (30) From infra to iot
set firewall ipv4 name infra-iot default-action 'drop'
set firewall ipv4 name infra-iot description 'From infra to iot'
set firewall ipv4 name infra-iot enable-default-log
### --- 010-iot : Accept HTTP/HTTPS Traffic (80,443)
set firewall ipv4 name infra-iot rule 10 action 'accept'
set firewall ipv4 name infra-iot rule 10 description 'Rule: Accept_HTTP_HTTPS'
set firewall ipv4 name infra-iot rule 10 destination port 'http,https'
set firewall ipv4 name infra-iot rule 10 protocol 'tcp'
### --- 999-iot : Drop Invalid Packets
set firewall ipv4 name infra-iot rule 999 action 'drop'
set firewall ipv4 name infra-iot rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name infra-iot rule 999 log
set firewall ipv4 name infra-iot rule 999 state invalid

# (40) From infra to cctv
set firewall ipv4 name infra-cctv default-action 'drop'
set firewall ipv4 name infra-cctv description 'From infra to cctv'
set firewall ipv4 name infra-cctv enable-default-log
### --- 010-cctv : Accept HTTP/HTTPS Traffic (80,443)
set firewall ipv4 name infra-cctv rule 10 action 'accept'
set firewall ipv4 name infra-cctv rule 10 description 'Rule: Accept_HTTP_HTTPS'
set firewall ipv4 name infra-cctv rule 10 destination port 'http,https'
set firewall ipv4 name infra-cctv rule 10 protocol 'tcp'
### --- 999-cctv : Drop Invalid Packets
set firewall ipv4 name infra-cctv rule 999 action 'drop'
set firewall ipv4 name infra-cctv rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name infra-cctv rule 999 log
set firewall ipv4 name infra-cctv rule 999 state invalid

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
set firewall ipv4 name infra-containers rule 999 log
set firewall ipv4 name infra-containers rule 999 state invalid

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
set firewall ipv4 name infra-local rule 11 action 'accept'
set firewall ipv4 name infra-local rule 11 description 'Rule: Accept_NTP'
set firewall ipv4 name infra-local rule 11 destination port 'ntp'
set firewall ipv4 name infra-local rule 11 protocol 'udp'
### --- 030-local : Accept BGP Traffic (179/tcp)
set firewall ipv4 name infra-local rule 12 action 'accept'
set firewall ipv4 name infra-local rule 12  description 'Rule: Accept_BGP'
set firewall ipv4 name infra-local rule 12 destination port 'bgp'
set firewall ipv4 name infra-local rule 12 protocol 'tcp'
### --- 040-local : Accept TFTP Traffic (69/udp)
set firewall ipv4 name infra-local rule 13 action 'accept'
set firewall ipv4 name infra-local rule 13 description 'Rule: Accept_TFTP'
set firewall ipv4 name infra-local rule 13 destination port '69'
set firewall ipv4 name infra-local rule 13 protocol 'udp'
### --- 050-local : Accept Prometheus Exporter from K8S Nodes Traffic (9100/tcp)
set firewall ipv4 name infra-local rule 14 action 'accept'
set firewall ipv4 name infra-local rule 14 description 'Rule: Accept_Prometheus_from_k8s'
set firewall ipv4 name infra-local rule 14 destination port '9100'
set firewall ipv4 name infra-local rule 14 protocol 'tcp'
set firewall ipv4 name infra-local rule 14 source group address-group 'k8s_nodes'
### --- 060-local : Accept Speedtest Exporter from K8S Nodes Traffic (9798/tcp)
set firewall ipv4 name infra-local rule 15 action 'accept'
set firewall ipv4 name infra-local rule 15 description 'Rule: Accept_Prometheus_from_k8s'
set firewall ipv4 name infra-local rule 15 destination port '9798'
set firewall ipv4 name infra-local rule 15 protocol 'tcp'
set firewall ipv4 name infra-local rule 15 source group address-group 'k8s_nodes'
### --- 999-local : Drop Invalid Packets
set firewall ipv4 name infra-local rule 999 action 'drop'
set firewall ipv4 name infra-local rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name infra-local rule 999 log
set firewall ipv4 name infra-local rule 999 state invalid

# (99) From infra to wan
set firewall ipv4 name infra-wan default-action 'accept'
set firewall ipv4 name infra-wan description 'From infra to wan'