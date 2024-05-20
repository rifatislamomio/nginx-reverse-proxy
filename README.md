##  Nginx as Reverse Proxy

### Part-1: Configuring Nginx as reverse proxy
	
** Step-01:** Install necessary packages or tools in Linux machine using following command

    sudo apt update
	  sudo apt install nginx

** Step-02:** Allow access to Nginx through firewall

    sudo ufw allow 'Nginx HTTP'

** Step-03:** To check status run

    sudo systemctl status nginx

** Step-04:** # Create a custom configuration file

    sudo nano /etc/nginx/sites-available/<configuration file name>
   
** Step-05:** Paste this on that configuration file

      server  {
      listen  80;
      listen [::]:80;
      server_name  <domain or ip>;
      location  /  {
        proxy_pass  http://localhost:<application port (8000 in this case)>;
        include  proxy_params;
      }
    }

** Step-06:** Enable this configuration file by creating a link

    sudo ln -s /etc/nginx/sites-available/<config file name> /etc/nginx/sites-enabled/

** Step-07:** To verify the configuration file run

    sudo nginx -t
   
** Step-08:** To verify the configuration file run

    sudo nginx -s reload

### Part-2: Run the python server

    # install pipenv  (if not already exists)
    pip install pipenv
    
    # install dependencies
    pipenv install
    
    # to activate this project's virtualenv
    pipenv shell
    
    # run the application
    python main.py
