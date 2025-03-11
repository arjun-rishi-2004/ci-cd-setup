# # Use a base image with OpenJDK
# FROM openjdk:17-jdk-slim

# # Set environment variables (can be overridden at runtime)
# ARG SCHEMA
# ARG SERVER_PORT
# ARG SAAS_URL
# ARG PUBLIC_URL
# ARG SPRING_PROFILES

# ENV SPRING_JPA_HIBERNATE_DEFAULT_SCHEMA=$SCHEMA \
#     SERVER_PORT=$SERVER_PORT \
#     CUSTOM_SAAS_URL=$SAAS_URL \
#     CUSTOM_PUBLIC_URL=$PUBLIC_URL \
#     SPRING_PROFILE_ACTIVE=$SPRING_PROFILE

# # Copy JAR file into the container
# COPY ./build/libs/demo-0.0.1-SNAPSHOT.jar /app.jar

# # Expose the application port
# EXPOSE $SERVER_PORT

# # Start the application with dynamic arguments
# ENTRYPOINT ["sh", "-c", "java -jar \
#     -Dspring.profiles.active=${SPRING_PROFILES_ACTIVE} \
#     -Dspring.jpa.properties.hibernate.default_schema=${SPRING_JPA_HIBERNATE_DEFAULT_SCHEMA} \
#     -Dserver.port=${SERVER_PORT} \
#     -Dcustom.saas.url=${CUSTOM_SAAS_URL} \
#     -Dcustom.public.url=${CUSTOM_PUBLIC_URL} \
#     -Dlogging.level.root=info /app.jar"]
# Use a minimal OpenJDK base image for smaller footprint
FROM openjdk:17-jdk-slim

# Set build-time arguments (can be overridden at runtime)
ARG SCHEMA
ARG SERVER_PORT
ARG SAAS_URL
ARG PUBLIC_URL
ARG SPRING_PROFILES_ACTIVE

# Set environment variables
ENV SPRING_JPA_HIBERNATE_DEFAULT_SCHEMA=$SCHEMA \
    SERVER_PORT=$SERVER_PORT \
    CUSTOM_SAAS_URL=$SAAS_URL \
    CUSTOM_PUBLIC_URL=$PUBLIC_URL \
    SPRING_PROFILES_ACTIVE=$SPRING_PROFILES_ACTIVE

# Copy JAR file into the container
COPY ./build/libs/demo-0.0.1-SNAPSHOT.jar /app.jar

# Ensure the JAR has execution permissions
RUN chmod +x /app.jar

# Start the application with runtime parameters
ENTRYPOINT ["sh", "-c", "exec java -jar \
    -Dspring.profiles.active=${SPRING_PROFILES_ACTIVE} \
    -Dspring.jpa.properties.hibernate.default_schema=${SPRING_JPA_HIBERNATE_DEFAULT_SCHEMA} \
    -Dserver.port=${SERVER_PORT} \
    -Dcustom.saas.url=${CUSTOM_SAAS_URL} \
    -Dcustom.public.url=${CUSTOM_PUBLIC_URL} \
    -Dlogging.level.root=info /app.jar"]
