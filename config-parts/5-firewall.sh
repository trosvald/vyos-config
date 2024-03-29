#!/bin/vbash

# General configuration
set firewall global-options state-policy established action 'accept'
set firewall global-options state-policy related action 'accept'
set firewall global-options all-ping enable
set firewall global-options broadcast-ping disable

# Router (VyOS itself)
set firewall group address-group router-addresses address '172.16.10.254'
set firewall group address-group router-addresses address '127.0.0.1'
set firewall group ipv6-address-group router-addresses-ipv6 address 'fe80::e63a:6eff:fe5a:f805'
set firewall group ipv6-address-group router-addresses-ipv6 address '::1'

# k8s nodes
set firewall group address-group k8s_nodes address '172.16.11.10-172.16.11.16' # Servers vLAN
set firewall group address-group k8s_nodes_iot address '172.16.13.13-172.16.13.16' # IoT vLAN
set firewall group address-group k8s_nodes_cctv address '172.16.14.13-172.16.14.16' # CCTV VLAN

# MQTT client devices
set firewall group address-group mqtt_clients address '172.16.13.100' # Shelly 3EM 
set firewall group address-group mqtt_clients address '10.1.3.18' # Tasmota Devices 
set firewall group address-group mqtt_clients address '10.1.3.22' 
set firewall group address-group mqtt_clients address '10.1.3.38' 

# Metal services
set firewall group address-group metal_hassio address '172.16.13.1'
set firewall group address-group metal_infra address '172.16.10.13' # Temporary MQTT and Prod Mattermost PGSQL
set firewall group address-group metal_nvr address '172.16.14.2' # Frigate Multus on K8S Cluster



# k8s cluster services
set firewall group address-group k8s_ingress address '10.10.10.1'
set firewall group address-group k8s_ingress address '10.10.10.2'
set firewall group address-group k8s_vector_aggregator address '10.10.10.3'
set firewall group address-group k8s_pgsql address '10.10.10.4'
set firewall group address-group k8s_pgsql address '10.10.10.5'
set firewall group address-group k8s_pgsql address '10.10.10.6'
set firewall group address-group k8s_mqtt address '10.10.10.7'


# k8s ingress client devices
set firewall group address-group k8s_ingress_allowed address '172.16.13.116' # LG WebOS TV
set firewall group address-group k8s_ingress_allowed address '172.16.13.115' # Livingroom TCL TV

# Trusted MAC
set firewall group mac-group trusted_mac mac-address 'd0:a6:37:ea:77:2b'
set firewall group mac-group trusted_mac mac-address 'f0:d4:15:62:00:93'
set firewall group mac-group trusted_mac mac-address '04:ea:56:7f:81:04'
set firewall group mac-group trusted_mac mac-address 'c0:a5:e8:f4:6f:8c'

# Printers
set firewall group address-group printers address '10.1.3.55'

# Shelly
set firewall group port-group shelly_discovery port '5683' # UDP

# Printer client machines
set firewall group address-group printer_allowed address '192.168.2.11'

# Omada devices
set firewall group address-group omada_devices address '172.16.10.1-172.16.10.4' # Switches
set firewall group address-group omada_devices address '172.16.10.8' # AP's

# Vyos containers addresses
set firewall group address-group vyos_bind address '172.16.16.3'
set firewall group address-group vyos_dnsdist address '172.16.16.5'
set firewall group address-group vyos_omada address '172.16.16.6'
set firewall group address-group vyos_k8s_api address '172.16.16.4'

# Storage devices
set firewall group address-group nas address '172.16.10.20' # TrueNAS Management IP
set firewall group address-group nas address '172.16.11.1' # TrueNAS Infra IP
set firewall group address-group nas address '172.16.10.15' # Synology DS1817+ Management IP
set firewall group address-group nas address '172.16.11.2' # Synology DS1817+ Infra IP
# set firewall group address-group nas address '172.16.10.21' # Synology DS1513+ Management IP
# set firewall group address-group nas address '172.16.11.3' # Synology DS1513+ Infra IP

# Port groups
set firewall group port-group wireguard port '51820'
