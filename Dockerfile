FROM node:alpine as aplha
WORKDIR /var/ap
COPY package.json .
RUN npm instal
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=alpha /var/app/build /usr/share/nginx/html