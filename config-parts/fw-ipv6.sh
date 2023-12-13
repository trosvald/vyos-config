#!/bin/vbash
# shellcheck shell=bash
# shellcheck source=/dev/null

set firewall ipv6 forward filter default-action 'accept'
set firewall ipv6 forward filter rule 1 action 'accept'
set firewall ipv6 forward filter rule 1 state established
set firewall ipv6 forward filter rule 2 action 'accept'
set firewall ipv6 forward filter rule 2 state related

set firewall ipv6 forward filter rule 101 action 'accept'
set firewall ipv6 forward filter rule 101 inbound-interface group 'IG_containers'
set firewall ipv6 forward filter rule 101 outbound-interface group 'IG_containers'

set firewall ipv6 forward filter rule 106 action 'drop'
set firewall ipv6 forward filter rule 106 description 'zone_containers default-action'
set firewall ipv6 forward filter rule 106 outbound-interface group 'IG_containers'

set firewall ipv6 forward filter rule 111 action 'accept'
set firewall ipv6 forward filter rule 111 inbound-interface group 'IG_mgmt'
set firewall ipv6 forward filter rule 111 outbound-interface group 'IG_mgmt'

set firewall ipv6 forward filter rule 116 action 'drop'
set firewall ipv6 forward filter rule 116 description 'zone_mgmt default-action'
set firewall ipv6 forward filter rule 116 outbound-interface group 'IG_mgmt'

set firewall ipv6 forward filter rule 121 action 'accept'
set firewall ipv6 forward filter rule 121 inbound-interface group 'IG_infra'
set firewall ipv6 forward filter rule 121 outbound-interface group 'IG_infra'

set firewall ipv6 forward filter rule 126 action 'drop'
set firewall ipv6 forward filter rule 126 description 'zone_infra default-action'
set firewall ipv6 forward filter rule 126 outbound-interface group 'IG_infra'

set firewall ipv6 forward filter rule 131 action 'accept'
set firewall ipv6 forward filter rule 131 inbound-interface group 'IG_home'
set firewall ipv6 forward filter rule 131 outbound-interface group 'IG_home'

set firewall ipv6 forward filter rule 136 action 'drop'
set firewall ipv6 forward filter rule 136 description 'zone_home default-action'
set firewall ipv6 forward filter rule 136 outbound-interface group 'IG_home'

set firewall ipv6 forward filter rule 141 action 'accept'
set firewall ipv6 forward filter rule 141 inbound-interface group 'IG_iot'
set firewall ipv6 forward filter rule 141 outbound-interface group 'IG_iot'

set firewall ipv6 forward filter rule 146 action 'drop'
set firewall ipv6 forward filter rule 146 description 'zone_iot default-action'
set firewall ipv6 forward filter rule 146 outbound-interface group 'IG_iot'

set firewall ipv6 forward filter rule 171 action 'accept'
set firewall ipv6 forward filter rule 171 inbound-interface group 'IG_cctv'
set firewall ipv6 forward filter rule 171 outbound-interface group 'IG_cctv'

set firewall ipv6 forward filter rule 176 action 'drop'
set firewall ipv6 forward filter rule 176 description 'zone_cctv default-action'
set firewall ipv6 forward filter rule 176 outbound-interface group 'IG_cctv'

set firewall ipv6 forward filter rule 191 action 'accept'
set firewall ipv6 forward filter rule 191 inbound-interface group 'IG_wan'
set firewall ipv6 forward filter rule 191 outbound-interface group 'IG_wan'

set firewall ipv6 forward filter rule 196 action 'drop'
set firewall ipv6 forward filter rule 196 description 'zone_wan default-action'
set firewall ipv6 forward filter rule 196 outbound-interface group 'IG_wan'

set firewall ipv6 input filter default-action 'accept'
set firewall ipv6 input filter rule 1 action 'accept'
set firewall ipv6 input filter rule 1 state established
set firewall ipv6 input filter rule 2 action 'accept'
set firewall ipv6 input filter rule 2 state related
set firewall ipv6 input filter rule 101 action 'drop'

set firewall ipv6 output filter default-action 'accept'
set firewall ipv6 output filter rule 1 action 'accept'
set firewall ipv6 output filter rule 1 state established
set firewall ipv6 output filter rule 2 action 'accept'
set firewall ipv6 output filter rule 2 state related
set firewall ipv6 output filter rule 101 action 'drop'

# Ensure VyOS can talk to itself
set firewall ipv6 output filter rule 10 action accept
set firewall ipv6 output filter rule 10 source group address-group router-addresses-ipv6
set firewall ipv6 output filter rule 10 destination group address-group router-addresses-ipv6
set firewall ipv6 input  filter rule 10 action accept
set firewall ipv6 input  filter rule 10 source group address-group router-addresses-ipv6
set firewall ipv6 input  filter rule 10 destination group address-group router-addresses-ipv6