FROM node:14-alpine as build
COPY package*.json ./
RUN npm install && npm cache clean --force
COPY . .
RUN npm run build

FROM node:14-alpine as release
COPY --from=build package*.json ./
RUN npm install
COPY --from=build ./dist ./dist
EXPOSE 4000
ENTRYPOINT [ "node","/dist/main.js" ]

