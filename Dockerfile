FROM node:14 as bulder

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

FROM nginx:alpine

# Remove the default Nginx contents
RUN rm -rf /usr/share/nginx/html/*

# Copy the built app from the builder stage to the nginx public directory
COPY --from=build-step /app/build /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]