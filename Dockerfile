FROM rancher/k3s:v1.18.6-k3s1

ADD ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

