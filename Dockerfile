FROM node:8.7.0

ENV USER=myuser USER_ID=1000 USER_GID=1000

# now creating user
RUN groupadd --gid "${USER_GID}" "${USER}" && \
    useradd \
      --uid ${USER_ID} \
      --gid ${USER_GID} \
      --create-home \
      --shell /bin/bash \
      ${USER}

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
