sudo hostnamectl set-hostname miniserver.external.es
sudo yum install vim chrony dnsmasq ntpdate -y
sudo ntpdate -s hora.roa.es
#sudo cp /tmp/sync/server_files/chrony.conf /etc/
sudo systemctl enable chronyd && sudo systemctl start chronyds

  sudo tac << EOF >>/etc/dnsmasq.conf
  server=8.8.8.8
  server=8.8.4.4
  listen-address= 10.211.55.104
  domain=external
  address=/masterlb.external/10.211.55.104
  address=/agent.external/10.211.55.104
  address=/bootstrap.external/10.211.55.104
  address=/miniserver.external.es/10.211.55.104
  ptr-record=101.55.211.10.in-addr.arpa.miniserver.external.es
  ptr-record=102.55.211.10.in-addr.arpa.miniserver.external.es
  ptr-record=103.55.211.10.in-addr.arpa.miniserver.external.es
  ptr-record=104.55.211.10.in-addr.arpa.miniserver.external.es
  EOF
