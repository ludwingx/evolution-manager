FROM node:20-slim

WORKDIR /usr/src/app

# Instala dependencias del sistema necesarias
RUN apt-get update && apt-get install -y \
    python3 \
    make \
    g++ \
    && rm -rf /var/lib/apt/lists/*

# Instala fs-extra globalmente primero
RUN npm install -g fs-extra

# Luego instala evolution-manager con todas sus dependencias
RUN npm install -g evolution-manager@0.4.13

# Crea el enlace simbólico para node
RUN ln -s /usr/local/bin/node /usr/bin/node

# Expone el puerto que usa Evolution API
EXPOSE 9615

# Comando de inicio
CMD ["evolution-manager", "server", "start"]
