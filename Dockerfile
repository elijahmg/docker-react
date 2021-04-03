FROM node:15.13.0-alpine3.10

WORKDIR '/app'

COPY package.json .
RUN yarn

COPY . .

RUN yarn build


FROM nginx

COPY --from=0 /app/build /usr/share/nginx/html

