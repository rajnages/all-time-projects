#  Very advance topic learn carefully.
# This is mainly used for microservices architecture, Example swiggy which have 400+ MS.
# Imagine there are lot of Microservices and if you wanted them to dedicatedly inter connect then we need service mesh connection -->

# Install ISTIO under usr/local/bin

curl -L https://istio.io/downloadIstio | ISTIO_VERSION=1.18.0 sh -
cp istio-1.18.0/bin/istioctl /usr/local/bin/
istioctl --version

-------------------------------------------------------------------------------------------------

nano /tmp/istio-ingressgateway.yml
# Before deploying we need to give the below command and then we need to pass the below yaml file in the command.
istioctl install --set profile=minimal -f istio-ingressgateway.yml

Switch to istio namespace

-------------------------------------------------------------------------------------------------

# We need to install PROMETHEOUS on Istion NS
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.16/samples/addons/prometheus.yaml

-------------------------------------------------------------------------------------------------

Enable ISTIO on Default Namespace:
kubectl label namespace default istio-injection=enabled

-------------------------------------------------------------------------------------------------

# INSTALL KIALI AND JAEGER PLEASE MAKE SRE YOU ARE DEPLOYING IT IN ISTIO NAMESPACE
# KIALI IS USED FOR DASHBOARD PURPOSE AND JAEGER IS USED FOR TRACIN PURPOSE.

ON ISTIO NAMESPACE

# KIALI
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.16/samples/addons/kiali.yaml

# JAEGER
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.16/samples/addons/jaeger.yaml

-------------------------------------------------------------------------------------------------

Deploy voting application In DEFAULT

-------------------------------------------------------------------------------------------------

# NOW YOU NEED TO DEPLOY YOUR VOTING AND RESULT APP WITH THE CLUSTER IP,
# MAKE SURE THAT YOU ARE CREATING SECRETS BECAUSE DOCKER IMAGES ARE IN PRIVATE REPO

YOU SHOULD DEPLOY IN DEFAULY NAMESPACE NOT IN ISTIO NAMESPACE

Nano tls.key
nano tls.crt

# Paste keys accordingly

-------------------------------------------------------------------------------------------------

# generate the secrete command below make sure you are running in both the name space with below command

kubectl create secret tls my-tls-secret --key="tls.key" --cert="tls.crt" -n istio-system
kubectl create secret tls my-tls-secret --key="tls.key" --cert="tls.crt" -n default

-------------------------------------------------------------------------------------------------

FIRST CHANGE THE RECORDS IN ROUTE53 AND DEPLOY IT on default node
nano votingapp-gw-vs-ssl.yaml

# WE ARE DEPLOYING GATEWAY IT WILL CONNECT TO THE GATEWAY,
# WE HAVE DEPLOYED ONE ISTIO-INGRESS DEPLOYMENT RIGHT ? SO TO THAT GATEWAY IT WILL CONNECT.

-------------------------------------------------------------------------------------------------

stay on ISTIO namespace

Deploy Kiali and jaegr
