Voici un modèle de fichier `README.md` clair, professionnel et parfait pour documenter ton infrastructure as code. Tu peux copier ce texte et le coller directement dans un nouveau fichier nommé `README.md` à la racine de ton projet.

***


# 🚀 Déploiement Automatisé d'un Serveur DNS Local (Bind9)

Ce projet utilise le concept d'**Infrastructure as Code (IaC)** pour déployer et configurer un serveur DNS local fonctionnel de manière 100% automatisée. Il s'appuie sur **Vagrant** pour la création de la machine virtuelle et sur **Ansible** pour la configuration du service.

## 🎯 Objectif du projet
Créer un environnement de test isolé capable de résoudre un nom de domaine local personnalisé (`test.mg`) depuis la machine hôte Windows, sans aucune installation manuelle sur le serveur.

## 🛠️ Prérequis
Pour lancer ce projet, les outils suivants doivent être installés sur votre machine (Windows/Mac/Linux) :
* [VirtualBox](https://www.virtualbox.org/)
* [Vagrant](https://www.vagrantup.com/)
* *Note : Ansible n'a pas besoin d'être installé sur votre machine physique, Vagrant s'en charge automatiquement à l'intérieur de la VM.*

## 📂 Architecture des fichiers
* `Vagrantfile` : Le "constructeur". Il crée une VM Debian 12 avec l'IP fixe `192.168.56.30` et lance Ansible.
* `playbook.yml` : Le "chef d'orchestre". Il installe Bind9 et copie les fichiers de configuration.
* `named.conf.local` : Déclare la nouvelle zone DNS pour `test.mg`.
* `db.test.mg` : Contient l'annuaire des adresses IP (les enregistrements pour `test.mg` et `www.test.mg`).

## 🚀 Démarrage Rapide

1. Ouvrez un terminal (PowerShell ou CMD) dans le dossier du projet.
2. Lancez la création et la configuration de la machine avec la commande :
   ```bash
   vagrant up
   ```
3. Patientez quelques minutes. Vagrant va télécharger l'image Debian (si nécessaire), créer la VM "Serveur-DNS-Charlie", installer Ansible et lancer la configuration réseau.

## 🧪 Comment tester ?

Une fois le déploiement terminé, vous pouvez vérifier que le serveur DNS fonctionne directement depuis votre terminal Windows. Tapez la commande suivante pour forcer l'interrogation de votre nouveau serveur :

```powershell
nslookup test.mg 192.168.56.30
```
**Résultat attendu :** Le serveur doit vous retourner l'adresse IP `192.168.56.30`.

## 🔄 Mise à jour de la configuration

Si vous ajoutez de nouveaux sous-domaines (ex: `api.test.mg`) dans le fichier `db.test.mg` sur votre ordinateur, vous n'avez pas besoin de vous connecter en SSH. Tapez simplement :

```bash
vagrant provision
```
Ansible détectera les changements, mettra à jour les fichiers sur le serveur et redémarrera le service Bind9 automatiquement.

## 🧹 Nettoyage
Pour éteindre la machine à la fin de la journée :
```bash
vagrant halt
```
Pour détruire complètement l'environnement de test et libérer de l'espace disque :
```bash
vagrant destroy -f
```

***

**Veux-tu que je t'explique comment on pourrait utiliser Git pour sauvegarder ce projet proprement sur ton compte GitHub ?**
