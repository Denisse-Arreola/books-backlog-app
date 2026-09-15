
# base image
FROM node:24.16.0

# workspace directory
WORKDIR /app

# angular cli according to the project version
RUN npm install -g @angular/cli@22.0.1

# rollup for compiling
RUN npm install -g rollup

# install dependencies
COPY package*.json ./
RUN rm -rf node_modules
RUN npm install
RUN npm install rollup --save-dev

# project files copy
COPY . .

# run angular serve
CMD ["ng", "serve", "--host", "0.0.0.0"]