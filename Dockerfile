# Imagen Base
FROM node

# Crear directorio donde va a vivir mi aplicación
WORKDIR /app

# Copiar el package.json
COPY package*.json ./

# Instalar los Node Modules
RUN npm install

# Descargar el script wait-for-it
ADD https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh /usr/local/bin/wait-for-it.sh
RUN chmod +x /usr/local/bin/wait-for-it.sh

# Copiar archivos de mi local al cotenedor
COPY . .

# Compilar aplicacion
RUN npm run build

# Comando de inicio del contenedor con wait-for-it
CMD ["wait-for-it.sh", "mysql:3306", "--timeout=30", "--strict", "--", "node", "dist/src/index.js"]