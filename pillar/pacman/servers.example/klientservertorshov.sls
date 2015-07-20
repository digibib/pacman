klientservertorshov:
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
        gateway: "10.172.12.74"
        iface: eth0
  clients:
    boot:
      params: "--"
    mycelclients:
      -
        ip: "192.168.0.101"
        mac: "00:01:2e:3a:e4:90"
        name: torshovklient1
      -
        ip: "192.168.0.102"
        mac: "00:01:2e:3a:e4:43"
        name: torshovklient2
      -
        ip: "192.168.0.103"
        mac: "00:01:2e:3a:ff:3a"
        name: torshovklient3
      -
        ip: "192.168.0.104"
        mac: "00:01:2e:40:7a:14"
        name: torshovklient4
      -
        ip: "192.168.0.105"
        mac: "00:01:2e:3a:fe:fc"
        name: torshovklient5
      -
        ip: "192.168.0.106"
        mac: "00:01:2e:3a:fe:e9"
        name: torshovklient6
      -
        ip: "192.168.0.107"
        mac: "00:01:2e:3a:fe:d1"
        name: torshovklient7
      -
        ip: "192.168.0.110"
        mac: "00:11:85:d7:df:51"
        name: torshovpubskriver
