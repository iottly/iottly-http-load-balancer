docker run --rm -it --volumes-from iottlydocker_iottlyhttploadbalancer_1    \
    -v "`pwd`/letsencrypt/var/log/letsencrypt:/var/log/letsencrypt"         \
    -v "`pwd`/letsencrypt/etc/letsencrypt:/etc/letsencrypt"                 \
    -v "`pwd`/letsencrypt/var/lib/letsencrypt:/var/lib/letsencrypt"         \
    lojzik/letsencrypt                                                      \
    renew --agree-tos
