# arcadia_deoiveira ECF 2024

## Description

Ce projet consiste à développer une application web fullstack pour le Zoo Arcadia, situé en Bretagne près de la forêt de Brocéliande. Le zoo, fondé en 1960, abrite divers animaux répartis par habitat (savane, jungle, marais) et met un accent particulier sur la santé et le bien-être de ses pensionnaires. Chaque jour, des vétérinaires effectuent des contrôles rigoureux et la nourriture est soigneusement calculée pour assurer le bon grammage et la santé optimale des animaux.

Le directeur du zoo, José, souhaite moderniser l'expérience des visiteurs en introduisant une application web. Celle-ci permettra aux visiteurs de visualiser les animaux, de consulter leur état de santé, d'accéder aux informations sur les services offerts et de connaître les horaires d'ouverture du zoo.

## Technologies

- **Symfony** : Symfony 7.0.9, Framework PHP. Utilisé pour le développement backend de l'application
- **twig** : "^2.12|^3.0".Moteur de template utilisé avec Symfony pour la gestion des vues côté frontend.
- **docker** : version 27.0.3, build 7d4bcd8.Utilisé pour la gestion des conteneurs afin d'assurer un environnement de développement et de déploiement cohérent.
- **Jira**: Outil de gestion de projet utilisé pour le suivi des tâches, des bugs et des fonctionnalités du projet.

## Installation et Utilisation
### Prérequis

1. Assurez-vous d'avoir Docker installé sur votre machine.
2. Clonez le dépôt : `git clone git@github.com:deoliveira-mallaury/arcadia_deoliveira.git`
3. Configurer les variables d'environnement nécessaires pour Symfony.
3. Récupérer image Docker : `docker pull mallauryprogra/arcadiaproject_deoliveira:latest`
4. Construire image Docker : `docker build -t mallauryprogra/arcadiaproject_deoliveira:latest . `
5. Pull différentes image du container Docker : `docker compose pull`
6. Démarer application: `docker compose up -d`
### Instructions d'Installation
Dans container docker php saisir commande :
 - `composer install` 
 - `npm install`
Pour accéder à la base de données PostgreSQL :
 -  Configurez les variables d'environnement dans `.env.local`.


-  Exécutez le conteneur Docker : 
- web-app = `http://localhost:8080` 
- postgresql = `http://localhost:5432 (db: arcadia, user: user, password: ******)`
   
L'application sera accessible à l'adresse `http://localhost:8080`.

## Contributeurs

- **José**, Directeur du Zoo Arcadia
- **Josette**, Assistante de Direction
- **De Oliveira Mallaury**, Développeuse Fullstack 

---