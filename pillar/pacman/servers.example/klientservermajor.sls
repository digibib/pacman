klientservermajor:
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
        gateway: "10.172.6.100"
        iface: eth0
  clients:
    boot:
      params: "--"
    mycelclients:
      -
        ip: "192.168.0.101"
        mac: "00:01:2e:bc:70:34"
        name: majklient1
      -
        ip: "192.168.0.102"
        mac: "00:01:2e:bc:57:2d"
        name: majklient2
      -
        ip: "192.168.0.103"
        mac: "00:01:2e:bc:57:6c"
        name: majklient3
      -
        ip: "192.168.0.104"
        mac: "00:01:2e:bc:62:cc"
        name: majklient4
      -
        ip: "192.168.0.105"
        mac: "00:01:2e:bc:62:5e"
        name: majklient5
      -
        ip: "192.168.0.106"
        mac: "00:01:2e:bc:57:a2"
        name: majklient6
      -
        ip: "192.168.0.107"
        mac: "00:01:2e:bc:62:29"
        name: majklient7
      -
        ip: "192.168.0.108"
        mac: "00:01:2e:bc:62:3b"
        name: majklient8
      -
        ip: "192.168.0.109"
        mac: "00:01:2e:bc:58:0f"
        name: majklient9
      -
        ip: "192.168.0.110"
        mac: "00:01:2e:bc:62:80"
        name: majklient10
      -
        ip: "192.168.0.111"
        mac: "00:01:2e:bc:57:c9"
        name: majklient11
      -
        ip: "192.168.0.112"
        mac: "00:01:2e:bc:62:49"
        name: majklient12
      -
        ip: "192.168.0.114"
        mac: "00:01:2e:bc:62:2f"
        name: majklient14
      -
        ip: "192.168.0.115"
        mac: "00:01:2e:bc:57:6f"
        name: majklient15
      -
        ip: "192.168.0.116"
        mac: "b8:ae:ed:76:8a:f7"
        name: majklient16
      -
        ip: "192.168.0.117"
        mac: "b8:ae:ed:76:4e:71"
        name: majklient17
      -
        ip: "192.168.0.118"
        mac: "b8:ae:ed:76:8c:a5"
        name: majklient18  
    searchclients:
      -
        ip: "192.168.0.113"
        mac: "00:01:2e:bc:62:96"
        name: majklient13

