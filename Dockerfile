# Étape de build Maven
RUN mvn clean package -DskipTests

# Vérifie si le répertoire cible existe
RUN ls -al /app/target

# Copie le fichier JAR dans l'image Docker
COPY target/*.jar app.jar

# Expose le port et lance l'application
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
