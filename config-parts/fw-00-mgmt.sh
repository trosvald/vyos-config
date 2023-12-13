#!/bin/vbash
# shellcheck shell=bash
# shellcheck source=/dev/null

#### mgmt ----------------------------------------------------------------------------
# (10) From mgmt to infra
set firewall ipv4 name mgmt-infra default-action 'accept'
set firewall ipv4 name mgmt-infra description 'From mgmt to infra'
### --- 999-infra : Drop Invalid Packets
set firewall ipv4 name mgmt-infra rule 999 action 'drop'
set firewall ipv4 name mgmt-infra rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name mgmt-infra rule 999 log
set firewall ipv4 name mgmt-infra rule 999 state invalid 

# (20) From mgmt to home
set firewall ipv4 name mgmt-home default-action 'accept'
set firewall ipv4 name mgmt-home description 'From mgmt to home'
### --- 999-home : Drop Invalid Packets
set firewall ipv4 name mgmt-home rule 999 action 'drop'
set firewall ipv4 name mgmt-home rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name mgmt-home rule 999 log
set firewall ipv4 name mgmt-home rule 999 state invalid 

# (30) From mgmt to iot
set firewall ipv4 name mgmt-iot default-action 'accept'
set firewall ipv4 name mgmt-iot description 'From mgmt to iot'
### --- 999-iot : Drop Invalid Packets
set firewall ipv4 name mgmt-iot rule 999 action 'drop'
set firewall ipv4 name mgmt-iot rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name mgmt-iot rule 999 log
set firewall ipv4 name mgmt-iot rule 999 state invalid 

# (40) From mgmt to cctv
set firewall ipv4 name mgmt-cctv default-action 'accept'
set firewall ipv4 name mgmt-cctv description 'From mgmt to cctv'
### --- 999-cctv : Drop Invalid Packets
set firewall ipv4 name mgmt-cctv rule 999 action 'drop'
set firewall ipv4 name mgmt-cctv rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name mgmt-cctv rule 999 log
set firewall ipv4 name mgmt-cctv rule 999 state invalid

# (97) From mgmt to containers
set firewall ipv4 name mgmt-containers default-action 'accept'
set firewall ipv4 name mgmt-containers description 'From mgmt to containers'
### --- 999-containers : Drop Invalid Packets
set firewall ipv4 name mgmt-containers rule 999 action 'drop'
set firewall ipv4 name mgmt-containers rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name mgmt-containers rule 999 log
set firewall ipv4 name mgmt-containers rule 999 state invalid

# (98) From mgmt to local
set firewall ipv4 name mgmt-local default-action 'accept'
set firewall ipv4 name mgmt-local description 'From mgmt to local'
### --- 999-local : Drop Invalid Packets
set firewall ipv4 name mgmt-local rule 999 action 'drop'
set firewall ipv4 name mgmt-local rule 999 description 'Rule: Drop_Invalid'
set firewall ipv4 name mgmt-local rule 999 log
set firewall ipv4 name mgmt-local rule 999 state invalid

# (99) From mgmt to wan
set firewall ipv4 name mgmt-wan default-action 'accept'
set firewall ipv4 name mgmt-wan description 'From mgmt to wan'