FROM node:14 as bulder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . /app
RUN npm run build
EXPOSE 3000
# FROM nginx:alpine

# # Remove the default Nginx contents
# RUN rm -rf /usr/share/nginx/html/*
# # Copy the built app from the builder stage to the nginx public directory
# COPY --from=bulder /app/build /usr/share/nginx/html
# EXPOSE 80

# CMD ["nginx", "-g", "daemon off;"]