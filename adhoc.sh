#!/bin/bash

ansible all -m ansible.builtin.yum_repository \
-a 'file=MyBase name=MyBase description="base software" baseurl="http://192.168.10.10/pkg/BaseOS" gpgcheck=no enabled=yes'

ansible all -m ansible.builtin.yum_repository \
-a 'file=MyAppStream name=MyAppStream description="AppStream software" baseurl="http://192.168.10.10/pkg/AppStream" gpgcheck=no enabled=yes'
