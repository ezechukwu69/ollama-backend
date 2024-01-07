# Dockerfile for ollama service
FROM ollama/ollama:latest

# Set the container name
ENV container_name ollama_cat

# Set the volume for ollama
VOLUME /root/.ollama

# Expose ports
EXPOSE 8080
EXPOSE 11434

# Install socat (if not already installed)
RUN apt-get update && apt-get install -y socat
RUN socat TCP-LISTEN:8080,fork,reuseaddr TCP:localhost:11434 &

ENV OLLAMA_HOST 0.0.0.0:8080

ENTRYPOINT ["/bin/ollama"]
# Port forwarding from 8080 to 11434 and run /bin/ollama serve
CMD ["serve"]

