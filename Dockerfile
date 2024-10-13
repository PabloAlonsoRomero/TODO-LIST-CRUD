# Imagen Base
FROM nodesource/nsolid

# Crear directorio donde va a vivir mi aplicación
WORKDIR /app

# Copiar el package.json
COPY package*.json ./

# Instalar los Node Modules
RUN npm install

# Copiar archivos de mi local al cotenedor
COPY . .

# Compilar aplicacion
RUN npm run build

# Comando de inicio de contenedor
CMD ["node", "dist/src/index.js"]