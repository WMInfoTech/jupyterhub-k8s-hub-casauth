JupyterHub with CAS Authentication
==================================

Build a docker image that includes the
[JupyterHub CAS Authenticator](https://github.com/cwaldbieser/jhub_cas_authenticator).

To run JupyterHub with CAS authentication using
[kubespawner](https://github.com/jupyterhub/kubespawner), use [helm to install JupyterHub](https://zero-to-jupyterhub.readthedocs.io/en/latest/setup-jupyterhub.html).

Instead of using the simple configuration example in the guide, use a configuration
file that specifies a custom image and configures the authenticator.

```yaml
---
prePuller:
  enabled: false
rbac:
  enabled: false
hub:
  image:
    name: wmit/jupyterhub-k8s-hub-casauth
    tag: v0.5.0
  extraConfig: |
    import jhub_cas_authenticator.cas_auth
proxy:
  secretToken: "It's a secret!"
auth:
  type: custom
  custom:
    className: jhub_cas_authenticator.cas_auth.CASAuthenticator
    config:
      cas_login_url: https://cas.example.edu/cas/login
      cas_service_url: https://jupyterhub.example.edu/login
      cas_service_validate_url: https://cas.example.edu/cas/p3/serviceValidate # Requires CAS 5
      # cas_service_validate_url: https://cas.example.edu/cas/serviceValidate # Works on CAS 3
  admin:
    users:
      - user1
      - user2
```

The sample configuration file also exists in the git repository in
[config.yaml](https://github.com/WMInfoTech/jupyterhub-k8s-hub-casauth/blob/master/config.yaml).
