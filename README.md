# FAIMS-Thesis
https://github.com/FAIMS 
This repository is here to contain a deployment script for FAIMS and any other file that are necessary for installation

The script can be used to install FAIMS conductor onto a raspberry pi or within a virtual machine.
The only difference between them is the install of nodejs. Versions >12 are not available for x86 architectures while running debian.

Instructions
1. sudo git clone https://github.com/Br00xx/FAIMS-Thesis
3. cd FAIMS-Thesis
4. sudo chmod +x vmScript.sh while running in virtual machine or chmod +x rpiScript.sh for raspberry pi
5. sudo su
6. ./vmScript.sh or ./rpiScript.sh

Machine will restart and start conductor on start-up
The following part will only need to be completed the first time it's launched

 7. cd /opt/FAIMS-conductor
 8. sudo npm run initdb
 9. systemctl restart StartConductor.service
 10. Go to Conductor URL and login
 11. Go to main page and get the Bearer Token
 12. Paste the token in .env file after USER_TOKEN=
 13. sudo npm run load-notebooks

FAIMS3 will also be installed. To get that running

  14. navigate to /opt/FAIMS3
  15. open terminal here
  16. sudo npm start
