FROM node:16

# App directory
WORKDIR /app

# Install dependencies
COPY package*.json ./

RUN npm install

# Bundle app 
COPY . .

ENV PORT=8080

EXPOSE 8080

CMD ["npm", "start"]
