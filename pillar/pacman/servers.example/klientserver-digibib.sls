klientserver-digibib:
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
        gateway: "10.172.2.1"
        iface: eth0
  clients:
    mycelclients:
      -
        ip: "192.168.0.101"
        mac: "08:00:27:96:5e:8c"
        name: vagrantbox
    searchclients:
      -
        ip: "192.168.0.102"
        mac: "00:01:2e:40:7a:14"
        name: digibibtest