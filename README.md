### ecommerce-opencart-data
Docker data container for opencart

#### How to run this

```bash  
docker run -e OC_VERSION=2.1.0.1 grzegorzwodo/ecommerce-opencart-data

```

##### Mounting /var/www/html to the local machine

```bash
docker run docker run -e PS_VERSION=2.1.0.1 -v /home/user/html:/var/www/html grzegorzwodo/ecommerce-opencart-data

```


#### Directory permissions
The **www-data** is an owner/group of the /var/www/html container directory. If you're mounting this directory to the local file system make sure your **www-data** user/group exists in your system. The alternative is to grant access to ALL users on your local directory. This will allow the container process to write to it.  
