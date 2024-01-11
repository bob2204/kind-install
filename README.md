# Installation/configuration d'un clusteur de démonstration avec Kind

* Opération en tant que *root*

  ```
  $ su -
  # cd ~stagiaire/kind-install
  # ./01-install-kubectl.sh
  # ./02-sysctl.sh
  ```

* Opération en tant que *stagiaire*
  ```
  $ ./03-config-kubectl.sh
  $ ./04-init-kind.sh
  ```

* Installation du *metrics-server*

```=
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
kubectl patch -n kube-system deployment metrics-server --type=json \
  -p '[{"op":"add","path":"/spec/template/spec/containers/0/args/-","value":"--kubelet-insecure-tls"}]'
```

