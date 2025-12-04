FROM eclipse-temurin:17-jdk

# Set the working directory
WORKDIR /app

# Add this to verify the content of the target directory
RUN ls -al /app/target

# Copy the compiled .jar file into the image
COPY target/*.jar app.jar

# Expose port 8080
EXPOSE 8080

# Define the entry point for the container
ENTRYPOINT ["java", "-jar", "app.jar"]
