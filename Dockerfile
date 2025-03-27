FROM node:20-slim

WORKDIR /usr/src/app

# Instala dependencias del sistema necesarias
RUN apt-get update && apt-get install -y \
    python3 \
    make \
    g++ \
    && rm -rf /var/lib/apt/lists/*

# Instala Vite y fs-extra primero (requerimientos críticos)
RUN npm install -g vite fs-extra

# Luego instala evolution-manager
RUN npm install -g evolution-manager@0.4.13

# Crea enlaces simbólicos necesarios
RUN ln -s /usr/local/bin/node /usr/bin/node
RUN ln -s /usr/local/bin/npm /usr/bin/npm

# Expone el puerto
EXPOSE 9615

# Comando de inicio
CMD ["evolution-manager", "server", "start"]
