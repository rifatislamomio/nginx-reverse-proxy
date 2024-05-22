# install Nginx
sudo apt update
sudo apt install nginx

# Allow access to Nginx through firewall
sudo ufw allow 'Nginx HTTP'

# To check status run
sudo systemctl status nginx

# Create a custom configuration file
cd /etc/nginx/sites-available/<configuration file name>

echo "
server {
    listen 80;
    listen [::]:80;

    server_name <domain or ip>;

    location / {
        proxy_pass http://localhost:<application port>;
        include proxy_params;
    }
}
" > <configuration file name>

# Enable this configuration file by creating a link
sudo ln -s /etc/nginx/sites-available/<configuration file name> /etc/nginx/sites-enabled/

# To verify configuration file run
sudo nginx -t

# Reload Nginx to apply these changes
sudo nginx -s reload
