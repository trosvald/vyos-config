#!/bin/vbash
# shellcheck shell=bash
# shellcheck source=/dev/null

# NTP Client rules
delete service ntp allow-client
set service ntp allow-client address '127.0.0.0/8'
set service ntp allow-client address '10.0.0.0/8'
set service ntp allow-client address '172.16.0.0/12'
set service ntp allow-client address '192.168.0.0/16'
set service ntp listen-address '172.16.10.254'

# NTP Server
delete service ntp server
set service ntp server time.cloudflare.com
set service ntp server time.google.com prefer

# SSH Service
set service ssh disable-password-authentication
set service ssh listen-address '172.16.10.254'
set service ssh port '22'