klientserverfuru:
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
        gateway: "10.172.7.100"
        iface: eth0
  clients:
    boot:
      params: "snd-hda-intel.enable=0 --"
    mycelclients:
      -
        ip: "192.168.0.101"
        mac: "00:01:2e:bc:c4:2b"
        name: furuklient1
      -
        ip: "192.168.0.102"
        mac: "00:01:2e:40:77:ff"
        name: furuklient2
      -
        ip: "192.168.0.103"
        mac: "00:01:2e:bc:c4:1e"
        name: furuklient3
      -
        ip: "192.168.0.104"
        mac: "00:01:2e:bc:c4:13"
        name: furuklient4
      -
        ip: "192.168.0.105"
        mac: "00:01:2e:40:78:03"
        name: furuklient5
      -
        ip: "192.168.0.106"
        mac: "00:01:2e:2b:a9:5f"
        name: furuklient6
      -
        ip: "192.168.0.107"
        mac: "00:01:2e:bc:c3:e4"
        name: furuklient7
      -
        ip: "192.168.0.108"
        mac: "00:01:2e:bc:c4:1b"
        name: furuklient8
      -
        ip: "192.168.0.109"
        mac: "00:01:2e:bc:c4:75"
        name: furuklient9
      -
        ip: "192.168.0.110"
        mac: "00:01:2e:3a:e4:a9"
        name: furuklient10
