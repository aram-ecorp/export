#!/usr/bin/env bash
echo "Introduce un nombre de usuario.."
read username

#create user
adduser $username
echo "User $username created"

#add user to sudoers and disable password auth when our username uses sudo
#echo "$username ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

#set the minimal length for password to 8 characters
#echo "minlen = 8" >> /etc/security/pwquality.conf

#password should be changed every 90 days
#chage -d 90 $username

#remote server ip address
remoteIP="10.0.2.15"

#create local ssh folder
mkdir /home/$username/.ssh

#generate ssh key
ssh-keygen -N '' -f /home/$username/.ssh/id_rsa

#permissions for our local user
chown -R $username:$username /home/$username/.ssh
chmod -R 700 /home/$username/.ssh

#we're going to create a script to be executed on the remote server
touch remote-script.sh

#shebang
echo "#!/usr/bin/env bash" >> remote-script.sh

#create user
echo "adduser $username" >> remote-script.sh

#create remote .ssh folder
echo "mkdir /home/$username/.ssh" >> remote-script.sh

#create known_host file
echo "touch /home/$username/.ssh/known_hosts" >> remote-script.sh

#create remote ssh key
echo "ssh-keygen -N '' -f /home/$username/.ssh/id_rsa" >> remote-script.sh

#public ssh key to be included on the remote server
sshPubKey=`cat /home/$username/.ssh/id_rsa.pub`

echo "echo \""$sshPubKey\"" >> /home/$username/.ssh/authorized_keys" >> remote-script.sh
echo "chown -R $username:$username /home/$username/.ssh" >> remote-script.sh
echo "chmod -R 700 /home/$username/.ssh" >> remote-script.sh
