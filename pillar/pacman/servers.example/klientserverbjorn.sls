klientserverbjorn:
  server:
    network:
      lan:
        gateway: "192.168.0.1"
        broadcast: "192.168.0.255"
        pool_lower: "192.168.0.60"
        pool_upper: "192.168.0.70"
        subnet: "192.168.0.0"
        netmask: "255.255.255.0"
        iface: eth0
      wlan:
        gateway: "10.172.41.100"
        iface: eth1
  clients:
    mycelclients:
      -
        ip: "192.168.0.101"
        mac: "00:01:2e:40:90:ce"
        name: bjornklient1
      -
        ip: "192.168.0.102"
        mac: "00:01:2e:3a:ff:04"
        name: bjornklient2