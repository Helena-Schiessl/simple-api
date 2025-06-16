# Usa imagem oficial do Node.js
FROM node:18

# Cria e define o diretório de trabalho
WORKDIR /app

# Copia os arquivos de dependência
COPY package*.json ./

# Instala as dependências
RUN npm install

# Copia todo o restante do código
COPY . .

# Expõe a porta definida na variável de ambiente API_PORT
EXPOSE 3000

# Comando para iniciar a API
CMD ["npm", "run", "start"]
