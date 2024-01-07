# Dockerfile for ollama service
FROM ollama/ollama:latest

# Set the container name
ENV container_name ollama_backend

# Set the volume for ollama
VOLUME /root/.ollama

# Expose port 11434
EXPOSE 11434
ENTRYPOINT ["/bin/ollama"]
CMD ["serve"]
