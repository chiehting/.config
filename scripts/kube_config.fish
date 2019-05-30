#!/bin/sh

set config_dir $HOME/.kube/conf
if [ -d "$config_dir" ]
  set kubeconfig $HOME/.kube/config
  for cluster in $config_dir/*
    set kubeconfig $kubeconfig:$cluster
  end
end

export KUBECONFIG=$kubeconfig

