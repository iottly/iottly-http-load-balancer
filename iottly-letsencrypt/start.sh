FEDOMAIN=$1
APIDOMAIN=$2
WSDOMAIN=$3
BROKERDOMAIN=$4

EMAIL=$5

docker run --rm -it --volumes-from iottlydocker_iottlyhttploadbalancer_1    \
    -v "`pwd`/letsencrypt/var/log/letsencrypt:/var/log/letsencrypt"         \
    -v "`pwd`/letsencrypt/etc/letsencrypt:/etc/letsencrypt"                 \
    -v "`pwd`/letsencrypt/var/lib/letsencrypt:/var/lib/letsencrypt"         \
    lojzik/letsencrypt                                                      \
    certonly                                                                \
    --email $EMAIL                                                          \
    -d $FEDOMAIN                                                            \
    -d $APIDOMAIN                                                           \
    -d $WSDOMAIN                                                            \
    -d $BROKERDOMAIN                                                        \
    -a webroot --webroot-path /usr/share/nginx/html/
