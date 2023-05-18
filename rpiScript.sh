apt update -y && sudo apt upgrade -y


echo 
echo "#########################################################"
echo "Install node.js version 16"

curl -fsSL https://deb.nodesource.com/setup_16.x | bash - &&\
apt install -y nodejs

hash -r


echo 
echo "#########################################################"
echo "Download FAIMS conductor"

cd /home/faims/Documents/
git clone https://github.com/FAIMS/FAIMS3-conductor.git

mv .env FAIMS3-conductor/

cd FAIMS3-conductor/


echo 
echo "#########################################################"
echo "Create couchdb local.ini"

chmod +x ./keymanagement/makeInstanceKeys.sh
./keymanagement/makeInstanceKeys.sh .env


echo 
echo "#########################################################"
echo "Install FAIMS conductor dependancies"

npm install

apt update && apt install -y curl apt-transport-https gnupg
curl https://couchdb.apache.org/repo/keys.asc | gpg --dearmor | sudo tee /usr/share/keyrings/couchdb-archive-keyring.gpg >/dev/null 2>&1
source /etc/os-release
echo "deb [signed-by=/usr/share/keyrings/couchdb-archive-keyring.gpg] https://apache.jfrog.io/artifactory/couchdb-deb/ ${VERSION_CODENAME} main" \
    | sudo tee /etc/apt/sources.list.d/couchdb.list >/dev/null

apt update -y && apt upgrade -y

source /home/faims/Documents/FAIMS3-conductor/.env


echo 
echo "#########################################################"
echo "CouchDB configure and setup"

COUCHDB_PASSWORD=$COUCHDB_PASSWORD
FAIMS_COOKIE=$FAIMS_COOKIE_SECRET
echo "couchdb couchdb/mode select standalone
couchdb couchdb/mode seen true
couchdb couchdb/cookie string ${FAIMS_COOKIE}
couchdb couchdb/cookie seen true
couchdb couchdb/bindaddress string 127.0.0.1
couchdb couchdb/bindaddress seen true
couchdb couchdb/adminpass password ${COUCHDB_PASSWORD}
couchdb couchdb/adminpass seen true
couchdb couchdb/adminpass_again password ${COUCHDB_PASSWORD}
couchdb couchdb/adminpass_again seen true" | debconf-set-selections
DEBIAN_FRONTEND=noninteractive apt-get install -y couchdb


echo 
echo "#########################################################"
echo "Copying local.ini"

cp /home/faims/Documents/FAIMS3-conductor/couchdb/local.ini /opt/couchdb/etc/


echo 
echo "#########################################################"
echo "restart couchdb"
service couchdb restart


echo 
echo "#########################################################"
echo "Configuration of Access Point"

cd /home/faims/Documents/
git clone https://github.com/Br00xx/FAIMS-Thesis

cd /home/faims/Documents/FAIMS-Thesis/faimsAccessPoint

chmod +x accessPoint.txt
./accessPoint.txt








