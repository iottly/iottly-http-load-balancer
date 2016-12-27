#References:
- https://gist.github.com/renchap/c093702f06df69ba5cac
- https://letsencrypt.org/getting-started/
- https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-ubuntu-14-04
- https://www.nginx.com/blog/free-certificates-lets-encrypt-and-nginx/

#Certificates location
Certificates are located whithin the iottlyhttploadbalancer container at the following location:
- `/etc/letsencrypt/live/[domain subdirs]`
This location is mounted as per [compose](https://github.com/iottly/iottly-docker/blob/master/docker-compose.yml) directive from an external `certificate` volume

#Manual Procedure to cert first issuing
1. `cd iottly-http-load-balancer/iottly-letsencrypt`
2. `./start.sh [FEDOMAIN] [APIDOMAIN] [WSDOMAIN] [BROKERDOMAIN] [ISSUING EMAIL]`
  - this will perform all the **issuing** operations persisting certificates in the external `certificate` volume

#Manual Procedure to cert renewal
(must be fixed with a cron job)

1. `cd iottly-http-load-balancer/iottly-letsencrypt`
2. `./renew.sh`
  - this will perform all the **renewal** operations persisting certificates in the external `certificate` volume
