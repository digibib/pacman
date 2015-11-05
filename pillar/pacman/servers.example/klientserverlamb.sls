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
        mac: "b8:ae:ed:76:f1:a2"
        name: lambklient7
      -
        ip: "192.168.0.21"
        mac: "b8:ae:ed:76:f0:72"
        name: lambklient2
      -
        ip: "192.168.0.22"
        mac: "b8:ae:ed:76:f8:87"
        name: lambklient4
      -
        ip: "192.168.0.28"
        mac: "b8:ae:ed:76:f0:59"
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
        mac: "b8:ae:ed:76:8e:77"
        name: lambklient6
      -
        ip: "192.168.0.13"
        mac: "c0:3f:d5:6c:0d:8b"
        name: lambklient8
      -
        ip: "192.168.0.27"
        mac: "b8:ae:ed:76:d0:dc"
        name: lambklient9
    searchclients:
      -
        ip: "192.168.0.15"
        mac: "00:01:2e:40:97:39"
        name: lambklient15
