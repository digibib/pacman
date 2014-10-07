vagrant-ubuntu-trusty-64:
  server:
    network: 
      lan: 
        gateway: "192.168.50.10"
        broadcast: "192.168.50.255"
        pool_lower: "192.168.50.60"
        pool_upper: "192.168.50.70"
        subnet: "192.168.50.0"
        netmask: "255.255.255.0"
        iface: eth1
      wlan: 
        gateway: "10.172.2.1"
        iface: eth0
  clients:
    boot:
      params: "--"
    mycelclients:
      -
        name: vagrantbox1
        mac: b8:ca:3a:5b:c1:60
        ip: 192.168.50.101
