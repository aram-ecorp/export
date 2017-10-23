#!/usr/bin/env bash
adduser orfeo
mkdir /home/orfeo/.ssh
touch /home/orfeo/.ssh/known_hosts
ssh-keygen -N '' -f /home/orfeo/.ssh/id_rsa
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDkEPQXVOyzfF0nxRiU1gD2vSzi5kCyOlmYj/zwgkh+ax78DlF5FAAfBWCVQCngLTSP9a70Nq1FZUuck1+IT3QaBJCP/+bu7SS5VviAP8a5otijm93Xp32tn56O/pTpEAJWG25U1HURF5rIvzWVMst2ZUak+qK545VUgF8C+cnUHG/Z8Oxev6a44AYPS0rIMZ7528MvVyyeN8F+/j711ib/q5sbMb4HSV74Vu5kGI1RduAxBqBxmYYndz7yAWwUmDi533NXZ9jxjBY7zzjjIRQ0dheYDOxJi+Cb7MpSNHJo2HShK7uytmQsP1arPlZ5HKHA1HUng++naBq6Wzl5i1XX root@localhost.localdomain" >> /home/orfeo/.ssh/authorized_keys
chown -R orfeo:orfeo /home/orfeo/.ssh
chmod -R 700 /home/orfeo/.ssh
