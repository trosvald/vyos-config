#!/bin/vbash

# Container network
set container network containers description 'Network for containers'
set container network containers prefix '172.16.16.0/24'

# Adguard
set container name adguard cap-add 'net-bind-service'
set container name adguard image 'docker.io/adguard/adguardhome:v0.107.44'
set container name adguard memory '0'
set container name adguard environment TZ value 'Asia/Jakarta'
set container name adguard network containers address '172.16.16.2'
set container name adguard restart 'on-failure'
set container name adguard shared-memory '0'
set container name adguard volume config destination '/opt/adguardhome/conf'
set container name adguard volume config mode 'rw'
set container name adguard volume config source '/config/containers/adguard/config'
set container name adguard volume work destination '/opt/adguardhome/work'
set container name adguard volume work mode 'rw'
set container name adguard volume work source '/config/containers/adguard/work'

# Bind9
set container name bind cap-add 'net-bind-service'
set container name bind command '/usr/sbin/named -4 -f -c /etc/bind/named.conf -u bind'
set container name bind environment TZ value 'Asia/Jakarta'
set container name bind image 'docker.io/internetsystemsconsortium/bind9:9.19'
set container name bind memory '0'
set container name bind network containers address '172.16.16.3'
set container name bind restart 'on-failure'
set container name bind shared-memory '0'
set container name bind volume cache destination '/var/cache/bind'
set container name bind volume cache mode 'rw'
set container name bind volume cache source '/tmp/bind/cache'
set container name bind volume config destination '/etc/bind'
set container name bind volume config mode 'ro'
set container name bind volume config source '/config/containers/bind/config/etc'
set container name bind volume logs destination '/var/log'
set container name bind volume logs mode 'rw'
set container name bind volume logs source '/config/containers/bind/config/log'
set container name bind volume zones destination '/var/lib/bind'
set container name bind volume zones mode 'rw'
set container name bind volume zones source '/config/containers/bind/config/zones'

# HAPROXY
set container name haproxy-k8s-api environment TZ value 'Asia/Jakarta'
set container name haproxy-k8s-api image 'docker.io/library/haproxy:2.8.3'
set container name haproxy-k8s-api memory '0'
set container name haproxy-k8s-api network containers address '172.16.16.4'
set container name haproxy-k8s-api restart 'on-failure'
set container name haproxy-k8s-api shared-memory '0'
set container name haproxy-k8s-api volume config destination '/usr/local/etc/haproxy/haproxy.cfg'
set container name haproxy-k8s-api volume config mode 'ro'
set container name haproxy-k8s-api volume config source '/config/containers/haproxy/config/haproxy.cfg'

# dnsdist
set container name dnsdist arguments '--log-timestamps'
set container name dnsdist cap-add 'net-bind-service'
set container name dnsdist environment TZ value 'Asia/Jakarta'
set container name dnsdist image 'docker.io/powerdns/dnsdist-18:1.8.2'
set container name dnsdist memory '0'
set container name dnsdist network containers address '172.16.16.5'
set container name dnsdist restart 'on-failure'
set container name dnsdist shared-memory '0'
set container name dnsdist volume config destination '/etc/dnsdist/dnsdist.conf'
set container name dnsdist volume config mode 'ro'
set container name dnsdist volume config source '/config/containers/dnsdist/config/dnsdist.conf'

# Omada controller
set container name omada environment TZ value 'Asia/Jakarta'
set container name omada image 'docker.io/mbentley/omada-controller:5.13'
set container name omada memory '0'
set container name omada network containers address '172.16.16.6'
set container name omada restart 'on-failure'
set container name omada shared-memory '0'
set container name omada volume data destination '/opt/tplink/EAPController/data'
set container name omada volume data mode 'rw'
set container name omada volume data source '/config/containers/omada/data'
set container name omada volume logs destination '/opt/tplink/EAPController/logs'
set container name omada volume logs mode 'rw'
set container name omada volume logs source '/config/containers/omada/logs'

# Onepassword Connect
set container name onepassword-connect environment TZ value 'Asia/Jakarta'
set container name onepassword-connect image 'docker.io/1password/connect-api:1.7.2'
set container name onepassword-connect memory '0'
set container name onepassword-connect network containers address '172.16.16.7'
set container name onepassword-connect shared-memory '0'
set container name onepassword-connect volume credentials destination '/home/opuser/.op/1password-credentials.json'
set container name onepassword-connect volume credentials mode 'ro'
set container name onepassword-connect volume credentials source '/config/secrets/1password-credentials.json'
set container name onepassword-connect volume data destination '/home/opuser/.op/data'
set container name onepassword-connect volume data mode 'rw'
set container name onepassword-connect volume data source '/tmp/onepassword/data'

