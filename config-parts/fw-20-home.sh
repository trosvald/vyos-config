#!/bin/vbash
# shellcheck shell=bash
# shellcheck source=/dev/null

#### home ----------------------------------------------------------------------------
# (00) From home to management
set firewall ipv4 name home-mgmt default-action 'drop'
set firewall ipv4 name home-mgmt description 'From infra to mgmt'
set firewall ipv4 name home-mgmt enable-default-log
### --- 010-mgmt : Accept HTTP-HTTPS Traffic from Trusted MAC (80/443)
set firewall ipv4 name home-mgmt rule 10 action 'accept'
set firewall ipv4 name home-mgmt rule 10 description 'Rule: Accept_HTTPS-HTTPS_From_Trusted_MAC'
set firewall ipv4 name home-mgmt rule 10 destination port '80,443'
set firewall ipv4 name home-mgmt rule 10 protocol 'tcp'
set firewall ipv4 name home-mgmt rule 10 source group mac-group 'trusted_mac'
### --- 020-mgmt : Accept SSH Traffic from Trusted MAC (22)
set firewall ipv4 name home-mgmt rule 20 action 'accept'
set firewall ipv4 name home-mgmt rule 20 description 'Rule: Accept_SSH_From_Trusted_MAC'
set firewall ipv4 name home-mgmt rule 20 destination port '22'
set firewall ipv4 name home-mgmt rule 20 protocol 'tcp'
set firewall ipv4 name home-mgmt rule 20 source group mac-group 'trusted_mac'
### --- 999-mgmt : Drop Invalid Packets
set firewall ipv4 name home-mgmt rule 999 action 'drop'
set firewall ipv4 name home-mgmt rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name home-mgmt rule 999 log 'enable'
set firewall ipv4 name home-mgmt rule 999 state invalid 'enable'

# (10) From home to infra
set firewall ipv4 name home-infra default-action 'drop'
set firewall ipv4 name home-infra description 'From home to infra'
set firewall ipv4 name home-infra enable-default-log
### --- 010-infra : Accept HTTP-HTTPS Traffic (80/443)
set firewall ipv4 name home-infra rule 10 action 'accept'
set firewall ipv4 name home-infra rule 10 description 'Rule: Accept_HTTP_HTTPS'
set firewall ipv4 name home-infra rule 10 destination port '80,443'
set firewall ipv4 name home-infra rule 10 protocol 'tcp'
### --- 020-infra : Accept K8S API Traffic from trusted MAC group (6443)
set firewall ipv4 name home-infra rule 20 action 'accept'
set firewall ipv4 name home-infra rule 20 description 'Rule: Accept_K8S_API_From_Trusted_MAC'
set firewall ipv4 name home-infra rule 20 destination port '6443'
set firewall ipv4 name home-infra rule 20 protocol 'tcp'
set firewall ipv4 name home-infra rule 20 source group mac-group 'trusted_mac'
### --- 030-infra : Accept Talos API Traffic from trusted MAC group (50000)
set firewall ipv4 name home-infra rule 30 action 'accept'
set firewall ipv4 name home-infra rule 30 description 'Rule: Accept_Talos_API_From_Trusted_MAC'
set firewall ipv4 name home-infra rule 30 destination port '5000'
set firewall ipv4 name home-infra rule 30 protocol 'tcp'
set firewall ipv4 name home-infra rule 30 source group mac-group 'trusted_mac'
### --- 999-infra : Drop Invalid Packets
set firewall ipv4 name home-infra rule 999 action 'drop'
set firewall ipv4 name home-infra rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name home-infra rule 999 log 'enable'
set firewall ipv4 name home-infra rule 999 state invalid 'enable'

# (30) From home to iot
set firewall ipv4 name home-iot default-action 'drop'
set firewall ipv4 name home-iot description 'From home to iot'
set firewall ipv4 name home-iot enable-default-log
### --- 010-iot : Accept HTTP-HTTPS Traffic (80/443)
set firewall ipv4 name home-iot rule 10 action 'accept'
set firewall ipv4 name home-iot rule 10 description 'Rule: Accept_HTTP_HTTPS'
set firewall ipv4 name home-iot rule 10 destination port '80,443'
set firewall ipv4 name home-iot rule 10 protocol 'tcp'
### --- 999-iot : Drop Invalid Packets
set firewall ipv4 name home-iot rule 999 action 'drop'
set firewall ipv4 name home-iot rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name home-iot rule 999 log 'enable'
set firewall ipv4 name home-iot rule 999 state invalid 'enable'

