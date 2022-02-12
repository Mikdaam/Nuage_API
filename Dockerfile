FROM node:16

# App directory
WORKDIR /app

# Install dependencies
COPY package*.json ./

RUN npm install
# RUN npm install --only=production for the production build
# ARG NODE_ENV
# RUN if [ "$NODE_ENV" = "production" ]; \
#         then npm install --only=production; fi \
#         else npm install; \
#     fi

# Bundle app 
COPY . .

ENV PORT 8080

EXPOSE $PORT

CMD ["npm", "run", "dev"]

# to load env file
# docker run -v %cd%:/app -v /app/node_modules --env-file ./.env -d --name nuage-docker-node-app nuage-docker-node-app
