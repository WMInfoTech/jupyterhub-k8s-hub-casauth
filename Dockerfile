FROM jupyterhub/k8s-hub:v0.5.0

RUN pip3 install jhub_cas_authenticator
