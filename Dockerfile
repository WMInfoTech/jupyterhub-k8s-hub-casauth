FROM jupyterhub/k8s-hub:v0.5.0

RUN pip3 install wheel \
    && pip3 install git+https://github.com/cwaldbieser/jhub_cas_authenticator.git#egg=jhub_cas_authenticator
