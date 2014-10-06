klientservergmlo:
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
        gateway: "10.172.13.100"
        iface: eth1
  clients:
    boot:
      params: "snd-hda-intel.enable=0"
    mycelclients:
      -
        ip: "192.168.0.101"
        mac: "00:01:2e:3a:e2:96"
        name: gmloklient1
      -
        ip: "192.168.0.102"
        mac: "00:01:2e:3a:e3:e2"
        name: gmloklient2
      -
        ip: "192.168.0.103"
        mac: "00:01:2e:3a:e4:8d"
        name: gmloklient3
      -
        ip: "192.168.0.104"
        mac: "00:01:2e:3a:e4:80"
        name: gmloklient4
      -
        ip: "192.168.0.105"
        mac: "00:01:2e:3a:e4:e0"
        name: gmloklient5
      -
        ip: "192.168.0.106"
        mac: "00:01:2e:3a:e4:b7"
        name: gmloklient6
      -
        ip: "192.168.0.107"
        mac: "00:01:2e:3a:e5:43"
        name: gmloklient7
      -
        ip: "192.168.0.108"
        mac: "00:01:2e:3a:e4:7f"
        name: gmloklient8
