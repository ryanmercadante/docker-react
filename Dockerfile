###################
### BUILD PHASE ###
###################
FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN yarn
COPY . .
CMD [ "yarn", "build" ]

#################
### RUN PHASE ###
#################
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
