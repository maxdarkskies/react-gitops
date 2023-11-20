FROM node:14 as bulder
WORKDIR /app
COPY public/ /app/public
COPY src/ /app/src
COPY package.json /app/
RUN npm install
CMD ["npm", "start"]
EXPOSE 3000
# FROM nginx:alpine

# # Remove the default Nginx contents
# RUN rm -rf /usr/share/nginx/html/*
# # Copy the built app from the builder stage to the nginx public directory
# COPY --from=bulder /app/build /usr/share/nginx/html
# EXPOSE 80

# CMD ["nginx", "-g", "daemon off;"]