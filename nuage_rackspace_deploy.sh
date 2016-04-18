#!/usr/bin/env bash

echo "Starting an end to end deployment of Rackspace OS with Nuage neutron plugin"

cd /opt/openstack-ansible/playbooks
sudo openstack-ansible setup-hosts.yml
sudo openstack-ansible setup-infrastructure.yml

if [ $1 == haproxy ] ; then
  echo "HA proxy is configured; running HA proxy install playbook"
  sudo openstack-ansible haproxy-install.yml
else
  echo "HA proxy is not configured. Will skip running the haproxy install playbook"
fi

sudo openstack-ansible setup-openstack.yml

echo "Running Nuage VRS playbooks to configure OS compute nodes with Nuage VRS"
cd /opt/openstack-ansible/nuage-openstack-ansible/nuage_playbooks
sudo openstack-ansible nuage_all.yml
