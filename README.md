# Letsencrypt-on-Rancher
This is just the Dockerfile and scripts to build a container, which allows automatic creation and renewal of Letsencrypt ssl certificates. After creation and renewal it get's synchronized with Rancher's certificate library.  

# Get the docker image 
You may pull the readily build image tomsearcher/letsencrypt_on_rancher from docker hub (see usage below).
Alternatively you may create from this files your own image.

'''
git clone https://github.com/TomSearcher/Letsencrypt-on-Rancher
cd Letsencrypt-on-Rancher/
docker build -t yourimage .
'''
