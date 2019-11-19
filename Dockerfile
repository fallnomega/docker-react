FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# note /app/build will have the files that will need to copy over


#Run phase for nginx
FROM nginx
#copy build folder over
COPY --from=builder /app/build /usr/share/nginx/html
