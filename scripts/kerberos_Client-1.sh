sudo yum install krb5-workstation -y
sudo bash -c 'cat<<EOF > /etc/krb5.conf
[logging]
  default = FILE:/var/log/krb5libs.log
  kdc = FILE:/var/log/krb5kdc.log
  admin_server = FILE:/var/log/kadmind.log

[libdefaults]
    default_realm = KAFKA.SECURE
    kdc_timesync = 1
    ticket_lifetime = 24h

[realms]
    KAFKA.SECURE = {
      admin_server = 10.211.55.104
      kdc  = 10.211.55.104
      }
EOF'
