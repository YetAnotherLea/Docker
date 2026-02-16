# Kiloupabocou

**Kiloupabocou** est un projet développé avec **Symfony 7**. Ce projet sert de démonstration pour une architecture "Cloud Native" haute performance, intégrant la conteneurisation avancée et l'observabilité temps réel.

---

## Stack Technique

L'architecture repose sur des technologies de pointe pour garantir rapidité et scalabilité :

- **Framework :** Symfony 7.x (PHP 8.3)
- **Serveur d'Application :** [FrankenPHP](https://frankenphp.dev/) (incluant le serveur Caddy)
- **Base de Données :** MySQL 8.0
- **Infrastructure :** Docker & Docker Compose
- **Observabilité (ELK) :** Elasticsearch, Logstash, Kibana
- **Sécurité :** HTTPS natif (HTTP/3) avec gestion automatique des certificats via Caddy
- **Base du projet :** Utilisation de [Symfony demo](https://github.com/symfony/demo) pour avoir une base de projet

---

## Architecture & Performance

### FrankenPHP & Worker Mode

Contrairement à une installation classique (Nginx + PHP-FPM), ce projet utilise le **Mode Worker** de FrankenPHP. L'application Symfony est chargée une seule fois en mémoire, permettant de traiter les requêtes instantanément sans redémarrer le noyau PHP.

### Observabilité (Stack ELK)

Le projet intègre :

1.  **Symfony (Monolog)** : envoie les logs au format JSON via UDP.
2.  **Logstash** : traite et filtre ces logs.
3.  **Elasticsearch** : indexe les logs.
4.  **Kibana** : interface visuelle.

---

## Installation et Démarrage

Le projet est entièrement orchestré via un **Makefile** pour une mise en route en une seule commande.

### Prérequis

- Docker & Docker Compose
- `make` installé sur votre système

### Lancement rapide

1.  **Cloner le projet**

    ```bash
    git clone [https://github.com/votre-compte/kiloupabocou.git](https://github.com/votre-compte/kiloupabocou.git)
    cd kiloupabocou
    ```

2.  **Initialiser l'environnement**
    ```bash
    make setup
    ```
    _Cette commande : construit les images, lance les conteneurs, installe les dépendances (Composer), joue les migrations et charge les données de test (Fixtures)._

---

## Accès aux services

| Service             | URL / Adresse                                  | Accès                   |
| :------------------ | :--------------------------------------------- | :---------------------- |
| **Application Web** | [https://localhost](https://localhost)         | HTTPS (Caddy)           |
| **Kibana (Logs)**   | [http://localhost:5601](http://localhost:5601) | Interface ELK           |
| **Elasticsearch**   | [http://localhost:9201](http://localhost:9201) | API Moteur de recherche |
| **Base de données** | `localhost:3307`                               | MySQL (Root/Password)   |

---

## Commandes du Makefile

| Commande     | Action                                            |
| :----------- | :------------------------------------------------ |
| `make setup` | Démarrage complet du projet et des dépendances.   |
| `make stop`  | Arrête proprement tous les services Docker.       |
| `make reset` | Supprime les volumes (vidage DB) et relance tout. |

---

## Fonctionnalités principales

- **Espace Admin :** Gestion complète du contenu (CRUD sécurisé).
- **Interactivité :** Système de commentaires et de retours utilisateurs.
- **Monitoring :** Centralisation des logs applicatifs sur Kibana.
