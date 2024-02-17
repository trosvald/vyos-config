#!/bin/vbash

set system domain-name "${SECRET_DOMAIN}"
set system host-name 'vg'
set system option time-format '24-hour'

set system ipv6 disable-forwarding

set system login user vyos authentication public-keys macbook key "${SECRET_SSH_KEY_MACBOOK}"
set system login user vyos authentication public-keys macbook type 'ssh-ed25519'
set system login user vyos authentication public-keys monosense-okd key "${SECRET_SSH_KEY_MONOSENSE}"
set system login user vyos authentication public-keys monosense-okd type 'ssh-ed25519'
set system login user vyos authentication public-keys wsl key "${SECRET_SSH_KEY_WSL}"
set system login user vyos authentication public-keys wsl type 'ssh-ed25519'

set system name-server '203.142.82.222'
set system name-server '203.142.84.222'

set system time-zone 'Asia/Jakarta'

set system sysctl parameter kernel.pty.max value '24000'
set system sysctl parameter net.core.rmem_max value '2500000'
set system sysctl parameter net.core.wmem_max value '2500000'

set system syslog global facility all level 'info'
set system syslog global facility local7 level 'debug'
set system syslog host 10.10.10.3 facility kern level 'warning'
set system syslog host 10.10.10.3 format octet-counted
set system syslog host 10.10.10.3 port '6003'
set system syslog host 10.10.10.3 protocol 'tcp'

set system task-scheduler task backup-config crontab-spec '0 0 * * *'
set system task-scheduler task backup-config executable path '/config/scripts/custom-config-backup.sh'
