#!/usr/bin/env bash

echo "Starting an end to end deployment of Rackspace OS with Nuage neutron plugin"

cd /opt/openstack-ansible/playbooks
sudo openstack-ansible setup-everything.yml

echo "Running Nuage VRS playbooks to configure OS compute nodes with Nuage VRS"
cd /opt/nuage-openstack-ansible/nuage_playbooks
sudo openstack-ansible nuage_all.yml
