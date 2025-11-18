FROM node:18

WORKDIR /app
COPY . .

# Nhận variables từ Render (SESSION_SECRET)
ARG SESSION_SECRET
ENV SESSION_SECRET=${SESSION_SECRET}

# Tạo file .env nếu thiếu
RUN echo "SESSION_SECRET=${SESSION_SECRET}" > .env

RUN npm install && npm run build

CMD ["npm", "start"]
