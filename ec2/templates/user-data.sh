#!/bin/sh

TLS_ENABLED=${tls_enabled}

if [ "$TLS_ENABLED" = false ] ;
then
  echo "TLS isn't enabled, exiting..."
  exit 0
fi


while [ `curl http://checkip.amazonaws.com` != `dig +short ${subdomain}.${domain}` ]
do
	echo "Not ready yet..."
  sleep 2s
done

echo """
- name: 'Provision Image'
  hosts: localhost
  connection: local
  become: true
  roles:
    - role: certbot
      vars:
       domain: "${domain}"
       subdomain: "${subdomain}"
       email: "${email}"
    - role: shutdown-cleanup
      vars:
       domain: "${domain}"
       subdomain: "${subdomain}"

""" > playbook.yml

ansible-playbook playbook.yml
