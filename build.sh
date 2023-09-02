#!/bin/bash
#!/bin/bash

set -e  # Exit immediately if a command fails

sudo apt update || { echo "Failed to update package lists"; exit 1; }

sudo apt install -y openjdk-8-jdk || { echo "Failed to install JDK"; exit 1; }

wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add - || { echo "Failed to add Jenkins repository key"; exit 1; }

sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list' || { echo "Failed to add Jenkins repository to sources list"; exit 1; }

sudo apt update || { echo "Failed to update package lists after adding Jenkins repository"; exit 1; }

sudo apt install -y jenkins || { echo "Failed to install Jenkins"; exit 1; }

sudo systemctl start jenkins || { echo "Failed to start Jenkins service"; exit 1; }

sudo systemctl enable jenkins || { echo "Failed to enable Jenkins service"; exit 1; }

sudo cat /var/lib/jenkins/secrets/initialAdminPassword || { echo "Failed to print initial Jenkins admin password"; exit 1; }

