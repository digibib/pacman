klientserverstovner:
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
        gateway: "10.172.11.100"
        iface: eth1
  clients:
    boot:
      params: "snd-hda-intel.enable=0 --"
    mycelclients:
      -
        ip: "192.168.0.101"
        mac: "00:01:2e:3a:ff:26"
        name: stovnerklient1
      -
        ip: "192.168.0.102"
        mac: "00:01:2e:3a:ff:99"
        name: stovnerklient2
      -
        ip: "192.168.0.103"
        mac: "00:01:2e:3a:ff:b8"
        name: stovnerklient3
      -
        ip: "192.168.0.104"
        mac: "00:01:2e:3a:fe:fb"
        name: stovnerklient4
      -
        ip: "192.168.0.105"
        mac: "00:01:2e:3a:e5:1e"
        name: stovnerklient5
      -
        ip: "192.168.0.106"
        mac: "00:01:2e:3a:ff:08"
        name: stovnerklient6
      -
        ip: "192.168.0.107"
        mac: "00:01:2e:40:97:34"
        name: stovnerklient7
