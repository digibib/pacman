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
        gateway: "10.172.15.100"
        iface: eth0
  clients:
    boot:
      params: "snd-hda-intel.enable=0"
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
        mac: "20:cf:30:9b:d1:84"
        name: lambklient1
      -
        ip: "192.168.0.24"
        mac: "20:cf:30:9b:d1:89"
        name: lambklient10
      -
        ip: "192.168.0.16"
        mac: "20:cf:30:9b:d1:59"
        name: lambklient12
      -
        ip: "192.168.0.25"
        mac: "20:cf:30:9a:09:04"
        name: lambklient13
      -
        ip: "192.168.0.26"
        mac: "20:cf:30:9b:d1:66"
        name: lambklient14
      -
        ip: "192.168.0.11"
        mac: "20:cf:30:9b:d1:7e"
        name: lambklient3
      -
        ip: "192.168.0.23"
        mac: "20:cf:30:9b:d1:82"
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
    searchstations:
      -
        ip: "192.168.0.15"
        mac: "00:01:2e:40:97:39"
        name: lambklient15
