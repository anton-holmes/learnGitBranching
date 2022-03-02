FROM node:10
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt install yarn -y
WORKDIR /app
COPY . .
RUN yarn install
RUN yarn gulp fastBuild
RUN yarn gulp build


FROM nginx:latest
COPY . /usr/share/nginx/html/

