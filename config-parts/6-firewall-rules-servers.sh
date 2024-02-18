#!/bin/vbash

# Firewall Rules for servers Zone
# From SERVERS to IOT
set firewall ipv4 name servers-iot default-action 'drop'
set firewall ipv4 name servers-iot description 'From SERVERS to IOT'
set firewall ipv4 name servers-iot default-log
set firewall ipv4 name servers-iot rule 10 action 'accept'
set firewall ipv4 name servers-iot rule 10 description 'Rule: accept_k8s_nodes'
set firewall ipv4 name servers-iot rule 10 protocol 'tcp'
set firewall ipv4 name servers-iot rule 10 source group address-group 'k8s_nodes'
set firewall ipv4 name servers-iot rule 20 action 'accept'
set firewall ipv4 name servers-iot rule 20 description 'Rule: accept_k8s_nodes'
set firewall ipv4 name servers-iot rule 20 protocol 'icmp'
set firewall ipv4 name servers-iot rule 20 source group address-group 'k8s_nodes'
set firewall ipv4 name servers-iot rule 999 action 'drop'
set firewall ipv4 name servers-iot rule 999 description 'Rule: drop_invalid'
set firewall ipv4 name servers-iot rule 999 state invalid
set firewall ipv4 name servers-iot rule 999 log

# From SERVERS to HOME
set firewall ipv4 name servers-home default-action 'drop'
set firewall ipv4 name servers-home description 'From SERVERS to HOME'
set firewall ipv4 name servers-home default-log
set firewall ipv4 name servers-home rule 999 action 'drop'
set firewall ipv4 name servers-home rule 999 description 'Rule: drop_invalid'
set firewall ipv4 name servers-home rule 999 state invalid
set firewall ipv4 name servers-home rule 999 log

# From SERVERS to LOCAL
set firewall ipv4 name servers-local default-action 'drop'
set firewall ipv4 name servers-local description 'From SERVERS to LOCAL'
set firewall ipv4 name servers-local default-log
set firewall ipv4 name servers-local rule 10 action 'accept'
set firewall ipv4 name servers-local rule 10 description 'Rule: accept_dhcp'
set firewall ipv4 name servers-local rule 10 destination port '67,68'
set firewall ipv4 name servers-local rule 10 protocol 'udp'
set firewall ipv4 name servers-local rule 10 source port '67,68'
set firewall ipv4 name servers-local rule 20 action 'accept'
set firewall ipv4 name servers-local rule 20 description 'Rule: accept_ntp'
set firewall ipv4 name servers-local rule 20 destination port 'ntp'
set firewall ipv4 name servers-local rule 20 protocol 'udp'
set firewall ipv4 name servers-local rule 30 action 'accept'
set firewall ipv4 name servers-local rule 30 description 'Rule: accept_bgp'
set firewall ipv4 name servers-local rule 30 destination port 'bgp'
set firewall ipv4 name servers-local rule 30 protocol 'tcp'
set firewall ipv4 name servers-local rule 40 action 'accept'
set firewall ipv4 name servers-local rule 40 description 'Rule: accept_tftp'
set firewall ipv4 name servers-local rule 40 destination port '69'
set firewall ipv4 name servers-local rule 40 protocol 'udp'
set firewall ipv4 name servers-local rule 50 action 'accept'
set firewall ipv4 name servers-local rule 50 description 'Rule: accept_node_exporter_from_k8s_nodes'
set firewall ipv4 name servers-local rule 50 destination port '950'
set firewall ipv4 name servers-local rule 50 protocol 'tcp'
set firewall ipv4 name servers-local rule 50 source group address-group 'k8s_nodes'
set firewall ipv4 name servers-local rule 60 action 'accept'
set firewall ipv4 name servers-local rule 60 description 'Rule: accept_speedtest_exporter_from_k8s_nodes'
set firewall ipv4 name servers-local rule 60 destination port '9798'
set firewall ipv4 name servers-local rule 60 protocol 'tcp'
set firewall ipv4 name servers-local rule 60 source group address-group 'k8s_nodes'
set firewall ipv4 name servers-local rule 999 action 'drop'
set firewall ipv4 name servers-local rule 999 description 'Rule: drop_invalid'
set firewall ipv4 name servers-local rule 999 state invalid
set firewall ipv4 name servers-local rule 999 log

# From SERVERS to CONTAINERS
set firewall ipv4 name servers-containers default-action 'accept'
set firewall ipv4 name servers-containers description 'From SERVERS to CONTAINERS'
set firewall ipv4 name servers-containers default-log
set firewall ipv4 name servers-containers rule 10 action 'accept'
set firewall ipv4 name servers-containers rule 10 description 'Rule: accept_dns'
set firewall ipv4 name servers-containers rule 10 destination port 'domain,domain-s'
set firewall ipv4 name servers-containers rule 10 protocol 'tcp_udp'
set firewall ipv4 name servers-containers rule 20 action 'accept'
set firewall ipv4 name servers-containers rule 20 description 'Rule: accept_k8s_nodes'
set firewall ipv4 name servers-containers rule 20 protocol 'tcp'
set firewall ipv4 name servers-containers rule 20 source group address-group 'k8s_nodes'
set firewall ipv4 name servers-containers rule 999 action 'drop'
set firewall ipv4 name servers-containers rule 999 description 'Rule: drop_invalid'
set firewall ipv4 name servers-containers rule 999 state invalid
set firewall ipv4 name servers-containers rule 999 log

# From SERVERS to mgmt
set firewall ipv4 name servers-mgmt default-action 'accept'
set firewall ipv4 name servers-mgmt description 'From SERVERS to mgmt'
set firewall ipv4 name servers-mgmt default-log
set firewall ipv4 name servers-mgmt rule 999 action 'drop'
set firewall ipv4 name servers-mgmt rule 999 description 'Rule: drop_invalid'
set firewall ipv4 name servers-mgmt rule 999 state invalid
set firewall ipv4 name servers-mgmt rule 999 log

# From SERVERS to cctv
set firewall ipv4 name servers-cctv default-action 'drop'
set firewall ipv4 name servers-cctv description 'From SERVERS to cctv'
set firewall ipv4 name servers-cctv default-log
set firewall ipv4 name servers-cctv rule 10 action 'accept'
set firewall ipv4 name servers-cctv rule 10 description 'Rule: accept_k8s_nodes'
set firewall ipv4 name servers-cctv rule 10 protocol 'tcp_udp'
set firewall ipv4 name servers-cctv rule 10 source group address-group 'k8s_nodes'
set firewall ipv4 name servers-cctv rule 999 action 'drop'
set firewall ipv4 name servers-cctv rule 999 description 'Rule: drop_invalid'
set firewall ipv4 name servers-cctv rule 999 state invalid
set firewall ipv4 name servers-cctv rule 999 log

# From SERVERS to WAN
set firewall ipv4 name servers-wan default-action 'accept'
set firewall ipv4 name servers-wan description 'From SERVERS to WAN'

