#!/bin/vbash

# Firewall Rules for HOME Zone
# From home to IOT
set firewall ipv4 name home-iot default-action 'drop'
set firewall ipv4 name home-iot description 'From HOME to IOT'
set firewall ipv4 name home-iot default-log
set firewall ipv4 name home-iot rule 999 action 'drop'
set firewall ipv4 name home-iot rule 999 description 'Rule: drop_invalid'
set firewall ipv4 name home-iot rule 999 state invalid
set firewall ipv4 name home-iot rule 999 log

# From home to LOCAL
set firewall ipv4 name home-local default-action 'drop'
set firewall ipv4 name home-local description 'From HOME to LOCAL'
set firewall ipv4 name home-local default-log
set firewall ipv4 name home-local rule 10 action 'accept'
set firewall ipv4 name home-local rule 10 description 'Rule: accept_dhcp'
set firewall ipv4 name home-local rule 10 destination port '67,68'
set firewall ipv4 name home-local rule 10 protocol 'udp'
set firewall ipv4 name home-local rule 10 source port '67,68'
set firewall ipv4 name home-local rule 20 action 'accept'
set firewall ipv4 name home-local rule 20 description 'Rule: accept_ntp'
set firewall ipv4 name home-local rule 20 destination port 'ntp'
set firewall ipv4 name home-local rule 20 protocol 'udp'
set firewall ipv4 name home-local rule 30 action 'accept'
set firewall ipv4 name home-local rule 30 description 'Rule: accept_mdns'
set firewall ipv4 name home-local rule 30 destination port 'mdns'
set firewall ipv4 name home-local rule 30 protocol 'udp'
set firewall ipv4 name home-local rule 30 source port 'mdns'
set firewall ipv4 name home-local rule 40 action 'accept'
set firewall ipv4 name home-local rule 40 description 'Rule: accept_igmp'
set firewall ipv4 name home-local rule 40 protocol '2'
set firewall ipv4 name home-local rule 999 action 'drop'
set firewall ipv4 name home-local rule 999 description 'Rule: drop_invalid'
set firewall ipv4 name home-local rule 999 state invalid
set firewall ipv4 name home-local rule 999 log

# From HOME to SERVERS
set firewall ipv4 name home-servers default-action 'drop'
set firewall ipv4 name home-servers description 'From HOME to SERVERS'
set firewall ipv4 name home-servers default-log
set firewall ipv4 name home-servers rule 10 action 'accept'
set firewall ipv4 name home-servers rule 10 description 'Rule: accept_HTTP/S'
set firewall ipv4 name home-servers rule 10 destination port 'http,https'
set firewall ipv4 name home-servers rule 10 protocol 'tcp'
set firewall ipv4 name home-servers rule 10 destination group address-group 'k8s_ingress'
set firewall ipv4 name home-servers rule 20 action 'accept'
set firewall ipv4 name home-servers rule 20 description 'Rule: accept_GitLab_SSH_Ingress'
set firewall ipv4 name home-servers rule 20 destination port 'ssh'
set firewall ipv4 name home-servers rule 20 protocol 'tcp'
set firewall ipv4 name home-servers rule 20 destination group address-group 'k8s_ingress'
set firewall ipv4 name home-servers rule 30 action 'accept'
set firewall ipv4 name home-servers rule 30 description 'Rule: accept_minio_on_scale'
set firewall ipv4 name home-servers rule 30 destination port '9000,9001'
set firewall ipv4 name home-servers rule 30 destination group address-group 'nas'
set firewall ipv4 name home-servers rule 30 protocol 'tcp'
set firewall ipv4 name home-servers rule 30 source group mac-group 'trusted_mac'
set firewall ipv4 name home-servers rule 40 action 'accept'
set firewall ipv4 name home-servers rule 40 description 'Rule: accept_k8s_talos_api'
set firewall ipv4 name home-servers rule 40 destination port '6443,50000'
set firewall ipv4 name home-servers rule 40 destination group address-group 'k8s_nodes'
set firewall ipv4 name home-servers rule 40 protocol 'tcp'
set firewall ipv4 name home-servers rule 40 source group mac-group 'trusted_mac'
set firewall ipv4 name home-servers rule 50 action 'accept'
set firewall ipv4 name home-servers rule 50 description 'Rule: accept_intel_amt'
set firewall ipv4 name home-servers rule 50 destination port '16992-16995'
set firewall ipv4 name home-servers rule 50 protocol tcp
set firewall ipv4 name home-servers rule 50 source group mac-group 'trusted_mac'
set firewall ipv4 name home-servers rule 60 action 'accept'
set firewall ipv4 name home-servers rule 60 description 'Rule: accept_syno_dsm'
set firewall ipv4 name home-servers rule 60 destination port '5000,5001'
set firewall ipv4 name home-servers rule 60 protocol 'tcp'
set firewall ipv4 name home-servers rule 60 source group mac-group 'trusted_mac'
set firewall ipv4 name home-servers rule 999 action 'drop'
set firewall ipv4 name home-servers rule 999 description 'Rule: drop_invalid'
set firewall ipv4 name home-servers rule 999 state invalid
set firewall ipv4 name home-servers rule 999 log

