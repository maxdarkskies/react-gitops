FROM node:14 as bulder

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

FROM nginx:latst

WORKDIR /usr/share/nginx/html

COPY --from=build /app ./

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]