# (40) From home to cctv
set firewall ipv4 name home-cctv default-action 'drop'
set firewall ipv4 name home-cctv description 'From home to cctv'
set firewall ipv4 name home-cctv enable-default-log
### --- 010-cctv : Accept HTTP-HTTPS Traffic (80/443)
set firewall ipv4 name home-cctv rule 10 action 'accept'
set firewall ipv4 name home-cctv rule 10 description 'Rule: Accept_HTTP_HTTPS'
set firewall ipv4 name home-cctv rule 10 destination port '80,443'
set firewall ipv4 name home-cctv rule 10 protocol 'tcp'
### --- 999-cctv : Drop Invalid Packets
set firewall ipv4 name home-cctv rule 999 action 'drop'
set firewall ipv4 name home-cctv rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name home-cctv rule 999 log 'enable'
set firewall ipv4 name home-cctv rule 999 state invalid 'enable'

# (97) From home to containers
set firewall ipv4 name home-containers default-action 'drop'
set firewall ipv4 name home-containers description 'From home to containers'
set firewall ipv4 name home-containers enable-default-log
### --- 010-containers : Accept DNS Traffic (53/953)
set firewall ipv4 name home-containers rule 10 action 'accept'
set firewall ipv4 name home-containers rule 10 description 'Rule: Accept_DNS'
set firewall ipv4 name home-containers rule 10 destination port 'domain,domain-s'
set firewall ipv4 name home-containers rule 10 protocol 'tcp_udp'
### --- 020-containers : Accept 1passconnect connect from Trusted MAC (8080)
set firewall ipv4 name home-containers rule 20 action 'accept'
set firewall ipv4 name home-containers rule 20 description 'Rule: Accept_1PassConnect_From_Trusted_MAC'
set firewall ipv4 name home-containers rule 20 destination port '8080'
set firewall ipv4 name home-containers rule 20 protocol 'tcp'
set firewall ipv4 name home-containers rule 20 source group mac-group 'trusted_mac'
### --- 030-containers : Accept HTTP-HTTPS Traffic from Trusted MAC (80/443)
set firewall ipv4 name home-containers rule 30 action 'accept'
set firewall ipv4 name home-containers rule 30 description 'Rule: Accept_HTTPS-HTTPS_From_Trusted_MAC'
set firewall ipv4 name home-containers rule 30 destination port '80,443'
set firewall ipv4 name home-containers rule 30 protocol 'tcp'
set firewall ipv4 name home-containers rule 30 source group mac-group 'trusted_mac'
### --- 040-containers : Accept HAPROXY Stat Traffic from Trusted MAC (9000)
set firewall ipv4 name home-containers rule 40 action 'accept'
set firewall ipv4 name home-containers rule 40 description 'Rule: Accept_LB_Stats_From_Trusted_MAC'
set firewall ipv4 name home-containers rule 40 destination port '9000'
set firewall ipv4 name home-containers rule 40 protocol 'tcp'
set firewall ipv4 name home-containers rule 40 source group mac-group 'trusted_mac'
### --- 999-containers : Drop Invalid Packets
set firewall ipv4 name home-containers rule 999 action 'drop'
set firewall ipv4 name home-containers rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name home-containers rule 999 log 'enable'
set firewall ipv4 name home-containers rule 999 state invalid 'enable'

# (98) From home to local
set firewall ipv4 name home-local default-action 'drop'
set firewall ipv4 name home-local description 'From home to local'
set firewall ipv4 name home-local enable-default-log
### --- 010-local : Accept DHCP Traffic (67/udp,68/udp)
set firewall ipv4 name home-local rule 10 action 'accept'
set firewall ipv4 name home-local rule 10 description 'Rule: Accept_DHCP'
set firewall ipv4 name home-local rule 10 destination port '67,68'
set firewall ipv4 name home-local rule 10 protocol 'udp'
set firewall ipv4 name home-local rule 10 source port '67,68'
### --- 020-local : Accept NTP Traffic (123/udp)
set firewall ipv4 name home-local rule 20 action 'accept'
set firewall ipv4 name home-local rule 20 description 'Rule: Accept_NTP'
set firewall ipv4 name home-local rule 20 destination port 'ntp'
set firewall ipv4 name home-local rule 20 protocol 'udp'
### --- 030-local : Accept SSH Traffic from Trusted MAC (22)
set firewall ipv4 name home-local rule 30 action 'accept'
set firewall ipv4 name home-local rule 30 description 'Rule: Accept_SSH_From_Trusted_MAC'
set firewall ipv4 name home-local rule 30 destination port '22'
set firewall ipv4 name home-local rule 30 protocol 'tcp'
set firewall ipv4 name home-local rule 30 source group mac-group 'trusted_mac'
### --- 999-local : Drop Invalid Packets
set firewall ipv4 name home-local rule 999 action 'drop'
set firewall ipv4 name home-local rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name home-local rule 999 log 'enable'
set firewall ipv4 name home-local rule 999 state invalid 'enable'

# (99) From home to wan
set firewall ipv4 name home-wan default-action 'accept'
set firewall ipv4 name home-wan description 'From home to wan'