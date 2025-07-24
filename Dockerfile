FROM node:20-alpine as builder
WORKDIR /app

# Installa le dipendenze con cache ottimizzata
COPY package.json package-lock.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM nginx:alpine
# Percorso corretto per l'output di SvelteKit
COPY --from=builder /app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80