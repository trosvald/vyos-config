#!/bin/vbash

# Zones
# MGMT => mgmt
# INFRA => servers
# HOME => home
# IOT => iot
# CCTV => cctv
# CONTAINERS => containers
# WAN => wan
# WIREGUARD => mgmt
# LOCAL => local

# local Zone
set firewall zone local default-action 'drop'
set firewall zone local description 'Local router zone'
set firewall zone local from iot firewall name 'iot-local'
set firewall zone local from home firewall name 'home-local'
set firewall zone local from servers firewall name 'servers-local'
set firewall zone local from containers firewall name 'containers-local'
set firewall zone local from mgmt firewall name 'mgmt-local'
set firewall zone local from cctv firewall name 'cctv-local'
set firewall zone local from wan firewall name 'wan-local'
set firewall zone local local-zone

# mgmt Zone
set firewall zone mgmt default-action 'drop'
set firewall zone mgmt from iot firewall name 'iot-mgmt'
set firewall zone mgmt from home firewall name 'home-mgmt'
set firewall zone mgmt from local firewall name 'local-mgmt'
set firewall zone mgmt from servers firewall name 'servers-mgmt'
set firewall zone mgmt from containers firewall name 'containers-mgmt'
set firewall zone mgmt from cctv firewall name 'cctv-mgmt'
set firewall zone mgmt from wan firewall name 'wan-mgmt'
set firewall zone mgmt interface 'bond0'


# home Zone
set firewall zone home default-action 'drop'
set firewall zone home from iot firewall name 'iot-home'
set firewall zone home from local firewall name 'local-home'
set firewall zone home from servers firewall name 'servers-home'
set firewall zone home from containers firewall name 'containers-home'
set firewall zone home from mgmt firewall name 'mgmt-home'
set firewall zone home from cctv firewall name 'cctv-home'
set firewall zone home from wan firewall name 'wan-home'
set firewall zone home interface 'bond0.1612'

# cctv Zone
set firewall zone cctv default-action 'drop'
set firewall zone cctv from iot firewall name 'iot-cctv'
set firewall zone cctv from home firewall name 'home-cctv'
set firewall zone cctv from local firewall name 'local-cctv'
set firewall zone cctv from servers firewall name 'servers-cctv'
set firewall zone cctv from containers firewall name 'containers-cctv'
set firewall zone cctv from mgmt firewall name 'mgmt-cctv'
set firewall zone cctv from wan firewall name 'wan-cctv'
set firewall zone cctv interface 'bond0.1614'

# servers Zone
set firewall zone servers default-action 'drop'
set firewall zone servers from iot firewall name 'iot-servers'
set firewall zone servers from home firewall name 'home-servers'
set firewall zone servers from local firewall name 'local-servers'
set firewall zone servers from containers firewall name 'containers-servers'
set firewall zone servers from mgmt firewall name 'mgmt-servers'
set firewall zone servers from cctv firewall name 'cctv-servers'
set firewall zone servers from wan firewall name 'wan-servers'
set firewall zone servers interface 'bond0.1611'

# iot Zone
set firewall zone iot default-action 'drop'
set firewall zone iot from home firewall name 'home-iot'
set firewall zone iot from local firewall name 'local-iot'
set firewall zone iot from servers firewall name 'servers-iot'
set firewall zone iot from containers firewall name 'containers-iot'
set firewall zone iot from mgmt firewall name 'mgmt-iot'
set firewall zone iot from cctv firewall name 'cctv-iot'
set firewall zone iot from wan firewall name 'wan-iot'
set firewall zone iot interface 'bond1.1613'

# containers Zone
set firewall zone containers default-action 'drop'
set firewall zone containers description 'VyOS containers zone'
set firewall zone containers from iot firewall name 'iot-containers'
set firewall zone containers from home firewall name 'home-containers'
set firewall zone containers from local firewall name 'local-containers'
set firewall zone containers from servers firewall name 'servers-containers'
set firewall zone containers from mgmt firewall name 'mgmt-containers'
set firewall zone containers from cctv firewall name 'cctv-containers'
set firewall zone containers from wan firewall name 'wan-containers'
set firewall zone containers interface 'pod-containers'

# wan Zone
set firewall zone wan default-action 'drop'
set firewall zone wan from iot firewall name 'iot-wan'
set firewall zone wan from home firewall name 'home-wan'
set firewall zone wan from local firewall name 'local-wan'
set firewall zone wan from servers firewall name 'servers-wan'
set firewall zone wan from containers firewall name 'containers-wan'
set firewall zone wan from mgmt firewall name 'mgmt-wan'
set firewall zone wan from cctv firewall name 'cctv-wan'
set firewall zone wan interface 'pppoe0'
