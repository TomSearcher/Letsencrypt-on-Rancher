# Letsencrypt-on-Rancher
This is just the Dockerfile and scripts to build a container, which allows automatic creation and renewal of Let's Encrypt (https://letsencrypt.org/) ssl certificates. After creation and renewal it get's synchronized with your installation of Rancher's (http://rancher.com) certificate library.  

# Main Working Principal


# Build your own docker image 
You may pull the readily build image tomsearcher/letsencrypt_on_rancher from docker hub (see usage below).
Alternatively you may create from this files your own image.

```
git clone https://github.com/TomSearcher/Letsencrypt-on-Rancher
cd Letsencrypt-on-Rancher/
docker build -t yourimage .
```

# Use Letsencrypt-on-rancher

Following Environmental variables have to be defined when launching the Container. The first three values are, to specify the Rancher API endpoint. The latter two are used to specify the domain name and email address, for which the ssl certificate is to be requested at Let's Encrypt (https://letsencrypt.org/)

```
RANCHER_API_URL = Rancher API's http endpoint 
RANCHER_ACCESS_KEY = You Rancher API Access Key
RANCHER_SECRET_KEY = Rancher API Secret Key
CERT_URL = The Domain name, for which a certificate ihas to be requested
CERT_EMAIL = Email to list within the ssl certificate
```
##
hbhb
