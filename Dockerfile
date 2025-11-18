FROM node:18-alpine

WORKDIR /app

# copy package files first to leverage cache
COPY package*.json ./
RUN npm ci --production

# copy rest
COPY . .

# build the remix app
RUN npm run build

EXPOSE 3000
CMD ["node", "server.js"]
