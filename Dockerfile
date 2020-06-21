FROM node:12.14.0-alpine3.11

#a linha abaixo serve p rodar o bash dentro dessa img p gente 
#poder trabalhar ali acessando o container e rodando cmd la 
#dentro. essa img vai ter um usuario chamado de node. a gente 
#vai trabalhar em  /home/node/app e na pasta app vamos colocar 
#a nossa aplicacao.
RUN apk add --no-cache bash

#config NAO-OBRIGATORIA p criar uma pasta p armazenar o cache do 
#node dentro do nosso proprio proj, pq depois, das prox vezes q 
#rodar o projeto c npm install, ele n vai buscar num cache do 
#container q posso mata-lo a qualquer momento, ele vai buscar do 
#cache persistido no proprio projeto. apenas agilizar.
RUN npm config set cache /home/node/app/.npm-cache --global

#como vamos usar nest, precisamos instala-lo de forma global
RUN npm i -g @nestjs/cli@7.4.0

#p n usar o root, p n ser necessario colocar comando sudo em td
USER node

WORKDIR /home/node/app