FROM node:lts-stretch-slim
COPY recap.dev-backend/dist/index.js index.js
RUN mkdir public
COPY recap.dev-ui/build public
ENTRYPOINT node index.js
