#!/bin/vbash
# shellcheck shell=bash
# shellcheck source=/dev/null

#### home ----------------------------------------------------------------------------
# (00) From home to management
set firewall ipv4 name home-mgmt default-action 'drop'
set firewall ipv4 name home-mgmt description 'From home to mgmt'
set firewall ipv4 name home-mgmt enable-default-log
### --- 010-mgmt : Accept HTTP-HTTPS Traffic from Trusted MAC (80/443)
set firewall ipv4 name home-mgmt rule 10 action 'accept'
set firewall ipv4 name home-mgmt rule 10 description 'Rule: Accept_HTTPS-HTTPS_From_Trusted_MAC'
set firewall ipv4 name home-mgmt rule 10 destination port 'http,https'
set firewall ipv4 name home-mgmt rule 10 protocol 'tcp'
set firewall ipv4 name home-mgmt rule 10 source group mac-group 'trusted_mac'
### --- 011-mgmt : Accept SSH Traffic from Trusted MAC (22)
set firewall ipv4 name home-mgmt rule 11 action 'accept'
set firewall ipv4 name home-mgmt rule 11 description 'Rule: Accept_SSH_From_Trusted_MAC'
set firewall ipv4 name home-mgmt rule 11 destination port '22'
set firewall ipv4 name home-mgmt rule 11 protocol 'tcp'
set firewall ipv4 name home-mgmt rule 11 source group mac-group 'trusted_mac'
### --- 999-mgmt : Drop Invalid Packets
set firewall ipv4 name home-mgmt rule 999 action 'drop'
set firewall ipv4 name home-mgmt rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name home-mgmt rule 999 log
set firewall ipv4 name home-mgmt rule 999 state invalid

# (10) From home to infra
set firewall ipv4 name home-infra default-action 'drop'
set firewall ipv4 name home-infra description 'From home to infra'
set firewall ipv4 name home-infra enable-default-log
### --- 010-infra : Accept HTTP-HTTPS Traffic (80/443)
set firewall ipv4 name home-infra rule 10 action 'accept'
set firewall ipv4 name home-infra rule 10 description 'Rule: Accept_HTTP_HTTPS'
set firewall ipv4 name home-infra rule 10 destination port 'http,https'
set firewall ipv4 name home-infra rule 10 protocol 'tcp'
### --- 011-infra : Accept K8S API Traffic from trusted MAC group (6443)
set firewall ipv4 name home-infra rule 11 action 'accept'
set firewall ipv4 name home-infra rule 11 description 'Rule: Accept_K8S_API_From_Trusted_MAC'
set firewall ipv4 name home-infra rule 11 destination port '6443'
set firewall ipv4 name home-infra rule 11 protocol 'tcp'
set firewall ipv4 name home-infra rule 11 source group mac-group 'trusted_mac'
### --- 012-infra : Accept Talos API Traffic from trusted MAC group (50000)
set firewall ipv4 name home-infra rule 12 action 'accept'
set firewall ipv4 name home-infra rule 12 description 'Rule: Accept_Talos_API_From_Trusted_MAC'
set firewall ipv4 name home-infra rule 12 destination port '50000'
set firewall ipv4 name home-infra rule 12 protocol 'tcp'
set firewall ipv4 name home-infra rule 12 source group mac-group 'trusted_mac'
### --- 999-infra : Drop Invalid Packets
set firewall ipv4 name home-infra rule 999 action 'drop'
set firewall ipv4 name home-infra rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name home-infra rule 999 log
set firewall ipv4 name home-infra rule 999 state invalid

# (30) From home to iot
set firewall ipv4 name home-iot default-action 'drop'
set firewall ipv4 name home-iot description 'From home to iot'
set firewall ipv4 name home-iot enable-default-log
### --- 010-iot : Accept HTTP-HTTPS Traffic (80/443)
set firewall ipv4 name home-iot rule 10 action 'accept'
set firewall ipv4 name home-iot rule 10 description 'Rule: Accept_HTTP_HTTPS'
set firewall ipv4 name home-iot rule 10 destination port 'http,https'
set firewall ipv4 name home-iot rule 10 protocol 'tcp'
### --- 999-iot : Drop Invalid Packets
set firewall ipv4 name home-iot rule 999 action 'drop'
set firewall ipv4 name home-iot rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name home-iot rule 999 log
set firewall ipv4 name home-iot rule 999 state invalid

