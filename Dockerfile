FROM node:20-alpine as builder
WORKDIR /app

# Installa le dipendenze
COPY package.json package-lock.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM node:20-alpine as runner
WORKDIR /app

# Copia i file necessari
COPY --from=builder /app/build /app/build
COPY --from=builder /app/package.json /app/package.json
COPY --from=builder /app/node_modules /app/node_modules

# Installa serve per eseguire l'applicazione
RUN npm install -g serve

EXPOSE 3000
CMD ["node", "build"]