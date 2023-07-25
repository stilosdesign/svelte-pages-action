FROM node:16.19.1-slim as base

LABEL "com.github.actions.name"="Svelte to Github Pages"
LABEL "com.github.actions.description"="This Action will build your svelte or any project front-end and deploy it to Github Pages"
LABEL "com.github.actions.author"="StilosDesign"
LABEL "com.github.actions.color"="green"
LABEL "com.github.actions.icon"="play"

LABEL "repository"="http://github.com/stilosdesign/SveltePagesAction"
LABEL "homepage"="https://github.com/stilosdesign/SveltePagesAction"
LABEL "maintainer"="Antoniel Bordin <stilosdesign@hotmail.com>"

RUN apt update
RUN apt install -y git jq

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]