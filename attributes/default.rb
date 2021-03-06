# Use an MD5 hash for this. Ex: openssl passwd -1 ChangeMe
default['stig']['grub']['hashedpassword'] = "$1$ifTCDC.V$0VpmYkffVbzFkE8ElJrWU/" # Hashed "ChangeMe"

# 4.2.1.1 Configure Audit Log Storage Size (Not Scored)
# In megabyte
default['stig']['auditd']['max_log_file'] = "25" 
# CIS 4.2.1.2 Disable System on Audit Log Full (Not Scored)
default['stig']['auditd']['space_left_action'] = "email"
default['stig']['auditd']['action_mail_acct'] = "root"
default['stig']['auditd']['admin_space_left_action'] = "halt" # YIKES!
# CIS 4.2.1.3 Keep All Auditing Information (Scored)
default['stig']['auditd']['max_log_file_action'] = "keep_logs"
# CIS 4.2.3 Enable Auditing for Processes That Start Prior to auditd (Scored)
default['stig']['auditd']['kernel_audit_grub'] = "audit=1"

# 1.1.18 - 1.1.24 - Removing support for unneeded filesystem types reduces 
# the local attack surface of the server. If this filesystem type is not 
# needed, disable it by setting this variable to true. Enable by setting to false
default['stig']['mount_disable']['cramfs'] = true
default['stig']['mount_disable']['freevxfs'] = true
default['stig']['mount_disable']['jffs2'] = true
default['stig']['mount_disable']['hfs'] = true
default['stig']['mount_disable']['hfsplus'] = true
default['stig']['mount_disable']['squashfs'] = true
default['stig']['mount_disable']['udf'] = true

# 3.16 Configure Mail Transfer Agent for Local-Only Mode
# If the system is intended to be a mail server, change from "localhost"
default['stig']['mail_transfer_agent']['inet_interfaces'] = "localhost"

# 3.3 Disable Avahi Server
# true / false
default["stig"]["network"]["zeroconf"] = true

# 4.1.1 Disable IP Forwarding
# false = IP forwarding disabled
# true = IP forwarding enabled
default["stig"]["network"]["ip_forwarding"] = false

# 4.1.2 Disable Send Packet Redirects
# false = Disable redirects
# true = Enable redirects
default["stig"]["network"]["packet_redirects"] = false

# 4.2.2 Disable ICMP Redirect Acceptance
# false = Disable redirect acceptance
# true = Enable redirect acceptance
default["stig"]["network"]["icmp_redirect_accept"] = false

# 4.2.3 Disable Secure ICMP Redirect Acceptance
# false = Disable redirect acceptance
# true = Enable redirect acceptance
default["stig"]["network"]["icmp_all_secure_redirect_accept"] = false

# 4.2.4 Log Suspicious Packets
# true / false
default["stig"]["network"]["log_suspicious_packets"] = true

# 4.2.7 Enable RFC-recommended Source Route Validation
# true / false
default["stig"]["network"]["rfc_source_route_validation"] = true

# 4.4.2.2 Disable IPv6 Redirect Acceptance
# false = Disable redirect acceptance
# true = Enable redirect acceptance
default["stig"]["network"]["ipv6_redirect_accept"] = false

# 4.5.1 Create /etc/hosts.allow
# An array of <net>/<mask> combinations or "ALL"
default["stig"]["network"]["hosts_allow"] = ["ALL"]

# 4.5.3 Create /etc/hosts.deny
# An array of <net>/<mask> combinations or "ALL"
default["stig"]["network"]["hosts_deny"] = ["ALL"]

# 4.8.1 Disable DCCP
# true = disable
# false = enable
default["stig"]["network"]["disable_dcpp"] = true

# 4.8.2 Disable SCTP
# true = disable
# false = enable
default["stig"]["network"]["disable_sctp"] = true

# 4.8.3 Disable RDS
# true = disable
# false = enable
default["stig"]["network"]["disable_rds"] = true

# 4.8.4 Disable TIPC
# true = disable
# false = enable
default["stig"]["network"]["disable_tipc"] = true

# 4.4.1 Disable IPv6
# no = disabled
# yes = enabled
default["stig"]["network"]["ipv6"] = "no"

# 5.1.3 Configure /etc/rsyslog.conf
# Include rules for logging in array with space separating rule with log location
default["stig"]["logging"]["rsyslog_rules"] = [
  "*.info;mail.none;authpriv.none;cron.none   /var/log/messages",
  "authpriv.*   /var/log/secure",
  "mail.*   -/var/log/maillog",
  "cron.*   /var/log/cron",
  "*.emerg   *",
  "uucp,news.crit   /var/log/spooler",
  "local7.*    /var/log/boot.log"
]

# 5.3 Configure logrotate
default["stig"]["logging"]["logrotate_items"] = [
  "/var/log/cron",
  "/var/log/maillog",
  "/var/log/messages",
  "/var/log/secure",
  "/var/log/spooler",
  "/var/log/boot.log"
]

# 6.2.2 Set LogLevel to INFO
default["stig"]["sshd_config"]["log_level"] = "INFO"

# 6.2.5 Set SSH MaxAuthTries to 4 or Less
default["stig"]["sshd_config"]["max_auth_tries"] = 3

# 6.2.6 Set SSH IgnoreRhosts to Yes
default["stig"]["sshd_config"]["ignore_rhosts"] = true

# 6.2.7 Set SSH HostbasedAuthentication to No
default["stig"]["sshd_config"]["host_based_auth"] = false

# 6.2.8 Disable SSH Root Login
default["stig"]["sshd_config"]["permit_root_login"] = false

# 6.2.9 Set SSH PermitEmptyPasswords to No
default["stig"]["sshd_config"]["permit_empty_passwords"] = false

# 6.2.10 Do Not Allow Users to Set Environment Options
default["stig"]["sshd_config"]["allow_users_set_env_opts"] = false

default["stig"]["sshd_config"]["banner_path"] = "/etc/issue"

# 6.2.13 Limit Access via SSH
default["stig"]["sshd_config"]["deny_users"] = [
  "bin",
  "daemon",
  "adm",
  "lp",
  "mail",
  "uucp",
  "operator",
  "games",
  "gopher",
  "ftp",
  "nobody",
  "vcsa",
  "rpc",
  "saslauth",
  "postfix",
  "rpcuser",
  "nfsnobody",
  "sshd"
]

# 6.3.6 Limit Password Reuse
# Integer represents the amount of passwords the user is forced to not reuse
default["stig"]["system_auth"]["pass_reuse_limit"] = 10

# 7.2.1 Set Password Expiration Days
default["stig"]["login_defs"]["pass_max_days"] = 60

# 7.2.2 Set Password Change Minimum Number of Days
default["stig"]["login_defs"]["pass_min_days"] = 1

# 7.2.3 Set Password Expiring Warning Days
default["stig"]["login_defs"]["pass_warn_age"] = 15

