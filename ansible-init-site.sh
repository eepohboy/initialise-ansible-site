#!/bin/bash

# Needs to have site_name arg to create new directory
if [ $# -eq 0 ]
  then
    echo "Usage: ansible-init-site.sh site_name1 site_name2...site_nameN"
    echo "No arguments supplied. Please include at least 1 site_name to proceed"
    exit 1
fi

for arg; do
  echo "Initialising Ansible Site: $arg"
  echo "Creating group_vars folder"
  mkdir -p $arg/group_vars
  echo "Creating host_vars folder"
  mkdir -p $arg/host_vars
  echo "Creating roles folders"
  echo "Copy the role_template folder when creating new roles"
  mkdir -p $arg/roles/role_template/{tasks,handlers,templates,files,vars,defaults,meta}

  echo "Creating Master Playbook"
  touch $arg/$arg.yml

done
