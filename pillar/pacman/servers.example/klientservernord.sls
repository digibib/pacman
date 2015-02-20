klientservernord:
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
        gateway: "10.172.16.100"
        iface: eth0
  clients:
    boot:
      params: "nomodeset snd-hda-intel.enable=0 --"
    mycelclients:
      -
        ip: "192.168.0.101"
        mac: "00:01:2e:3a:e5:17"
        name: nordklient1
      -
        ip: "192.168.0.102"
        mac: "00:01:2e:3a:e4:e4"
        name: nordklient2
      -
        ip: "192.168.0.103"
        mac: "00:01:2e:3a:e5:4d"
        name: nordklient3
      -
        ip: "192.168.0.104"
        mac: "00:01:2e:3a:e4:ce"
        name: nordklient4
      -
        ip: "192.168.0.105"
        mac: "00:01:2e:3a:e3:fe"
        name: nordklient5
