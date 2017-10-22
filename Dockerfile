FROM node:alpine

RUN mkdir /npm-data && chown node: /npm-data && chmod 777 /npm-data

USER node

RUN  mkdir /home/node/.npm-global
ENV PATH=/home/node/.npm-global/bin:$PATH
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global

RUN npm i -g npm 
RUN npm i -g local-npm

EXPOSE 5080

VOLUME /npm-data

ENTRYPOINT ["local-npm"]

CMD ["-d", "/npm-data"]
