FROM eclipse-temurin:17-jdk-alpine

# Install curl for health checks
RUN apk add --no-cache curl

WORKDIR /app

# Copy the JAR file
COPY CGDMS-0.0.1.jar app.jar

# Expose port
EXPOSE 9090

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
    CMD curl -f http://localhost:9090/api/v1/actuator/health || exit 1

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]