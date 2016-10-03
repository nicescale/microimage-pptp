from alpine:3.4

run apk add -U pptpd iptables

entrypoint ["/entrypoint.sh"]
cmd ["pptpd", "--fg"]
