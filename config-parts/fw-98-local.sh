#!/bin/vbash
# shellcheck shell=bash
# shellcheck source=/dev/null

#### local ----------------------------------------------------------------------------
# (00) From local to mgmt
set firewall ipv4 name local-mgmt default-action 'drop'
set firewall ipv4 name local-mgmt description 'From local to mgmt'
set firewall ipv4 name local-mgmt enable-default-log
### --- 999-mgmt : Drop Invalid Packets
set firewall ipv4 name local-mgmt rule 999 action 'drop'
set firewall ipv4 name local-mgmt rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name local-mgmt rule 999 log 'enable'
set firewall ipv4 name local-mgmt rule 999 state invalid 'enable'

# (10) From local to infra
set firewall ipv4 name local-infra default-action 'drop'
set firewall ipv4 name local-infra description 'From local to infra'
set firewall ipv4 name local-infra enable-default-log
### --- 10-infra : Accept DNS Traffic (53,953)
set firewall ipv4 name local-infra rule 10 action 'accept'
set firewall ipv4 name local-infra rule 10 description 'Rule: accept_dns'
set firewall ipv4 name local-infra rule 10 destination port 'domain,domain-s'
set firewall ipv4 name local-infra rule 10 protocol 'tcp_udp'
### --- 20-infra : Accept BGP Traffic (179)
set firewall ipv4 name local-infra rule 20 action 'accept'
set firewall ipv4 name local-infra rule 20 description 'Rule: accept_bgp'
set firewall ipv4 name local-infra rule 20 destination port 'bgp'
set firewall ipv4 name local-infra rule 20 protocol 'tcp'
### --- 30-infra : Accept K8S API Traffic (6443)
set firewall ipv4 name local-infra rule 30 action 'accept'
set firewall ipv4 name local-infra rule 30 description 'Rule: accept_k8s_api'
set firewall ipv4 name local-infra rule 30 destination port '6443'
set firewall ipv4 name local-infra rule 30 protocol 'tcp'
### --- 40-infra : Accept Vector Aggregator Traffic (6003)
set firewall ipv4 name local-infra rule 40 action 'accept'
set firewall ipv4 name local-infra rule 40 description 'Rule: accept_vector_syslog'
set firewall ipv4 name local-infra rule 40 destination group address-group 'k8s_vector_aggregator'
set firewall ipv4 name local-infra rule 40 destination port '6003'
set firewall ipv4 name local-infra rule 40 protocol 'tcp'
### --- 999-infra : Drop Invalid Packets
set firewall ipv4 name local-infra rule 999 action 'drop'
set firewall ipv4 name local-infra rule 999 description 'Rule: drop_invalid'
set firewall ipv4 name local-infra rule 999 state invalid 'enable'
set firewall ipv4 name local-infra rule 999 log 'enable'

# (20) From local to home
set firewall ipv4 name local-home default-action 'drop'
set firewall ipv4 name local-home description 'From local to home'
set firewall ipv4 name local-home enable-default-log
### --- 999-home : Drop Invalid Packets
set firewall ipv4 name local-home rule 999 action 'drop'
set firewall ipv4 name local-home rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name local-home rule 999 log 'enable'
set firewall ipv4 name local-home rule 999 state invalid 'enable'

# (30) From local to iot
set firewall ipv4 name local-iot default-action 'drop'
set firewall ipv4 name local-iot description 'From local to iot'
set firewall ipv4 name local-iot enable-default-log
### --- 10-iot: Accept MDNS Traffic
set firewall ipv4 name local-iot rule 10 action 'accept'
set firewall ipv4 name local-iot rule 10 description 'Rule: Accept_MDNS'
set firewall ipv4 name local-iot rule 10 destination port 'mdns'
set firewall ipv4 name local-iot rule 10 protocol 'udp'
set firewall ipv4 name local-iot rule 10 source port 'mdns'
### --- 20-iot: Accept IGMP
set firewall ipv4 name local-iot rule 20 action 'accept'
set firewall ipv4 name local-iot rule 20 description 'Rule: Accept_IGMP'
set firewall ipv4 name local-iot rule 20 protocol '2'
### --- 999-iot : Drop Invalid Packets
set firewall ipv4 name local-iot rule 999 action 'drop'
set firewall ipv4 name local-iot rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name local-iot rule 999 log 'enable'
set firewall ipv4 name local-iot rule 999 state invalid 'enable'

# (40) From local to cctv
set firewall ipv4 name local-cctv default-action 'drop'
set firewall ipv4 name local-cctv description 'From local to cctv'
set firewall ipv4 name local-cctv enable-default-log
### --- 999-cctv : Drop Invalid Packets
set firewall ipv4 name local-cctv rule 999 action 'drop'
set firewall ipv4 name local-cctv rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name local-cctv rule 999 log 'enable'
set firewall ipv4 name local-cctv rule 999 state invalid 'enable'

# (97) From local to containers
set firewall ipv4 name local-containers default-action 'accept'
set firewall ipv4 name local-containers description 'From local to containers'
### --- 010-containers : Accept DNS Traffic (domain,domain-s)
set firewall ipv4 name local-containers rule 10 action 'accept'
set firewall ipv4 name local-containers rule 10 description 'Rule: Accept_DNS'
set firewall ipv4 name local-containers rule 10 destination port 'domain,domain-s'
set firewall ipv4 name local-containers rule 10 protocol 'tcp_udp'
### --- 999-containers : Drop Invalid Packets
set firewall ipv4 name local-containers rule 999 action 'drop'
set firewall ipv4 name local-containers rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name local-containers rule 999 log 'enable'
set firewall ipv4 name local-containers rule 999 state invalid 'enable'

# (99) From local to wan
set firewall ipv4 name local-wan default-action 'accept'
set firewall ipv4 name local-wan description 'From local to wan'