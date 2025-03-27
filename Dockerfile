FROM node:20

WORKDIR /app

# Instala todas las dependencias en un solo paso para evitar problemas de caché
RUN apt-get update && \
    apt-get install -y python3 make g++ && \
    npm install -g vite@latest fs-extra evolution-manager@0.4.13 && \
    ln -s /usr/local/bin/node /usr/bin/node && \
    ln -s /usr/local/bin/npm /usr/bin/npm && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 9615
CMD ["evolution-manager", "server", "start"]
