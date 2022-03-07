FROM node:12 as base
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
WORKDIR /app
COPY . .
RUN yarn install
RUN yarn gulp fastBuild
RUN yarn gulp build


FROM nginx:alpine
COPY --from=base ./app /usr/share/nginx/html/
