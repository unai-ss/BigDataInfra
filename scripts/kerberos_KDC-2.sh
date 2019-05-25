sudo yum install -y krb5-server
sudo bash -c 'cat<<EOF > /var/kerberos/krb5kdc/kdc.conf
 [kdcdefaults]
  kdc_ports = 88
  kdc_tcp_ports = 88
  default_realm=KAFKA.SECURE
[realms]
  KAFKA.SECURE = {
    acl_file = /var/kerberos/krb5kdc/kadm5.acl
    dict_file = /usr/share/dict/words
    admin_keytab = /var/kerberos/krb5kdc/kadm5.keytab
    supported_enctypes = aes256-cts:normal aes128-cts:normal des3-hmac-sha1:normal arcfour-hmac:normal camellia256-cts:normal camellia128-cts:normal des-hmac-sha1:normal des-cbc-md5:normal des-cbc-crc:normal
  }
EOF'
sudo bash -c 'cat<<EOF > /var/kerberos/krb5kdc/kadm5.acl
*/admin@KAFKA.SECURE *
EOF'

export REALM="KAFKA.SECURE"
export ADMINPW="this-is-unsecure"
sudo /usr/sbin/kdb5_util create -s -r KAFKA.SECURE -P this-is-unsecure
sudo kadmin.local -q "add_principal -pw this-is-unsecure admin/admin"
sudo systemctl restart krb5kdc
sudo systemctl restart kadmin
sudo systemctl status krb5kdc
sudo systemctl status kadmin
sudo systemctl enable krb5kdc
sudo systemctl enable kadmin
