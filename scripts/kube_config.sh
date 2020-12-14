#!/bin/sh

config_dir=$HOME/.kube/kubeconfigs

if [ -d "$config_dir" ]; then
  kubeconfig=$HOME/.kube/config
  for cluster in $config_dir/*
  do
    kubeconfig=$kubeconfig:$cluster
  done

  export KUBECONFIG=$kubeconfig
fi


