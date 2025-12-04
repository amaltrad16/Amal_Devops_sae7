# Utiliser l'image de base eclipse-temurin avec JDK 17 (Alpine)
FROM eclipse-temurin:17-jdk-alpine

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier le fichier JAR généré par le build Maven dans le conteneur
COPY target/*.jar app.jar

# Exposer le port 8080 (le port par défaut pour les applications Spring Boot)
EXPOSE 8080

# Définir la commande d'exécution pour lancer l'application Java
ENTRYPOINT ["java", "-jar", "app.jar"]
