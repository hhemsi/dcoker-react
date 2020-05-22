# production dockerfile
FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

CMD ["npm", "run","build"]

# build will be in /app/build
# now the run phase, copy the build from previous
FROM nginx
# copy from previous /app/build to a place where nginx can serve
COPY --from=builder /app/build /usr/share/nginx/html


