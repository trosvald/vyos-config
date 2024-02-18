#!/bin/vbash

# Firewall Rules for IOT Zone
# From IOT to HOME
set firewall ipv4 name iot-home default-action 'drop'
set firewall ipv4 name iot-home description 'From IOT to HOME'
set firewall ipv4 name iot-home default-log
set firewall ipv4 name iot-home rule 999 action 'drop'
set firewall ipv4 name iot-home rule 999 description 'Rule: drop_invalid'
set firewall ipv4 name iot-home rule 999 state invalid
set firewall ipv4 name iot-home rule 999 log

# From IOT to LOCAL
set firewall ipv4 name iot-local default-action 'drop'
set firewall ipv4 name iot-local description 'From IOT to LOCAL'
set firewall ipv4 name iot-local default-log
set firewall ipv4 name iot-local rule 10 action 'accept'
set firewall ipv4 name iot-local rule 10 description 'Rule: accept_dhcp'
set firewall ipv4 name iot-local rule 10 destination port '67,68'
set firewall ipv4 name iot-local rule 10 protocol 'udp'
set firewall ipv4 name iot-local rule 10 source port '67,68'
set firewall ipv4 name iot-local rule 20 action 'accept'
set firewall ipv4 name iot-local rule 20 description 'Rule: accept_ntp'
set firewall ipv4 name iot-local rule 20 destination port 'ntp'
set firewall ipv4 name iot-local rule 20 protocol 'udp'
set firewall ipv4 name iot-local rule 30 action 'accept'
set firewall ipv4 name iot-local rule 30 description 'Rule: accept_igmp'
set firewall ipv4 name iot-local rule 30 protocol '2'
set firewall ipv4 name iot-local rule 40 action 'accept'
set firewall ipv4 name iot-local rule 40 description 'Rule: accept_mdns'
set firewall ipv4 name iot-local rule 40 destination port 'mdns'
set firewall ipv4 name iot-local rule 40 protocol 'udp'
set firewall ipv4 name iot-local rule 40 source port 'mdns'
set firewall ipv4 name iot-local rule 999 action 'drop'
set firewall ipv4 name iot-local rule 999 description 'Rule: drop_invalid'
set firewall ipv4 name iot-local rule 999 state invalid
set firewall ipv4 name iot-local rule 999 log

# From IOT to SERVERS/INFRA
set firewall ipv4 name iot-servers default-action 'drop'
set firewall ipv4 name iot-servers description 'From IOT to SERVERS'
set firewall ipv4 name iot-servers default-log
set firewall ipv4 name iot-servers rule 10 action 'accept'
set firewall ipv4 name iot-servers rule 10 description 'Rule: accept_mqtt'
set firewall ipv4 name iot-servers rule 10 destination group address-group 'k8s_mqtt'
set firewall ipv4 name iot-servers rule 10 destination port '1883'
set firewall ipv4 name iot-servers rule 10 protocol 'tcp'
set firewall ipv4 name iot-servers rule 20 action 'accept'
set firewall ipv4 name iot-servers rule 20 description 'Rule: accept_pgsql_from_metal_hassio'
set firewall ipv4 name iot-servers rule 20 protocol tcp
set firewall ipv4 name iot-servers rule 20 destination port '5432'
set firewall ipv4 name iot-servers rule 20 destination group address-group 'k8s_pgsql'
set firewall ipv4 name iot-servers rule 20 source group address-group 'metal_hassio' 
set firewall ipv4 name iot-servers rule 999 action 'drop'
set firewall ipv4 name iot-servers rule 999 description 'Rule: drop_invalid'
set firewall ipv4 name iot-servers rule 999 state invalid
set firewall ipv4 name iot-servers rule 999 log

# From IOT to CONTAINERS
set firewall ipv4 name iot-containers default-action 'accept'
set firewall ipv4 name iot-containers description 'From IOT to CONTAINERS'
set firewall ipv4 name iot-containers rule 10 action 'accept'
set firewall ipv4 name iot-containers rule 10 description 'Rule: accept_dns'
set firewall ipv4 name iot-containers rule 10 destination port 'domain,domain-s'
set firewall ipv4 name iot-containers rule 10 protocol 'tcp_udp'
set firewall ipv4 name iot-containers rule 999 action 'drop'
set firewall ipv4 name iot-containers rule 999 description 'Rule: drop_invalid'
set firewall ipv4 name iot-containers rule 999 state invalid
set firewall ipv4 name iot-containers rule 999 log

# From IOT to MGMT
set firewall ipv4 name iot-mgmt default-action 'drop'
set firewall ipv4 name iot-mgmt description 'From IOT to MGMT'
set firewall ipv4 name iot-mgmt default-log
set firewall ipv4 name iot-mgmt rule 999 action 'drop'
set firewall ipv4 name iot-mgmt rule 999 description 'Rule: drop_invalid'
set firewall ipv4 name iot-mgmt rule 999 state invalid
set firewall ipv4 name iot-mgmt rule 999 log

# From IOT to CCTV
set firewall ipv4 name iot-cctv default-action 'drop'
set firewall ipv4 name iot-cctv description 'From IOT to CCTV'
set firewall ipv4 name iot-cctv default-log
set firewall ipv4 name iot-cctv rule 10 action 'accept'
set firewall ipv4 name iot-cctv rule 10 description 'Rule: accept_rtsp_from_metal_hassio'
set firewall ipv4 name iot-cctv rule 10 protocol 'tcp'
set firewall ipv4 name iot-cctv rule 10 destination port '554,8554'
set firewall ipv4 name iot-cctv rule 10 source group address-group 'metal_hassio'
set firewall ipv4 name iot-cctv rule 20 action 'accept'
set firewall ipv4 name iot-cctv rule 20 description 'Rule: accept_HTTP_HTTPS'
set firewall ipv4 name iot-cctv rule 20 protocol 'tcp'
set firewall ipv4 name iot-cctv rule 20 destination port 'http,https'
set firewall ipv4 name iot-cctv rule 20 source group address-group 'metal_hassio'
set firewall ipv4 name iot-cctv rule 30 action 'accept'
set firewall ipv4 name iot-cctv rule 30 description 'Rule: accept_frigate_from_metal_hassio'
set firewall ipv4 name iot-cctv rule 30 destination port '1935,1984,5000'
set firewall ipv4 name iot-cctv rule 30 protocol 'tcp'
set firewall ipv4 name iot-cctv rule 30 source group address-group 'metal_hassio'
set firewall ipv4 name iot-cctv rule 999 action 'drop'
set firewall ipv4 name iot-cctv rule 999 description 'Rule: drop_invalid'
set firewall ipv4 name iot-cctv rule 999 state invalid
set firewall ipv4 name iot-cctv rule 999 log

# From IOT to WAN
set firewall ipv4 name iot-wan default-action 'accept'
set firewall ipv4 name iot-wan description 'From IOT to WAN'