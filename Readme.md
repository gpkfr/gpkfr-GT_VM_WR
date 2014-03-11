# Vmare-fusion Vagrant Box with Debian 7
This box provide a web server with Nginx, php5-fpm (version 5.5 from dotdeb) and mysql (Login/Password : root/root)

## installation

* Clone this repo [ git clone git@github.com:gpkfr/gpkfr-vmbox4dev.git vbox4dev && cd vbox4dev ]
* Update Submodule [ git submodule init && git submodule update ]
* Create www/public Path [ mkdir -p www/public ]
* make a index.php in public directory [ <?php phpinfo(); ]
* create vm [ vagrant up --provider vmware_fusion ]
*  check this [url](http://localhost:8080)

Happy Dev ;)

Feel Free to contribute