# Installation/configuration d'un clusteur de démonstration avec Kind

* Opérations en tant que *root*

  ```
  $ su -
  # cd ~stagiaire/kind-install
  # ./01-sysctl.sh
  # ./02-install-kubectl.sh
  # ./03-install-helm.sh
  ```

* Opérations en tant que *stagiaire*
  ```
  $ ./04-config-kubectl.sh
  $ ./05-init-kind.sh
  ```

* Installation du *metrics-server*

```=
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
kubectl patch -n kube-system deployment metrics-server --type=json \
  -p '[{"op":"add","path":"/spec/template/spec/containers/0/args/-","value":"--kubelet-insecure-tls"}]'
```

