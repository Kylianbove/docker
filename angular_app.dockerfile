FROM node:latest as build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY ./ .
RUN npm run build

FROM nginx:latest
RUN mkdir /app
COPY --from=build /app/dist/my-app/ /app
COPY nginx.conf /etc/nginx/conf.d/default.conf

