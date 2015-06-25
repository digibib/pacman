klientserverboler: 
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
        gateway: "10.172.9.100"
        iface: eth0
  clients:
    boot:
      params: "--"
    mycelclients:
      -
        ip: "192.168.0.101"
        mac: "b8:ae:ed:70:3b:45"
        name: bolerklient1
      -
        ip: "192.168.0.102"
        mac: "b8:ae:ed:70:84:0f"
        name: bolerklient2
      -
        ip: "192.168.0.103"
        mac: "b8:ae:ed:70:37:25"
        name: bolerklient3
      -
        ip: "192.168.0.104"
        mac: "b8:ae:ed:70:46:72"
        name: bolerklient4