# Onepassword Sync
set container name onepassword-sync environment TZ value 'Asia/Jakarta'
set container name onepassword-sync image 'docker.io/1password/connect-sync:1.7.2'
set container name onepassword-sync memory '0'
set container name onepassword-sync network containers address '172.16.16.8'
set container name onepassword-sync shared-memory '0'
set container name onepassword-sync volume credentials destination '/home/opuser/.op/1password-credentials.json'
set container name onepassword-sync volume credentials mode 'ro'
set container name onepassword-sync volume credentials source '/config/secrets/1password-credentials.json'
set container name onepassword-sync volume data destination '/home/opuser/.op/data'
set container name onepassword-sync volume data mode 'rw'
set container name onepassword-sync volume data source '/tmp/onepassword/data'

# Blocky
set container name blocky environment TZ value 'Asia/Jakarta'
set container name blocky image 'ghcr.io/0xerr0r/blocky:v0.23'
set container name blocky memory '0'
set container name blocky network containers address '172.16.16.9'
set container name blocky restart 'on-failure'
set container name blocky shared-memory '0'
set container name blocky volume config destination '/app/config.yml'
set container name blocky volume config mode 'ro'
set container name blocky volume config source '/config/containers/blocky/config/config.yml'

# SMTP Relay
set container name smtp-relay environment SMTP_DOMAIN value "${SECRET_DOMAIN}"
set container name smtp-relay environment SMTP_PASSWORD value "${SECRET_SMTP_PASSWORD}"
set container name smtp-relay environment SMTP_PORT value "${SECRET_SMTP_PORT}"
set container name smtp-relay environment SMTP_SERVER value "${SECRET_SMTP_SERVER}"
set container name smtp-relay environment SMTP_USERNAME value "${SECRET_SMTP_USERNAME}"
set container name smtp-relay image 'ghcr.io/foxcpp/maddy:0.6.3'
set container name smtp-relay memory '0'
set container name smtp-relay network containers address '172.16.16.10'
set container name smtp-relay shared-memory '0'
set container name smtp-relay volume smtp-relay-config destination '/data/maddy.conf'
set container name smtp-relay volume smtp-relay-config mode 'ro'
set container name smtp-relay volume smtp-relay-config source '/config/containers/smtp-relay/config/maddy.conf'

# Cloudflare DDNS
set container name cloudflare-ddns allow-host-networks
set container name cloudflare-ddns environment CF_API_TOKEN value "${SECRET_CLOUDFLARE_DYNDNS_TOKEN}"
set container name cloudflare-ddns environment DOMAINS value "${SECRET_CF_CNAME}"
set container name cloudflare-ddns environment IP4_PROVIDER value 'local'
set container name cloudflare-ddns environment IP6_PROVIDER value 'none'
set container name cloudflare-ddns environment PGID value '1000'
set container name cloudflare-ddns environment PUID value '1000'
set container name cloudflare-ddns environment TZ value 'Asia/Jakarta'
set container name cloudflare-ddns environment UPDATE_CRON value '@every 2m'
set container name cloudflare-ddns image 'docker.io/favonia/cloudflare-ddns:1.10.1'
set container name cloudflare-ddns memory '0'
set container name cloudflare-ddns restart 'on-failure'
set container name cloudflare-ddns shared-memory '0'

# Node Exporter
set container name node-exporter allow-host-networks
set container name node-exporter environment procfs value '/host/proc'
set container name node-exporter environment rootfs value '/host/rootfs'
set container name node-exporter environment sysfs value '/host/sys'
set container name node-exporter image 'quay.io/prometheus/node-exporter:v1.6.1'
set container name node-exporter memory '0'
set container name node-exporter restart 'on-failure'
set container name node-exporter shared-memory '0'
set container name node-exporter volume procfs destination '/host/proc'
set container name node-exporter volume procfs mode 'ro'
set container name node-exporter volume procfs source '/proc'
set container name node-exporter volume rootfs destination '/host/rootfs'
set container name node-exporter volume rootfs mode 'ro'
set container name node-exporter volume rootfs source '/'
set container name node-exporter volume sysfs destination '/host/sys'
set container name node-exporter volume sysfs mode 'ro'
set container name node-exporter volume sysfs source '/sys'

# Speedtest Exporter
set container name speedtest-exporter allow-host-networks
set container name speedtest-exporter image 'ghcr.io/miguelndecarvalho/speedtest-exporter:v3.5.4'
set container name speedtest-exporter memory '0'
set container name speedtest-exporter restart 'on-failure'
set container name speedtest-exporter shared-memory '0'

