sudo apt autoremove couchdb -y
sudo apt purge couchdb -y

sudo apt autoremove nodejs -y

sudo rm -r /opt/FAIMS3-conductor
sudo rm -r /opt/FAIMS-Thesis
sudo rm /etc/systemd/system/StartConductor.service

