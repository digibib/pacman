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
        dns: "10.172.2.1"
        gateway: "10.172.14.100"
        iface: eth1
  clients:
    boot:
      params: " --"
    mycelclients:
      -
        ip: "192.168.0.101"
        mac: "c0:3f:d5:68:ed:82"
        name: holmliaklient1
      -
        ip: "192.168.0.102"
        mac: "c0:3f:d5:69:a6:64"
        name: holmliaklient2
      -
        ip: "192.168.0.103"
        mac: "c0:3f:d5:69:12:37"
        name: holmliaklient3
      -
        ip: "192.168.0.104"
        mac: "c0:3f:d5:69:20:6d"
        name: holmliaklient4
      -
        ip: "192.168.0.105"
        mac: "c0:3f:d5:69:c1:b9"
        name: holmliaklient5
      -
        ip: "192.168.0.106"
        mac: "c0:3f:d5:68:ee:17"
        name: holmliaklient6
      -
        ip: "192.168.0.107"
        mac: "c0:3f:d5:68:ed:fa"
        name: holmliaklient7
      -
        ip: "192.168.0.108"
        mac: "c0:3f:d5:69:13:02"
        name: holmliaklient8
