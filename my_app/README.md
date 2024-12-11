

# my_app

A new Flutter project.

# MyApp Drawings

MyApp Drawings est une application de dessin Flutter qui utilise Firebase pour l'authentification des utilisateurs et Flame pour créer un mini-jeu de dessin.

## Configuration Firebase

1. Crée un projet Firebase sur [Firebase Console](https://console.firebase.google.com/).
2. Ajoute une application Flutter à ton projet Firebase.
3. Remplace les informations d'authentification dans `main.dart` avec celles fournies par Firebase.

## Installation

Assure-toi d'avoir Flutter installé sur ton système. Si ce n'est pas le cas, suis les instructions [ici](https://flutter.dev/docs/get-started/install).

```bash
# Accède au répertoire du projet
cd my_app
```
# Installe les dépendances
flutter pub get

## Exécution 
flutter run

# Structure du Projet :
lib/main.dart: Point d'entrée de l'application. Configure Firebase et lance l'interface utilisateur.
lib/game_screen.dart: Écran du jeu utilisant Flame pour créer un mini-jeu de dessin.
lib/profile_screen.dart: Écran du profil après la connexion.
lib/login_screen.dart: Écran de connexion utilisant Firebase pour l'authentification.

# Firebase Authentification:
L'authentification des utilisateurs est gérée par Firebase. Le fichier login_screen.dart contient la logique de connexion.

# Flame Game:
Le mini-jeu de dessin est créé à l'aide de la bibliothèque Flame. Le fichier game_screen.dart contient la logique du jeu.

# Fonctionnalités
- Déplacement d'un objet sur l'écran.
- Gestion des interactions de l'utilisateur avec l'écran (taps, swipes, etc.).
- Animation et rendu graphique avec Flame.

# Conclusion
En conclusion, MyApp Drawings est une application Flutter dynamique qui combine l'authentification utilisateur via Firebase avec un mini-jeu de dessin interactif basé sur la bibliothèque Flame. Les utilisateurs peuvent s'inscrire et se connecter via email et mot de passe, accédant ainsi à un espace de jeu où ils peuvent interagir avec des éléments graphiques animés.

L'architecture du projet est conçue pour être modulaire, avec des fichiers distincts pour la gestion de l'authentification (login_screen.dart) et la logique du jeu (game_screen.dart). Les fonctionnalités de Flutter, Firebase et Flame sont exploitées pour offrir une expérience utilisateur fluide et engageante.
