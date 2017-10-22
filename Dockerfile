FROM node:alpine

RUN npm i -g npm && npm i -g local-npm

EXPOSE 5080

VOLUME /npm-data

ENTRYPOINT ["local-npm"]

CMD ["-d", "/npm-data"]
