FROM node:4

RUN npm install -g local-npm

EXPOSE 5080

VOLUME /npm-data

ENTRYPOINT ["local-npm"]

CMD ["-d", "/npm-data"]
