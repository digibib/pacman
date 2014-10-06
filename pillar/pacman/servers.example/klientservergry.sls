klientservergry:
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
        gateway: "10.172.4.100"
        iface: eth0
  clients:
    boot:
      params: "snd-hda-intel.enable=0"
    mycelclients:
      -
        ip: "192.168.0.101"
        mac: "00:01:2e:2b:a9:cd"
        name: gryklient1
      -
        ip: "192.168.0.102"
        mac: "00:01:2e:2b:ae:8f"
        name: gryklient2
      -
        ip: "192.168.0.103"
        mac: "00:01:2e:2b:af:15"
        name: gryklient3
      -
        ip: "192.168.0.104"
        mac: "00:01:2e:2b:a9:a7"
        name: gryklient4
      -
        ip: "192.168.0.105"
        mac: "00:01:2e:2b:a9:cc"
        name: gryklient5
      -
        ip: "192.168.0.106"
        mac: "00:01:2e:2b:ae:61"
        name: gryklient6
      -
        ip: "192.168.0.107"
        mac: "00:01:2e:2b:a9:ce"
        name: gryklient7
      -
        ip: "192.168.0.108"
        mac: "00:01:2e:2b:a9:99"
        name: gryklient8
      -
        ip: "192.168.0.109"
        mac: "00:01:2e:2b:a9:64"
        name: gryklient9
      -
        ip: "192.168.0.110"
        mac: "00:01:2e:2b:ae:5c"
        name: gryklient10
      -
        ip: "192.168.0.111"
        mac: "00:01:2e:2b:a9:6f"
        name: gryklient11
      -
        ip: "192.168.0.112"
        mac: "00:01:2e:2b:ae:68"
        name: gryklient12
      -
        ip: "192.168.0.114"
        mac: "00:01:2e:bc:c8:83"
        name: gryklient14
      -
        ip: "192.168.0.115"
        mac: "00:01:2e:bc:c8:a6"
        name: gryklient15
      -
        ip: "192.168.0.116"
        mac: "00:01:2e:3a:e5:39"
        name: gryklient16
