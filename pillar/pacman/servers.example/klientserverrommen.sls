klientserverrommen:
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
        gateway: "10.172.35.100"
        iface: eth1
  clients:
    boot:
      params: "--"
    mycelclients:
      -
        ip: "192.168.0.101"
        mac: "b8:ae:ed:70:42:81"
        name: rommenklient1
      -
        ip: "192.168.0.102"
        mac: "b8:ae:ed:70:3c:7e"
        name: rommenklient2
      -
        ip: "192.168.0.103"
        mac: "b8:ae:ed:70:3c:ee"
        name: rommenklient3
      -
        ip: "192.168.0.104"
        mac: "b8:ae:ed:70:41:da"
        name: rommenklient4
