cd /opt
git clone https://github.com/FAIMS/FAIMS3
cp /opt/FAIMS-Thesis/FAIMS3.env /opt/FAIMS3/.env
cd /opt/FAIMS3
echo fs.inotify.max_user_watches= 100000 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
npm install
