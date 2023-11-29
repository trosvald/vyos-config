#!/bin/vbash
# shellcheck shell=bash
# shellcheck source=/dev/null


set interfaces ethernet eth0 hw-id '98:fa:9b:19:be:d9'
set interfaces ethernet eth1 hw-id 'ec:0d:9a:02:85:30'
set interfaces ethernet eth2 hw-id 'ec:0d:9a:02:85:31'

set interfaces bonding bond0 address '172.16.10.254/24'
set interfaces bonding bond0 description 'MGMT'
set interfaces bonding bond0 hash-policy 'layer2'
set interfaces bonding bond0 member interface 'eth1'
set interfaces bonding bond0 member interface 'eth2'
set interfaces bonding bond0 mode '802.3ad'
set interfaces bonding bond0 vif 1611 address '172.16.11.254/24'
set interfaces bonding bond0 vif 1612 address '172.16.12.254/24'
set interfaces bonding bond0 vif 1613 address '172.16.13.254/24'
set interfaces bonding bond0 vif 1614 address '172.16.14.254/24'

set interfaces pppoe pppoe0 authentication password "${SECRET_ISP_AUTH_PASSWORD}"
set interfaces pppoe pppoe0 authentication username "${SECRET_ISP_AUTH_USER}"
set interfaces pppoe pppoe0 description 'WAN - PPPoE'
set interfaces pppoe pppoe0 ip adjust-mss 'clamp-mss-to-pmtu'
set interfaces pppoe pppoe0 mtu '1492'
set interfaces pppoe pppoe0 source-interface 'eth0'