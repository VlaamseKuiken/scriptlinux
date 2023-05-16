#!/bin/bash 

sudo su

# update
apt-get update
apt-get upgrade
sudo apt install dialog -y

# install ssh

sudo apt install openssh-server
sudo systemctl status ssh


# Set usernames
for i in {1..10}; do sleep 2; echo $i; done | dialog --gauge 'Running auto-config (bhfRebs5-master)...' 6 60
usernames=("henkboretty" "janhuisman" "johannesdevries" "henkdegroot" "jannesdejong" "lindadejonge" "inadewit" "karelgrotenbier" "agathadeboer" "mikedeboer")

# Loop through usernames and add users
for username in "${usernames[@]}"
do
  # Add user
  sudo useradd -m "$username"

  # Set password for the user
  sudo passwd "$username"
done

# Make directory
mkdir /data
mkdir /data/directie
mkdir /data/beheer
mkdir /data/ontwikkeling

# Makes groups
  groupadd derectie
  groupadd beheer
  groupadd ontwikkeling

# Groups of departments

derectie=("henkboretty" "janhuisman" "johannesdevries")
beheer=("henkdegroot" "jannesdejong" "lindadejonge")
ontwikkeling=("inadewit" "karelgrotenbier" "agathadeboer" "mikedeboer")

# Add users to group
  # Add users derectie
  usermod -a -G derectie henkboretty
  usermod -a -G derectie janhuisman
  usermod -a -G derectie johannesdevries
done
# Add users beheer
  usermod -a -G beheer henkdegroot
  usermod -a -G beheer jannesdejong
  usermod -a -G beheer lindadejonge

done
# Add users ontwikkeling
 usermod -a -G ontwikkeling inadewit
 usermod -a -G ontwikkeling karelgrotenbier
 usermod -a -G ontwikkeling agathadeboer
 usermod -a -G ontwikkeling mikedeboer

 done

 # Set permissions to groups and users
 
 # Owner users
 sudo chown henkboretty:henkboretty /data/directie
 sudo chown henkdegroot:henkdegroot /data/beheer
 sudo chown inadewit:inadewit /data/ontwikkeling

 # Groups permissions


 # File Permissions
 sudo chmod 774 directie
 sudo chmod 774 beheer
 sudo chmod 774 ontwikkeling

 ls -l /data/directie
 ls -l /data/beheer
 ls -l /data/ontwikkeling

 for i in {1..200}; do sleep 2; echo $i; done | dialog --gauge 'Creating file data...' 6 60

 # Back-ups

 # make dir
 mkdir /back-up

#write out current crontab
crontab -l > mycron
#echo new cron into cron file
echo 0 0 * * * cp -r /data /back-up >> mycron
#install new cron file
crontab mycron
rm mycron

# change host

hostname

sudo hostnamectl set-hostname HuBo-IT

sudo nano /etc/hosts

# firewall install

sudo ufw status
sudo apt-get install ufw
sudo ufw enable

# website
sudo apt-get update
sudo apt-get install apache2

sudo ufw allow 80

mkdir /website

sudo cp -R /website /var/www/html/

# Last reboot
for i in {1..250}; do sleep 2; echo $i; done | dialog --gauge 'Completing script data (ed47794-ssh script)...' 6 60
sudo reboot
