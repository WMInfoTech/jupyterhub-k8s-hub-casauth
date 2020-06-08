FROM jupyterhub/k8s-hub:0.9.0

USER root
RUN pip3 install wheel lxml && \
    pip3 install git+https://github.com/cwaldbieser/jhub_cas_authenticator.git#egg=jhub_cas_authenticator

USER jovyan
