FROM docker.io/jupyterhub/k8s-hub:1.1.3

USER root
RUN pip3 install wheel lxml && \
    pip3 install git+https://github.com/cwaldbieser/jhub_cas_authenticator.git#egg=jhub_cas_authenticator

COPY logo.png /srv/logo.png

USER jovyan
