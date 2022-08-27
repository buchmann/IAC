Threefold VM Deployment for Danted Socks5 Server ( https://www.inet.no/dante/)
Key Node need Public IPV4 & IPV6 Adresss

After VM Deployment 
Dante Install 
apt install danted


Simple danted.conf  (/etc/danted)
access from any clients and access to any servers for ipv4 & ipv6
danted socks5 port 1080 
eth1 is the public Interface on the machine 



logoutput: /var/log/socks.log
internal.protocol: ipv4 ipv6
internal: eth1 port = 1080
external.protocol: ipv4 ipv6
external: eth1
clientmethod: none
socksmethod: none
user.privileged: root
user.notprivileged: nobody

#accept connections from any client
client pass {
        from: 0/0 to: 0/0
}

socks pass {
        from: 0/0 to: 0/0
        log: error connect disconnect
}

Usage of the proxy on Apple 
