# Remove UFW to avoid conflicts
sudo apt remove --purge ufw -y

# Enable and start firewalld
sudo systemctl enable firewalld
sudo systemctl start firewalld
sudo systemctl status firewalld

# List current rules
sudo firewall-cmd --list-all

# List supported services
sudo firewall-cmd --get-services

# View existing zones
sudo firewall-cmd --get-zones

# Create custom zones
sudo firewall-cmd --permanent --new-zone=web
sudo firewall-cmd --permanent --new-zone=sales
sudo firewall-cmd --permanent --new-zone=mail

# Reload firewalld to apply zone creation
sudo firewall-cmd --reload

# Assign interfaces to zones
sudo firewall-cmd --permanent --zone=public --change-interface=eth0
sudo firewall-cmd --permanent --zone=web --change-interface=eth1
sudo firewall-cmd --permanent --zone=sales --change-interface=eth2
sudo firewall-cmd --permanent --zone=mail --change-interface=eth3

# Add services to zones
sudo firewall-cmd --permanent --zone=public --add-service={http,https,pop3,smtp}
sudo firewall-cmd --permanent --zone=web --add-service=http
sudo firewall-cmd --permanent --zone=sales --add-service=https
sudo firewall-cmd --permanent --zone=mail --add-service={smtp,pop3}

# Block known malicious IPs by assigning them to the drop zone
sudo firewall-cmd --permanent --zone=drop --add-source=10.208.56.23
sudo firewall-cmd --permanent --zone=drop --add-source=135.95.103.76
sudo firewall-cmd --permanent --zone=drop --add-source=76.34.169.118

# Reload to apply all changes
sudo firewall-cmd --reload

# View all active zones
sudo firewall-cmd --get-active-zones

# View zone services
sudo firewall-cmd --zone=public --list-all
sudo firewall-cmd --zone=web --list-all
sudo firewall-cmd --zone=sales --list-all
sudo firewall-cmd --zone=mail --list-all

# Add rich rule to block specific IP
sudo firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="138.138.0.3" reject'

# Block ping (ICMP echo-reply)
sudo firewall-cmd --permanent --zone=public --add-icmp-block=echo-request

# Final check for all zone settings
sudo firewall-cmd --zone=public --list-all
sudo firewall-cmd --zone=web --list-all
sudo firewall-cmd --zone=sales --list-all
sudo firewall-cmd --zone=mail --list-all
