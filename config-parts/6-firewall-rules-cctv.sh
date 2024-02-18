#!/bin/vbash

# Firewall Rules for cctv Zone
# From cctv to IOT
set firewall ipv4 name cctv-iot default-action 'drop'
set firewall ipv4 name cctv-iot description 'From cctv to IOT'
set firewall ipv4 name cctv-iot default-log
set firewall ipv4 name cctv-iot rule 10 action 'accept'
set firewall ipv4 name cctv-iot rule 10 description 'Rule: allow connecting to hass'
set firewall ipv4 name cctv-iot rule 10 protocol 'tcp'
set firewall ipv4 name cctv-iot rule 10 destination group address-group 'metal_hassio'
set firewall ipv4 name cctv-iot rule 10 destination port '8123'
set firewall ipv4 name cctv-iot rule 999 action 'drop'
set firewall ipv4 name cctv-iot rule 999 description 'Rule: drop_invalid'
set firewall ipv4 name cctv-iot rule 999 state invalid
set firewall ipv4 name cctv-iot rule 999 log

# From cctv to home
set firewall ipv4 name cctv-home default-action 'drop'
set firewall ipv4 name cctv-home description 'From cctv to home'
set firewall ipv4 name cctv-home default-log
set firewall ipv4 name cctv-home rule 999 action 'drop'
set firewall ipv4 name cctv-home rule 999 description 'Rule: drop_invalid'
set firewall ipv4 name cctv-home rule 999 state invalid
set firewall ipv4 name cctv-home rule 999 log

# From cctv to LOCAL
set firewall ipv4 name cctv-local default-action 'drop'
set firewall ipv4 name cctv-local description 'From cctv to LOCAL'
set firewall ipv4 name cctv-local default-log
set firewall ipv4 name cctv-local rule 10 action 'accept'
set firewall ipv4 name cctv-local rule 10 description 'Rule: accept_dhcp'
set firewall ipv4 name cctv-local rule 10 destination port '67,68'
set firewall ipv4 name cctv-local rule 10 protocol 'udp'
set firewall ipv4 name cctv-local rule 10 source port '67,68'
set firewall ipv4 name cctv-local rule 20 action 'accept'
set firewall ipv4 name cctv-local rule 20 description 'Rule: accept_ntp'
set firewall ipv4 name cctv-local rule 20 destination port 'ntp'
set firewall ipv4 name cctv-local rule 20 protocol 'udp'
set firewall ipv4 name cctv-local rule 999 action 'drop'
set firewall ipv4 name cctv-local rule 999 description 'Rule: drop_invalid'
set firewall ipv4 name cctv-local rule 999 state invalid
set firewall ipv4 name cctv-local rule 999 log

# From cctv to SERVERS
set firewall ipv4 name cctv-servers default-action 'drop'
set firewall ipv4 name cctv-servers description 'From cctv to SERVERS'
set firewall ipv4 name cctv-servers default-log
set firewall ipv4 name cctv-servers rule 10 action 'accept'
set firewall ipv4 name cctv-servers rule 10 description 'Rule: accept_k8s_nodes'
set firewall ipv4 name cctv-servers rule 10 protocol 'udp'
set firewall ipv4 name cctv-servers rule 10 destination group address-group 'k8s_nodes'
set firewall ipv4 name cctv-servers rule 10 source port '6987-6989'
set firewall ipv4 name cctv-servers rule 999 action 'drop'
set firewall ipv4 name cctv-servers rule 999 description 'Rule: drop_invalid'
set firewall ipv4 name cctv-servers rule 999 state invalid
set firewall ipv4 name cctv-servers rule 999 log

# From cctv to CONTAINERS
set firewall ipv4 name cctv-containers default-action 'accept'
set firewall ipv4 name cctv-containers description 'From cctv to CONTAINERS'
set firewall ipv4 name cctv-containers rule 10 action 'accept'
set firewall ipv4 name cctv-containers rule 10 description 'Rule: accept_dns'
set firewall ipv4 name cctv-containers rule 10 destination port 'domain,domain-s'
set firewall ipv4 name cctv-containers rule 10 protocol 'tcp_udp'
set firewall ipv4 name cctv-containers rule 999 action 'drop'
set firewall ipv4 name cctv-containers rule 999 description 'Rule: drop_invalid'
set firewall ipv4 name cctv-containers rule 999 state invalid
set firewall ipv4 name cctv-containers rule 999 log

# From cctv to mgmt
set firewall ipv4 name cctv-mgmt default-action 'drop'
set firewall ipv4 name cctv-mgmt description 'From cctv to mgmt'
set firewall ipv4 name cctv-mgmt default-log
set firewall ipv4 name cctv-mgmt rule 999 action 'drop'
set firewall ipv4 name cctv-mgmt rule 999 description 'Rule: drop_invalid'
set firewall ipv4 name cctv-mgmt rule 999 state invalid
set firewall ipv4 name cctv-mgmt rule 999 log

# From cctv to WAN
set firewall ipv4 name cctv-wan default-action 'drop'
set firewall ipv4 name cctv-wan description 'From cctv to WAN'
