# Etapa 1: Construção da aplicação
FROM node:22 AS build

# Definir diretório de trabalho dentro do container
WORKDIR /app

# Copiar arquivos do projeto para o container
COPY package*.json ./

# Instalar as dependências
RUN npm install

# Copiar o restante do código da aplicação
COPY . .

# Rodar o build da aplicação
RUN npm run build

# Etapa 3: Servir a aplicação com Vite para o preview em modo desenvolvimento
FROM node:22 AS preview

# Definir diretório de trabalho
WORKDIR /app

# Copiar os arquivos do projeto para o container
COPY package*.json ./

# Instalar as dependências
RUN npm install

# Copiar o restante do código da aplicação
COPY . .

# Expor a porta 5173 para o preview do Vite
EXPOSE 4173

# Rodar o Vite no modo de desenvolvimento (preview)
CMD ["npm", "run", "preview","--host"]
