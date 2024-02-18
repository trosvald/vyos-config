#!/bin/vbash

# Firewall Rules for LOCAL Zone
# From LOCAL to IOT
set firewall ipv4 name local-iot default-action 'drop'
set firewall ipv4 name local-iot description 'From LOCAL to IOT'
set firewall ipv4 name local-iot default-log
set firewall ipv4 name local-iot rule 10 action 'accept'
set firewall ipv4 name local-iot rule 10 description 'Rule: accept_igmp'
set firewall ipv4 name local-iot rule 10 protocol '2'
set firewall ipv4 name local-iot rule 20 action 'accept'
set firewall ipv4 name local-iot rule 20 description 'Rule: accept_mdns'
set firewall ipv4 name local-iot rule 20 destination port 'mdns'
set firewall ipv4 name local-iot rule 20 protocol 'udp'
set firewall ipv4 name local-iot rule 20 source port 'mdns'
set firewall ipv4 name local-iot rule 999 action 'drop'
set firewall ipv4 name local-iot rule 999 description 'Rule: drop_invalid'
set firewall ipv4 name local-iot rule 999 state invalid
set firewall ipv4 name local-iot rule 999 log

# From LOCAL to home
set firewall ipv4 name local-home default-action 'drop'
set firewall ipv4 name local-home description 'From LOCAL to home'
set firewall ipv4 name local-home default-log
set firewall ipv4 name local-home rule 10 action 'accept'
set firewall ipv4 name local-home rule 10 description 'Rule: accept_igmp'
set firewall ipv4 name local-home rule 10 protocol '2'
set firewall ipv4 name local-home rule 20 action 'accept'
set firewall ipv4 name local-home rule 20 description 'Rule: accept_mdns'
set firewall ipv4 name local-home rule 20 destination port 'mdns'
set firewall ipv4 name local-home rule 20 protocol 'udp'
set firewall ipv4 name local-home rule 20 source port 'mdns'
set firewall ipv4 name local-home rule 999 action 'drop'
set firewall ipv4 name local-home rule 999 description 'Rule: drop_invalid'
set firewall ipv4 name local-home rule 999 state invalid
set firewall ipv4 name local-home rule 999 log

# From LOCAL to SERVERS
set firewall ipv4 name local-servers default-action 'drop'
set firewall ipv4 name local-servers description 'From LOCAL to SERVERS'
set firewall ipv4 name local-servers default-log
set firewall ipv4 name local-servers rule 10 action 'accept'
set firewall ipv4 name local-servers rule 10 description 'Rule: accept_dns'
set firewall ipv4 name local-servers rule 10 destination port 'domain,domain-s'
set firewall ipv4 name local-servers rule 10 protocol 'tcp_udp'
set firewall ipv4 name local-servers rule 20 action 'accept'
set firewall ipv4 name local-servers rule 20 description 'Rule: accept_bgp'
set firewall ipv4 name local-servers rule 20 destination port 'bgp'
set firewall ipv4 name local-servers rule 20 protocol 'tcp'
set firewall ipv4 name local-servers rule 30 action 'accept'
set firewall ipv4 name local-servers rule 30 description 'Rule: accept_k8s_api'
set firewall ipv4 name local-servers rule 30 destination port '6443'
set firewall ipv4 name local-servers rule 30 protocol 'tcp'
set firewall ipv4 name local-servers rule 40 action 'accept'
set firewall ipv4 name local-servers rule 40 description 'Rule: accept_vector_syslog'
set firewall ipv4 name local-servers rule 40 destination group address-group 'k8s_vector_aggregator'
set firewall ipv4 name local-servers rule 40 destination port '6001,6002'
set firewall ipv4 name local-servers rule 40 protocol 'tcp'
set firewall ipv4 name local-servers rule 999 action 'drop'
set firewall ipv4 name local-servers rule 999 description 'Rule: drop_invalid'
set firewall ipv4 name local-servers rule 999 state invalid
set firewall ipv4 name local-servers rule 999 log

# From LOCAL to CONTAINERS
set firewall ipv4 name local-containers default-action 'accept'
set firewall ipv4 name local-containers description 'From LOCAL to CONTAINERS'
set firewall ipv4 name local-containers rule 40 action 'accept'
set firewall ipv4 name local-containers rule 40 description 'Rule: accept_dns'
set firewall ipv4 name local-containers rule 40 destination port 'domain,domain-s'
set firewall ipv4 name local-containers rule 40 protocol 'tcp_udp'
set firewall ipv4 name local-containers rule 999 action 'drop'
set firewall ipv4 name local-containers rule 999 description 'Rule: drop_invalid'
set firewall ipv4 name local-containers rule 999 state invalid
set firewall ipv4 name local-containers rule 999 log

# From LOCAL to mgmt
set firewall ipv4 name local-mgmt default-action 'drop'
set firewall ipv4 name local-mgmt description 'From LOCAL to mgmt'
set firewall ipv4 name local-mgmt default-log
set firewall ipv4 name local-mgmt rule 999 action 'drop'
set firewall ipv4 name local-mgmt rule 999 description 'Rule: drop_invalid'
set firewall ipv4 name local-mgmt rule 999 state invalid
set firewall ipv4 name local-mgmt rule 999 log

# From LOCAL to cctv
set firewall ipv4 name local-cctv default-action 'drop'
set firewall ipv4 name local-cctv description 'From LOCAL to cctv'
set firewall ipv4 name local-cctv default-log
set firewall ipv4 name local-cctv rule 10 action 'accept'
set firewall ipv4 name local-cctv rule 10 description 'Rule: accept_igmp'
set firewall ipv4 name local-cctv rule 10 protocol '2'
set firewall ipv4 name local-cctv rule 20 action 'accept'
set firewall ipv4 name local-cctv rule 20 description 'Rule: accept_mdns'
set firewall ipv4 name local-cctv rule 20 destination port 'mdns'
set firewall ipv4 name local-cctv rule 20 protocol 'udp'
set firewall ipv4 name local-cctv rule 20 source port 'mdns'
set firewall ipv4 name local-cctv rule 999 action 'drop'
set firewall ipv4 name local-cctv rule 999 description 'Rule: drop_invalid'
set firewall ipv4 name local-cctv rule 999 state invalid
set firewall ipv4 name local-cctv rule 999 log

# From LOCAL to WAN
set firewall ipv4 name local-wan default-action 'accept'
set firewall ipv4 name local-wan description 'From LOCAL to WAN'