# From HOME to CONTAINERS
set firewall ipv4 name home-containers default-action 'drop'
set firewall ipv4 name home-containers description 'From HOME to CONTAINERS'
set firewall ipv4 name home-containers default-log
set firewall ipv4 name home-containers rule 10 action 'accept'
set firewall ipv4 name home-containers rule 10 description 'Rule: accept_dns'
set firewall ipv4 name home-containers rule 10 destination port 'domain,domain-s'
set firewall ipv4 name home-containers rule 10 protocol 'tcp_udp'
set firewall ipv4 name home-containers rule 20 action 'accept'
set firewall ipv4 name home-containers rule 20 description 'Rule: accept_omada_webui'
set firewall ipv4 name home-containers rule 20 destination port '8043'
set firewall ipv4 name home-containers rule 20 destination group address-group 'vyos_omada'
set firewall ipv4 name home-containers rule 20 protocol 'tcp'
set firewall ipv4 name home-containers rule 20 source group mac-group 'trusted_mac'
set firewall ipv4 name home-containers rule 30 action 'accept'
set firewall ipv4 name home-containers rule 30 description 'Rule: accept_1pass_connect'
set firewall ipv4 name home-containers rule 30 destination port '8080'
set firewall ipv4 name home-containers rule 30 protocol 'tcp'
set firewall ipv4 name home-containers rule 30 source group mac-group 'trusted_mac'
set firewall ipv4 name home-containers rule 40 action 'accept'
set firewall ipv4 name home-containers rule 40 description 'Rule: accept_HTTP/S'
set firewall ipv4 name home-containers rule 40 destination port 'http,https'
set firewall ipv4 name home-containers rule 40 protocol 'tcp'
set firewall ipv4 name home-containers rule 40 source group mac-group 'trusted_mac'
set firewall ipv4 name home-containers rule 50 action 'accept'
set firewall ipv4 name home-containers rule 50 description 'Rule: accept_haproxy'
set firewall ipv4 name home-containers rule 50 destination port '6443,9000,50000'
set firewall ipv4 name home-containers rule 50 destination group address-group 'vyos_k8s_api'
set firewall ipv4 name home-containers rule 50 protocol 'tcp'
set firewall ipv4 name home-containers rule 50 source group mac-group 'trusted_mac'
set firewall ipv4 name home-containers rule 999 action 'drop'
set firewall ipv4 name home-containers rule 999 description 'Rule: drop_invalid'
set firewall ipv4 name home-containers rule 999 state invalid
set firewall ipv4 name home-containers rule 999 log

# From HOME to MGMT
set firewall ipv4 name home-mgmt default-action 'drop'
set firewall ipv4 name home-mgmt description 'From HOME to MGMT'
set firewall ipv4 name home-mgmt default-log
set firewall ipv4 name home-mgmt rule 10 action 'accept'
set firewall ipv4 name home-mgmt rule 10 description 'Rule: accept_HTTP/S'
set firewall ipv4 name home-mgmt rule 10 destination port 'http,https'
set firewall ipv4 name home-mgmt rule 10 protocol 'tcp'
set firewall ipv4 name home-mgmt rule 10 source group mac-group 'trusted_mac'
set firewall ipv4 name home-mgmt rule 20 action 'accept'
set firewall ipv4 name home-mgmt rule 20 description 'Rule: accept_SSH'
set firewall ipv4 name home-mgmt rule 20 destination port 'ssh'
set firewall ipv4 name home-mgmt rule 20 protocol 'tcp'
set firewall ipv4 name home-mgmt rule 20 source group mac-group 'trusted_mac'
set firewall ipv4 name home-mgmt rule 30 action 'accept'
set firewall ipv4 name home-mgmt rule 30 description 'Rule: accept_intel_amt'
set firewall ipv4 name home-mgmt rule 30 destination port '16992-16995'
set firewall ipv4 name home-mgmt rule 30 protocol 'tcp'
set firewall ipv4 name home-mgmt rule 30 source group mac-group 'trusted_mac'
set firewall ipv4 name home-mgmt rule 40 action 'accept'
set firewall ipv4 name home-mgmt rule 40 description 'Rule: accept_syno_dsm'
set firewall ipv4 name home-mgmt rule 40 destination port '5000,5001'
set firewall ipv4 name home-mgmt rule 40 protocol tcp
set firewall ipv4 name home-mgmt rule 40 source group mac-group 'trusted_mac'
set firewall ipv4 name home-mgmt rule 999 action 'drop'
set firewall ipv4 name home-mgmt rule 999 description 'Rule: drop_invalid'
set firewall ipv4 name home-mgmt rule 999 state invalid
set firewall ipv4 name home-mgmt rule 999 log

# From home to CCTV
set firewall ipv4 name home-cctv default-action 'drop'
set firewall ipv4 name home-cctv description 'From HOME to CCTV'
set firewall ipv4 name home-cctv default-log
set firewall ipv4 name home-cctv rule 999 action 'drop'
set firewall ipv4 name home-cctv rule 999 description 'Rule: drop_invalid'
set firewall ipv4 name home-cctv rule 999 state invalid
set firewall ipv4 name home-cctv rule 999 log

# From home to WAN
set firewall ipv4 name home-wan default-action 'accept'
set firewall ipv4 name home-wan description 'From HOME to WAN'