FROM node:alpine
WORKDIR '/var/fe_app/'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=0 /var/fe_app/build /usr/share/nginx/html