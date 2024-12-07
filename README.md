# Installation/configuration d'un clusteur de démonstration avec Kind

***Remarque***
Le script *05-init-kind.sh* est destiné à une VM Virtualbox. Pour toute autre installation, vérifier le nom de l'interface réseau (TODO).

* Configuration des variables d'environnement

  Fichier *env.conf*

* Opérations en tant que *root*

  ```
  $ su -
  # cd ~stagiaire/kind-install
  # ./01-sysctl.sh
  # ./02-install-kubectl.sh
  # ./03-install-helm.sh
  # ./03-install-kind-cloud-provider.sh
  ```

* Opérations en tant que *stagiaire*
  ```
  $ ./04-config-kubectl-helm.sh
  $ ./05-init-kind.sh
  ```

* Installation du *metrics-server*

```=
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
```

