#!/bin/bash
sudo sed -i 's/yes/no/g' /etc/initramfs-tools/update-initramfs.conf
sudo rm -f /var/lib/man-db/auto-update
sudo sed '/fontconfig/d' -i /var/lib/dpkg/triggers/File
sudo sed '/install-info/d' -i /var/lib/dpkg/triggers/File
sudo sed '/mime/d' -i /var/lib/dpkg/triggers/File
sudo sed '/hicolor-icon-theme/d' -i /var/lib/dpkg/triggers/File
echo 'exec eatmydata /usr/bin/dpkg $@' | sudo tee /usr/local/bin/dpkg && sudo chmod +x /usr/local/bin/dpkg
echo 'exec eatmydata /usr/bin/apt $@' | sudo tee /usr/local/bin/apt && sudo chmod +x /usr/local/bin/apt
