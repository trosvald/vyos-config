#!/bin/vbash
# shellcheck shell=bash
# shellcheck source=/dev/null

# Blocklist groups
set firewall group network-group vyos_blocklist description 'Blacklisted IPv4 Sources'

# Interface groups
set firewall group interface-group IG_wan interface 'pppoe0'
set firewall group interface-group IG_mgmt interface 'bond0'
set firewall group interface-group IG_infra interface 'bond0.1611'
set firewall group interface-group IG_home interface 'bond0.1612'
set firewall group interface-group IG_iot interface 'bond0.1613'
set firewall group interface-group IG_cctv interface 'bond0.1614'
set firewall group interface-group IG_containers interface 'pod-containers'

# Router (VyOS itself)
set firewall group address-group router-addresses address '172.16.10.254'
set firewall group address-group router-addresses address '127.0.0.1'
set firewall group ipv6-address-group router-addresses-ipv6 address 'fe80::223:24ff:fec2:f307'
set firewall group ipv6-address-group router-addresses-ipv6 address '::1'

# k8s nodes
set firewall group address-group k8s_nodes address '172.16.11.10-172.16.11.16' # Servers vLAN
set firewall group address-group k8s_nodes address '172.16.13.13-172.16.13.16' # IoT vLAN

# k8s cluster services
set firewall group address-group k8s_ingress address '10.11.11.1'
set firewall group address-group k8s_ingress address '10.11.11.2'
set firewall group address-group k8s_vector_aggregator address '10.11.11.11'
set firewall group address-group k8s_mqtt address '10.11.11.12'

# service group
set firewall group address-group dns_svc address '172.16.16.2'
set firewall group address-group dns_svc address '172.16.16.3'
set firewall group address-group dns_svc address '172.16.16.5'
# Vyos containers addresses
set firewall group address-group vyos_adguard address '172.16.16.2'
set firewall group address-group vyos_bind address '172.16.16.3'
set firewall group address-group vyos_haproxy address '172.16.16.4'
set firewall group address-group vyos_dnsdist address '172.16.16.5'
set firewall group address-group vyos_omada address '172.16.16.6'
set firewall group address-group vyos_1passconnect address '172.16.16.7'
set firewall group address-group vyos_1passsync address '172.16.16.8'
# MAC Group
set firewall group mac-group trusted_mac mac-address 'd0:a6:37:ea:77:2b'

# Storage devices
set firewall group address-group nas address '172.16.11.1'
set firewall group address-group nas address '172.16.11.2'

# Port groups
set firewall group port-group wireguard port '51820'