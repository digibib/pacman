klientserverholmlia:
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
        gateway: "10.172.14.100"
        iface: eth1
  clients:
    boot:
      params: "snd-hda-intel.enable=0"
    mycelclients:
      -
        ip: "192.168.0.106"
        mac: "00:01:2e:3a:e5:07"
        name: holmliaklient6
      -
        ip: "192.168.0.107"
        mac: "00:01:2e:3a:e3:f9"
        name: holmliaklient7
      -
        ip: "192.168.0.101"
        mac: "00:11:85:f1:bb:19"
        name: holmliaklient1
      -
        ip: "192.168.0.102"
        mac: "00:12:79:ae:b5:87"
        name: holmliaklient2
      -
        ip: "192.168.0.103"
        mac: "00:12:79:ae:bc:d2"
        name: holmliaklient3
      -
        ip: "192.168.0.104"
        mac: "20:cf:30:9b:d1:18"
        name: holmliaklient4
      -
        ip: "192.168.0.105"
        mac: "20:cf:30:9b:d1:4e"
        name: holmliaklient5
      -
        ip: "192.168.0.108"
        mac: "00:01:2e:3a:e4:62"
        name: holmliaklient8