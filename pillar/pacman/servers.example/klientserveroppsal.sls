klientserveroppsal:
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
        gateway: "10.172.8.100"
        iface: eth1
  clients:
    boot:
      params: "snd-hda-intel.enable=0"
    mycelclients:
      -
        ip: "192.168.0.101"
        mac: "00:01:2e:3a:e3:13"
        name: oppsalklient1
      -
        ip: "192.168.0.102"
        mac: "00:01:2e:3a:e2:58"
        name: oppsalklient2
      -
        ip: "192.168.0.103"
        mac: "00:01:2e:3a:e4:b9"
        name: oppsalklient3
      -
        ip: "192.168.0.104"
        mac: "00:01:2e:3a:fe:e4"
        name: oppsalklient4
      -
        ip: "192.168.0.105"
        mac: "00:01:2e:3a:fe:cc"
        name: oppsalklient5
      -
        ip: "192.168.0.106"
        mac: "00:01:2e:3a:fe:e1"
        name: oppsalklient6