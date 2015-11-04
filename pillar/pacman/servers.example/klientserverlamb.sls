klientserverlamb:
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
        gateway: "10.172.15.100"
        iface: eth0
  clients:
    boot:
      params: "--"
    mycelclients:
      -
        ip: "192.168.0.20"
        mac: "20:cf:30:9b:d1:65"
        name: lambklient7
      -
        ip: "192.168.0.21"
        mac: "20:cf:30:9b:d1:74"
        name: lambklient2
      -
        ip: "192.168.0.22"
        mac: "20:cf:30:9b:d1:53"
        name: lambklient4
      -
        ip: "192.168.0.28"
        mac: "20:cf:30:9a:09:2d"
        name: lambklient11
      -
        ip: "192.168.0.10"
        mac: "b8:ae:ed:76:ec:28"
        name: lambklient1
      -
        ip: "192.168.0.16"
        mac: "c0:3f:d5:6c:20:d1"
        name: lambklient12
      -
        ip: "192.168.0.25"
        mac: "b8:ae:ed:76:88:3b"
        name: lambklient10
      -
        ip: "192.168.0.26"
        mac: "b8:ae:ed:76:d3:d7"
        name: lambklient3
      -
        ip: "192.168.0.23"
        mac: "b8:ae:ed:76:88:bf"
        name: lambklient5
      -
        ip: "192.168.0.12"
        mac: "20:cf:30:9a:09:a8"
        name: lambklient6
      -
        ip: "192.168.0.13"
        mac: "20:cf:30:9a:09:c1"
        name: lambklient8
      -
        ip: "192.168.0.27"
        mac: "20:cf:30:9a:09:0b"
        name: lambklient9
    searchclients:
      -
        ip: "192.168.0.15"
        mac: "00:01:2e:40:97:39"
        name: lambklient15
