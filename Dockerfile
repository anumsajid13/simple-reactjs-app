
FROM node:14-alpine

WORKDIR /simple-reactjs-app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build


CMD ["npm", "start"]
