#!/bin/bash

# update
yum update -y


#1
# 1.1
#  1.1.1
#   1.1.1.1 - 1.1.1.8 Disable filesysem mounts
mv CIS.conf /etc/modprobe.d/
chmod 644 /etc/modprobe.d/CIS.conf
rmmod cramfs
rmmod freevxfs
rmmod jffs2
rmmod hfs
rmmod hfsplus
rmmod squashfs
rmmod udf
rmmod vfat

#  1.1.2 - 1.1.17 Separate partitions
# /tmp
# /var/tmp
# /var/log
# /var/log/audit
# /home

#  1.1.18 Sticky bit

#  1.1.19 Disable automount

# 1.2 Software updates

# 1.3 Filesystem integrity

#  1.3.1 Install Aide
yum install -y aide
aide --init
mv /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz

#  1.3.2 Run Aide regular
line="0 5 * * * /usr/sbin/aide --check"
(crontab -u root -l; echo "$line" ) | crontab -u root -

# 1.4 Secure boot

#  1.4.1 Bootloader config
chown root:root /boot/grub/menu.lst
chmod og-rwx /boot/grub/menu.lst

#  1.4.2
# etc_sysconfig_init
# chmod 644 /etc/sysconfig/init

#  1.4.3
# etc_sysconfig_init
# chmod 644 /etc/sysconfig/init


# 1.5 Process hardening
#  1.5.1
# etc_security_limits.conf
# chmod 644 /etc/security/limits.conf
# etc_sysctl.conf
# chmod 644 /etc/sysctl.conf
sysctl -w fs.suid_dumpable=0

#  1.5.2 NX already ACTIVE

#  1.5.3
# etc_sysctl.conf
# chmod 644 /etc/sysctl.conf
sysctl -w kernel.randomize_va_space=2

#  1.5.4 Prelink disabled

# 1.6 Access Control - SKIP - L2


# 1.7 Warning banners - SKIP

# 1.8 Update (see top)

#2 inetd services
# chkconfig --list
#chargen-dgram
#chargen-stream

#daytime-dgram
#daytime-stream

#discard-dgram
#discard-stream

#echo-dgram
#echo-stream

#time-dgram
#time-stream

#rexec
#rlogin
#rsh

#talk

#telent

#tftp

#rsync

#xinetd

#  2.2.1 Time sync
#ntp installed

#   2.2.1.2 ?

#  2.2.2 X Windows
yum remove -y xorg-x11*

#  2.2.3 Avahi
#not installed

#  2.2.4 CUPS
#not installed

#  2.2.5 DHCP
#not installed

#  2.2.6 LDAP
#not installed

#  2.2.7 nfs & rpc
#off
chkconfig rpcbind off

#  2.2.8 named
#not installed

#  2.2.9 ftp
#not installed

#  2.2.10 http
#not installed

#  2.2.11 imap & pop
#not installed

#  2.2.12 SMB
#not installed

#  2.2.13 http proxy
#not installed

#  2.2.14
#not installed

#  2.2.15
#OK

#  2.2.16
#OK

# 2.3

#  2.3.1 - 2.3.5
#OK

#3 net
#  3.2.2 - 3.2.8 etc_sysctl.conf
#  3.3.1 - 3.3.2 etc_sysctl.conf

# 3.4
#  3.4.1 OK
#  3.4.2 - 3.4.3 /etc/hosts.allow/deny????

#  3.4.4 OK

#  3.4.5 OK

#  3.5.1 - 3.5.4 - CIS.conf

# 3.6
#  3.6.1 - OK
# iptables.sh

#  3.6.2 - 3.6.4 - iptables.sh

#  3.6.5 !?!?!?

#4 Audit

#   4.1.1.1 - 4.1.1.3 : etc_audot_auditd.conf

#  4.1.2 OK

#  4.1.3 - menu.list

#  4.1.4 - etc_audit_audit.rules

#  4.1.5 - etc_audit_audit.rules

#  4.1.6 - etc_audit_audit.rules

#  4.1.7 - etc_audit_audit.rules

#  4.1.8 - etc_audit_audit.rules

#  4.1.9 - etc_audit_audit.rules

#  4.1.10 - etc_audit_audit.rules

#  4.1.11 - etc_audit_audit.rules

#  4.1.12 ????

#  4.1.13 - etc_audit_audit.rules

#  4.1.14 - etc_audit_audit.rules

#  4.1.15 - etc_audit_audit.rules

#  4.1.16 - etc_audit_audit.rules

#  4.1.17 - etc_audit_audit.rules

#  4.1.18 - etc_audit_audit.rules

# 4.2
# 4.2.1.1 OK

#  4.2.1.2 ?????

#  4.2.1.3 - etc/rsyslog.conf

#  4.2.1.4 ????

#  4.2.1.5 ????

#  4.2.2 - not installed

#  4.2.3 OK

#  4.2.4 OK?

#  4.3 ???

#5
#  5.1.1 OK

#  5.1.2
chown root:root /etc/crontab
chmod og-rwx /etc/crontab

#  5.1.3
chown root:root /etc/cron.hourly
chmod og-rwx /etc/cron.hourly

#  5.1.4
chown root:root /etc/cron.daily
chmod og-rwx /etc/cron.daily

#  5.1.5
chown root:root /etc/cron.weekly
chmod og-rwx /etc/cron.weekly

#  5.1.6
chown root:root /etc/cron.monthly
chmod og-rwx /etc/cron.monthly

#  5.1.7
chown root:root /etc/cron.d
chmod og-rwx /etc/cron.d

#  5.1.8
rm /etc/cron.deny
rm /etc/at.deny
touch /etc/cron.allow
touch /etc/at.allow
chmod og-rwx /etc/cron.allow
chmod og-rwx /etc/at.allow
chown root:root /etc/cron.allow
chown root:root /etc/at.allow

# 5.2

# 5.2.1
chown root:root /etc/ssh/sshd_config
chmod og-rwx /etc/ssh/sshd_config

#  5.2.2 - 5.2.15
# sshd_config

# 5.3 SKIPPED

# 5.4 SKIPPED

#  5.4.2 OK

#  5.4.3 OK

#  6.1.1 SKIPPED

#  6.1.2 - 6.1.9
chown root:root /etc/passwd
chmod 644 /etc/passwd

chown root:root /etc/shadow
chmod 000 /etc/shadow

chown root:root /etc/group
chmod 644 /etc/group

chown root:root /etc/gshadow
chmod 000 /etc/gshadow

chown root:root /etc/passwd-
chmod u-x,go-wx /etc/passwd-

chown root:root /etc/shadow-
chmod 000 /etc/shadow-

chown root:root /etc/group-
chmod u-x,go-wx /etc/group-

chown root:root /etc/gshadow-
chmod 000 /etc/gshadow-

#  6.1.10???

#  6.1.11???

#  6.1.12???

#  6.1.13???

#  6.1.14???

#  6.2.1 OK

#  6.2.2 OK

#  6.2.3 OK

#  6.2.4 OK

#  6.2.5 OK

#  6.2.6????

#  6.2.7????

#  6.2.8 SKIPPED

#  6.2.9 SKIPPED

#  6.2.10 SKIPPED

#  6.2.11 SKIPPED

#  6.2.12 SKIPPED

#  6.2.13 SKIPPED

#  6.2.14 SKIPPED

#  6.2.15 OK

#  6.2.16 OK

#  6.2.17 OK

#  6.2.18 SKIPPED

#  6.2.19 OK
