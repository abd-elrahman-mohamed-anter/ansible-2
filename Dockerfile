# ---------- Dockerfile: Run pre-built Spring PetClinic ----------

# Use a lightweight Java 17 JRE image
FROM eclipse-temurin:17-jre-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the pre-built JAR from the host into the container
COPY spring-petclinic-3.5.0-SNAPSHOT.jar ./spring-petclinic.jar

# Expose the default application port
EXPOSE 8080

# Set the default command to run the application
CMD ["java", "-jar", "spring-petclinic.jar"]

