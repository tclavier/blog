Title:Blocknote
Date:2007-06-08
Tags:  mediawiki

### Php oracle

-   <http://fr3.php.net/oci8>
-   <http://www.oracle.com/technology/tech/oci/instantclient/index.html>

### iptables

    #!/bin/sh

    echo "1" > /proc/sys/net/ipv4/ip_forward
    iptables -t nat -A POSTROUTING -s 192.168.0.0/16 -j MASQUERADE

    ### Port Forwarding ###
    iptables -A PREROUTING -t nat -p tcp -i eth0 --dport 80 -j DNAT --to 192.168.3.2:80
    iptables -A PREROUTING -t nat -p tcp -i eth0 --dport 25 -j DNAT --to 192.168.3.3:25
    iptables -A PREROUTING -t nat -p tcp -i eth0 --dport 110 -j DNAT --to 192.168.3.3:110
