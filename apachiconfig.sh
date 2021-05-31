<VirtualHost *:80>
    . . .

    Alias /static /home/vineet/Django_sampleApp/DemoWebsite/static
    <Directory /home/vineet/Django_sampleApp/DemoWebsite/static>
        Require all granted
    </Directory>

    <Directory /home/vineet/Django_sampleApp/DemoWebsite/static>
        <Files wsgi.py>
            Require all granted
        </Files>
    </Directory>


    WSGIDaemonProcess DemoWebsite python-path=/home/vineet/Django_sampleApp/DemoWebsite/static python-home=/home/vineet/Django_sampleApp/SamplePrj
    WSGIProcessGroup DemoWebsite
    WSGIScriptAlias / /home/vineet/Django_sampleApp/DemoWebsite/DemoWebsite/wsgi.py

</VirtualHost>




WSGIScriptAlias / /var/www/html/DemoWebsite/DemoWebsite/wsgi.py
WSGIPythonPath //var/www/html/DemoWebsite/myproject/

<Directory /var/www/html/DemoWebsite/>
   <Files wsgi.py>
      Order deny,allow
      Allow from all
   </Files>
</Directory>





<VirtualHost *:80>
    #My site Name
    # ServerName <my-site-name>.com

    #Demon process for multiple virtual hosts
    WSGIDaemonProcess DemoWebsite threads=5

    #Pointing wsgi script to config file
    WSGIScriptAlias / /home/vineet/Django_sampleApp/DemoWebsite/DemoWebsite/wsgi.py
    WSGIProcessGroup DemoWebsite
    #Your static files location
    Alias /static/ "/home/vineet/Django_sampleApp/DemoWebsite/static/"
    # <Location "/media">
        # SetHandler None
    # </Location>
    # <LocationMatch "\.(jpg|gif|png|js|css)$">
    #     SetHandler None
    # </LocationMatch>
    <Directory /<my-site-dir> >
        WSGIProcessGroup <my-site-name>
        WSGIApplicationGroup %{GLOBAL}
        Order deny,allow
        Allow from all
    </Directory>
</VirtualHost>