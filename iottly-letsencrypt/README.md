#References:
- https://letsencrypt.org/getting-started/
- https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-ubuntu-14-04
- https://www.nginx.com/blog/free-certificates-lets-encrypt-and-nginx/

#Certificates location
Certificates are located whithin the iottlyhttploadbalancer container at the following location:
- `/etc/letsencrypt/live/[domain subdirs]`
This location is mounted as per [compose](https://github.com/iottly/iottly-docker/blob/master/docker-compose.yml) directive from an external `certificate` volume

#Manual Procedure to cert renewal

(must be fixed with a cron job and removing the need of altering the conf file restarting nginx)

1. edit [iottly.conf](../nginx_conf_prod/conf.d/iottly.conf), in the first "server" section:
  1. allow http access to .well-known dir, uncommentig proper lines
  2. temporarilty stop the redirect to https commenting proper line
2. build, stop, rm, up the iottlyhttploadbalancer container (with compose)
3. `cd iottly-http-load-balancer/iottly-letsencrypt`
4. edit [start.sh](start.sh) removing the `--test-cert` option (which forces the cert issuing to run aginst let's encrypt staging servers)
5. `./start.sh [FEDOMAIN] [APIDOMAIN] [WSDOMAIN] [BROKERDOMAIN] [ISSUING EMAIL]`
  - this will perform all the issuing operations persisting certificates in the external `certificate` volume
6. reset the changes in [iottly.conf](../nginx_conf_prod/conf.d/iottly.conf)
7. build, stop, rm, up the iottlyhttploadbalancer container (with compose)
