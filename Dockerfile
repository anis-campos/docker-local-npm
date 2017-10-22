FROM node:8.7.0

ENV USER=node USER_ID=1000 USER_GID=1000

COPY entrypoint.sh /
RUN  chmod u+x entrypoint.sh

USER node

RUN  mkdir /home/node/.npm-global
ENV PATH=/home/node/.npm-global/bin:$PATH
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global

RUN npm i -g npm 
RUN npm i -g local-npm

EXPOSE 5080

VOLUME /npm-data

ENTRYPOINT ["/entrypoint.sh"]

CMD ["local-npm","-d", "/npm-data"]
