# Letsencrypt-on-Rancher
This is just the Dockerfile and scripts to build a container, which allows automatic creation and renewal of Let's Encrypt (https://letsencrypt.org/) ssl certificates. After creation and renewal it get's synchronized with your installation of Rancher's (http://rancher.com) certificate library. Feel free to use the already existing image from docker hub, immidiately (https://hub.docker.com/r/tomsearcher/letsencrypt_on_rancher/). 


# Build your own docker image 
You may pull the readily build image tomsearcher/letsencrypt_on_rancher from docker hub (see usage below).
Alternatively you may create your own image:

```
git clone https://github.com/TomSearcher/Letsencrypt-on-Rancher
cd Letsencrypt-on-Rancher/
docker build -t yourimage .
```

# Use Letsencrypt-on-rancher

## Required Environmental Variables
Following Environmental variables have to be defined when launching the Container. The first three values are used to specify the Rancher API endpoint. The latter two are used, to specify the domain name and email address, for which the ssl certificate is to be requested at Let's Encrypt (https://letsencrypt.org/).

```
RANCHER_API_URL = Rancher API's http endpoint 
RANCHER_ACCESS_KEY = You Rancher API Access Key
RANCHER_SECRET_KEY = Rancher API Secret Key
CERT_URL = The Domain name, for which a certificate ihas to be requested
CERT_EMAIL = Email to list within the ssl certificate
```
### Obtaining the Rancher API details

The Rancher API credentials can be found and configured from the Rancher administrative page under the API tab. Click "Add Account API Key" for obtaining a fresh Access Key and Secret. Those have to be copied to above environmental variables. The Rancher API URL is also listed on the same admin page.
![alt tag](https://raw.githubusercontent.com/TomSearcher/Letsencrypt-on-Rancher/master/rancher_api.PNG)

### Obtaining CERT_URL and CERT_EMAIL

CERT_URL is the domain name, which you want to get certified. So, for example CERT_URL=www.example.com for https://www.example.com. CERT_EMAIL can be any email address. There, you receive notifications from Let's Encrypt in case of certificate expiry, etc. Please note,  that **port 80 of this container has to be reachable from internet**, such that Let's Encrypt certification process works.
In Rancher, this can be easily achieved, by using their integrated load balncer to forward all requests to /.well-known to this letsencrypt-on-rancher container. In below example all requests to http://www.example.com/.well-known are sent to the container called letsencrypt, which is this container. Remaining traffic can continue to go into other directions, such as the real web page.
![alt tag](https://raw.githubusercontent.com/TomSearcher/Letsencrypt-on-Rancher/master/rancher_lb.PNG)

## Launching the container

### Option 1: Via Rancher Admin Page
Create a container in Rancher just as usual:
![alt tag](https://raw.githubusercontent.com/TomSearcher/Letsencrypt-on-Rancher/master/rancher_example.PNG)

### Option 2: Using Docker CLI
```
docker run -it -e RANCHER_API_URL="url" -e RANCHER_ACCESS_KEY="access_Key" -e RANCHER_SECRET_KEY="AP_Key" -e CERT_URL="domain_name" CERT_EMAIL="email" -p 80:80
```

## All ok?
After a while the certificate should appear within Rancher under "Infrastructure > Certificates". Otherwise check the log output of the container for potential issues. The process fails if the container is not reachable on port 80 of the domain to be certified.
