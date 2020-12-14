#!/bin/sh

set config_dir $HOME/.kube/kubeconfigs
if [ -d "$config_dir" ]
  set kubeconfig $HOME/.kube/config
  for cluster in $config_dir/*
    set kubeconfig $kubeconfig:$cluster
  end

  export KUBECONFIG=$kubeconfig
end


