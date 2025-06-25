# Usa imagem oficial do Node.js
FROM node:18

# Cria diretório de trabalho dentro do container
WORKDIR /app

# Copia os arquivos de dependência
COPY package*.json ./

# Instala as dependências
RUN npm install

# Copia todo o restante do código para dentro do container
COPY . .

# Expõe a porta 3000
EXPOSE 3000

# Comando para rodar a aplicação
CMD ["node", "src/index.js"]
