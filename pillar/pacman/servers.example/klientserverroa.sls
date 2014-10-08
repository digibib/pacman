klientserverroa:
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
        dns: "10.172.2.1"
        gateway: "10.172.10.100"
        iface: eth1
  clients:
    boot:
      params: "snd-hda-intel.enable=0 --"
    mycelclients:
      -
        ip: "192.168.0.101"
        mac: "00:01:2e:3a:fe:d6"
        name: roaklient1
      -
        ip: "192.168.0.102"
        mac: "00:01:2e:3a:ff:49"
        name: roaklient2
      -
        ip: "192.168.0.103"
        mac: "00:01:2e:3a:fe:bc"
        name: roaklient3
      -
        ip: "192.168.0.104"
        mac: "00:01:2e:3a:ff:0e"
        name: roaklient4
      -
        ip: "192.168.0.105"
        mac: "00:01:2e:3a:fe:fe"
        name: roaklient5
