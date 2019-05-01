#!/bin/sh

config_dir=$HOME/.kube/conf

if [ -d "$config_dir" ]; then
  kubeconfig=$HOME/.kube/config
  for cluster in $config_dir/*
  do
    kubeconfig=$kubeconfig:$cluster
  done
fi

export KUBECONFIG=$kubeconfig

