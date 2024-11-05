#!/usr/bin/bash

sudo apt install containerd ## install containerd
sudo mkdir /etc/containerd
containerd config default | sudo tee /etc/containerd/config.toml
sudo vim -c '/SystemdCgroup' -c 'normal $ciwtrue' -c wq config.toml ## replace false value of SystemdCgroup with true, sets cgroup driver to systemd
sudo vim -c '/swap' -c 'normal I# ' -c wq /etc/fstab ## comment out swap line, kubernetes needs swap to be disabled
sudo vim -c '/net.ipv4.ip_forward' -c 'normal ^x' -c wq /etc/sysctl.conf ## uncomment line to enable bridging
sudo vim -c 'normal ibr_netfilter' -c wq /etc/modules-load.d/k8s.conf ## create module config file, to load module at start; br_netfilter assists Kubernetes cluster with networking