# (40) From home to cctv
set firewall ipv4 name home-cctv default-action 'drop'
set firewall ipv4 name home-cctv description 'From home to cctv'
set firewall ipv4 name home-cctv enable-default-log
### --- 010-cctv : Accept HTTP-HTTPS Traffic (80/443)
set firewall ipv4 name home-cctv rule 10 action 'accept'
set firewall ipv4 name home-cctv rule 10 description 'Rule: Accept_HTTP_HTTPS'
set firewall ipv4 name home-cctv rule 10 destination port 'http,https'
set firewall ipv4 name home-cctv rule 10 protocol 'tcp'
### --- 011-cctv : Accept RTSP:554 Traffic (554 tcp/udp)
set firewall ipv4 name home-cctv rule 11 action 'accept'
set firewall ipv4 name home-cctv rule 11 description 'Rule: Accept_RTSP_554'
set firewall ipv4 name home-cctv rule 11 destination port '554'
set firewall ipv4 name home-cctv rule 11 protocol 'tcp_udp' 
### --- 999-cctv : Drop Invalid Packets
set firewall ipv4 name home-cctv rule 999 action 'drop'
set firewall ipv4 name home-cctv rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name home-cctv rule 999 log
set firewall ipv4 name home-cctv rule 999 state invalid

# (97) From home to containers
set firewall ipv4 name home-containers default-action 'drop'
set firewall ipv4 name home-containers description 'From home to containers'
set firewall ipv4 name home-containers enable-default-log
### --- 010-containers : Accept DNS Traffic (53/953)
set firewall ipv4 name home-containers rule 10 action 'accept'
set firewall ipv4 name home-containers rule 10 description 'Rule: Accept_DNS'
set firewall ipv4 name home-containers rule 10 destination port 'domain,domain-s'
set firewall ipv4 name home-containers rule 10 protocol 'tcp_udp'
set firewall ipv4 name home-containers rule 10 destination group address-group 'dns_svc'
### --- 011-containers : Accept 1passconnect connect from Trusted MAC (8080)
set firewall ipv4 name home-containers rule 11 action 'accept'
set firewall ipv4 name home-containers rule 11 description 'Rule: Accept_1PassConnect_From_Trusted_MAC'
set firewall ipv4 name home-containers rule 11 destination port '8080'
set firewall ipv4 name home-containers rule 11 destination group address-group 'vyos_1passconnect'
set firewall ipv4 name home-containers rule 11 protocol 'tcp'
set firewall ipv4 name home-containers rule 11 source group mac-group 'trusted_mac'
### --- 012-containers : Accept HTTP-HTTPS Traffic from Trusted MAC (80/443)
set firewall ipv4 name home-containers rule 12 action 'accept'
set firewall ipv4 name home-containers rule 12 description 'Rule: Accept_HTTPS-HTTPS_From_Trusted_MAC'
set firewall ipv4 name home-containers rule 12 destination port 'http,https'
set firewall ipv4 name home-containers rule 12 protocol 'tcp'
set firewall ipv4 name home-containers rule 12 source group mac-group 'trusted_mac'
### --- 013-containers : Accept HAPROXY Stat Traffic from Trusted MAC (9000)
set firewall ipv4 name home-containers rule 13 action 'accept'
set firewall ipv4 name home-containers rule 13 description 'Rule: Accept_LB_Stats_From_Trusted_MAC'
set firewall ipv4 name home-containers rule 13 destination port '9000'
set firewall ipv4 name home-containers rule 13 destination group address-group 'vyos_haproxy'
set firewall ipv4 name home-containers rule 13 protocol 'tcp'
set firewall ipv4 name home-containers rule 13 source group mac-group 'trusted_mac'
### --- 999-containers : Drop Invalid Packets
set firewall ipv4 name home-containers rule 999 action 'drop'
set firewall ipv4 name home-containers rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name home-containers rule 999 log
set firewall ipv4 name home-containers rule 999 state invalid

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
### --- 011-local : Accept NTP Traffic (123/udp)
set firewall ipv4 name home-local rule 11 action 'accept'
set firewall ipv4 name home-local rule 11 description 'Rule: Accept_NTP'
set firewall ipv4 name home-local rule 11 destination port 'ntp'
set firewall ipv4 name home-local rule 11 protocol 'udp'
### --- 012-local : Accept SSH Traffic from Trusted MAC (22)
set firewall ipv4 name home-local rule 12 action 'accept'
set firewall ipv4 name home-local rule 12 description 'Rule: Accept_SSH_From_Trusted_MAC'
set firewall ipv4 name home-local rule 12 destination port '22'
set firewall ipv4 name home-local rule 12 protocol 'tcp'
set firewall ipv4 name home-local rule 12 source group mac-group 'trusted_mac'
### --- 999-local : Drop Invalid Packets
set firewall ipv4 name home-local rule 999 action 'drop'
set firewall ipv4 name home-local rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name home-local rule 999 log
set firewall ipv4 name home-local rule 999 state invalid
# (99) From home to wan
set firewall ipv4 name home-wan default-action 'accept'
set firewall ipv4 name home-wan description 'From home to wan'