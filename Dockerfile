# Utiliser une image Java pour le build
FROM eclipse-temurin:17-jdk AS build

# Définir le répertoire de travail
WORKDIR /app

# Copier le pom.xml et les sources du projet
COPY pom.xml .
COPY src ./src

# Installer Maven et exécuter la commande de build
RUN apt-get update && apt-get install -y maven

# Exécuter Maven pour build le projet
RUN mvn clean package -DskipTests

# Utiliser l'image finale pour l'exécution
FROM eclipse-temurin:17-jdk

# Définir le répertoire de travail dans l'image finale
WORKDIR /app

# Copier l'artefact généré du build précédent
COPY --from=build /app/target/student-management-0.0.1-SNAPSHOT.jar app.jar

# Exposer le port et démarrer l'application
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
