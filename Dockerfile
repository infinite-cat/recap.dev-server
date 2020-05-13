FROM node:latest
COPY backend/dist/index.js index.js
RUN mkdir public
COPY ui/build public
ENTRYPOINT node index.js
