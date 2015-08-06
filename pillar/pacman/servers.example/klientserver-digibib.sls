klientserver-digibib.deich.folkebibl.no:
  server:
    network:
      lan:
        gateway: "192.168.0.1"
        broadcast: "192.168.0.255"
        pool_lower: "192.168.0.60"
        pool_upper: "192.168.0.70"
        subnet: "192.168.0.0"
        netmask: "255.255.255.0"
        iface: eth1
      wlan:
        dns: "10.172.2.1"
        gateway: "10.172.3.163"
        iface: eth0
  clients:
    boot:
      params: "--"
    mycelclients:
      -
        ip: "192.168.0.102"
        mac: "00:01:2e:40:7a:14"
        name: digibibtest
      -
        ip: "192.168.0.101"
        mac: "08:00:27:96:5e:8c"
        name: vagrantbox
      -
        ip: "192.168.0.103"
        mac: "00:01:2e:3a:fe:cd"
        name: zotacdvitestboks
