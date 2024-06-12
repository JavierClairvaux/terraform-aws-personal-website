#!/bin/sh

while [ `curl http://checkip.amazonaws.com` != `dig +short test.cabreragon.xyz` ]
do
	echo "Not ready yet..."
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

