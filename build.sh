#!/bin/bash
#!/bin/bash

set -e  # Exit immediately if a command fails

sudo apt update -y || { echo "Failed to update package lists"; exit 1; } && sudo apt upgrade -y || { echo "Failed to upgrade packages"; exit 1; }

sudo apt install -y openjdk-17-jre || { echo "Failed to install JDK"; exit 1; }


curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null


sudo apt update || { echo "Failed to update package lists after adding Jenkins repository"; exit 1; }

sudo apt install -y jenkins || { echo "Failed to install Jenkins"; exit 1; }

sudo systemctl start jenkins || { echo "Failed to start Jenkins service"; exit 1; }

sudo systemctl enable jenkins || { echo "Failed to enable Jenkins service"; exit 1; }

echo "Your jenkins admin password is:"

sudo cat /var/lib/jenkins/secrets/initialAdminPassword || { echo "Failed to print initial Jenkins admin password"; exit 1; }

