#!/bin/vbash
# shellcheck shell=bash
# shellcheck source=/dev/null

set system domain-name "${SECRET_SYSTEM_DOMAIN}"
set system host-name "${SECRET_SYSTEM_HOSTNAME}"
set system ipv6 disable-forwarding
set system time-zone 'Asia/Jakarta'

set system login user vyos authentication public-keys macbook key "${SECRET_SSH_KEY_MAC}"
set system login user vyos authentication public-keys macbook type 'ssh-ed25519'
set system login user vyos authentication public-keys monosense-okd key "${SECRET_SSH_KEY_OKD}"
set system login user vyos authentication public-keys monosense-okd type 'ssh-ed25519'

set system name-server '172.16.16.2'
set system option time-format '24-hour'
set system sysctl parameter net.core.rmem_max value '2500000'
set system syslog global facility all level 'info'
set system syslog global facility local7 level 'debug'
set system syslog host 10.11.11.11 facility kern level 'warning'
set system syslog host 10.11.11.11 format octet-counted
set system syslog host 10.11.11.11 port '6003'
set system syslog host 10.11.11.11 protocol 'tcp'

set system task-scheduler task backup-config crontab-spec '0 0 * * *'
set system task-scheduler task backup-config executable path '/config/scripts/custom-config-backup.sh'
