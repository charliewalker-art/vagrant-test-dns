$TTL    604800
@       IN      SOA     ns1.test.mg. admin.test.mg. (
                              3         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      ns1.test.mg.
ns1     IN      A       192.168.56.30
@       IN      A       192.168.56.30
www     IN      A       192.168.56.30