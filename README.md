# kanto

This repository contains the GitOps configuration for my homelab Kubernetes cluster, managed with FluxCD. It stores all Kubernetes manifests that define the desired state of the cluster, which is continuously reconciled by Flux.

## Structure

- **infrastructure/** — Contains the core infrastructure components of the cluster (e.g. ingress controller, cert-manager, SSO, remote access, storage drivers, etc.), organized by application.
- **clusters/kanto/** — Defines the FluxCD configuration and entrypoint for the kanto homelab cluster, including the kustomizations that connect applications and infrastructure.
- **apps/** — Application deployments and their supporting configuration, organized by application.
- **sops-secrets/** — Encrypted secrets managed using SOPS and Age to securely store sensitive values in Git.
