klientserverbjerke:
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
        gateway: "10.172.17.100"
        iface: eth0
  clients:
    boot:
      params: "snd-hda-intel.enable=0 --"
    mycelclients:
      -
        ip: "192.168.0.101"
        mac: "00:01:2e:3a:e4:99"
        name: bjerkeklient1
      -
        ip: "192.168.0.102"
        mac: "00:01:2e:3a:e4:bc"
        name: bjerkeklient2
      -
        ip: "192.168.0.103"
        mac: "00:01:2e:3a:e4:ee"
        name: bjerkeklient3
      -
        ip: "192.168.0.104"
        mac: "00:01:2e:3a:e5:4f"
        name: bjerkeklient4
      -
        ip: "192.168.0.105"
        mac: "00:01:2e:3a:55:aa"
        name: bjerkeklient5
    searchclients:
      -
        ip: "192.168.0.106"
        mac: "00:12:79:5f:1e:ca"
        name: naar2ersinte-bjerke
