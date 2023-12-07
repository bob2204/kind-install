# Installation/configuration d'un clusteur de démonstration avec Kind

* Installation du client `kubectl`

  NB: À faire en tant que *root*

  ```
  $ su -
  # cd ~stagiaire
  # ./install-kubectl.sh
  ```
* Paramètrage *sysctl*

  # ./sysctl.sh

* Configuration du client `kubectl`
  ```
  $ ./config-kubectl.sh
  ```

* Installation de Kind

  Quatre nodes : 1 Control-plane et 3 workers

  ```
  $ ./init-kind.sh
  ```
