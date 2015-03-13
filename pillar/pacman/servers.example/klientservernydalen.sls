klientservernydalen:
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
        gateway: "10.172.24.100"
        iface: eth0
  clients:
    boot:
      params: "--"
    mycelclients:
      -
        ip: "192.168.0.101"
        mac: "c0:3f:d5:69:e1:ed"
        name: nydalenklient1
      -
        ip: "192.168.0.102"
        mac: "c0:3f:d5:68:ed:b9"
        name: nydalenklient2
      -
        ip: "192.168.0.103"
        mac: "c0:3f:d5:69:bf:02"
        name: nydalenklient3
      -
        ip: "192.168.0.104"
        mac: "c0:3f:d5:69:f0:ae"
        name: nydalenklient4
