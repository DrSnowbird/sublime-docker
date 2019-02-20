FROM openkbs/jdk-mvn-py3-x11

MAINTAINER DrSnowbird "DrSnowbird@openkbs.org"

ARG INSTALL_DIR=${INSTALL_DIR:-/opt}

############################# 
#### ---- Install Sublime ----
############################# 

WORKDIR ${INSTALL_DIR}

# https://download.sublimetext.com/sublime_text_3_build_3176_x64.tar.bz2
ARG SUBLIME_VER=${SUBLIME_VER:-3176}
ARG SUBLIME_TGZ=${SUBLIME_TGZ:-sublime_text_3_build_${SUBLIME_VER}_x64.tar.bz2}
ARG SUBLIME_URL=${SUBLIME_URL:-https://download.sublimetext.com/${SUBLIME_TGZ}}

ARG SUBLIME_DIR=${SUBLIME_DIR:-sublime_text_3}
ENV SUBLIME_DIR=${SUBLIME_DIR}

ARG SUBLIME_EXE=${SUBLIME_EXE:-${INSTALL_DIR}/${SUBLIME_DIR}/sublime_text}
ENV SUBLIME_EXE=${SUBLIME_EXE}

RUN sudo apt-get update -y && \
    sudo apt-get install gtk+3.0 -y && \
    sudo wget -q -c ${SUBLIME_URL} && \
    sudo tar -vxjf ${SUBLIME_TGZ} && \
    sudo rm ${SUBLIME_TGZ}
    
RUN ls -al ${INSTALL_DIR}/${SUBLIME_DIR} && \
    ls -al ${TARGET_HOME} && \
    mkdir -p ${HOME}/.config/sublime-text-3/Packages/User ${HOME}/data ${HOME}/workspace ${HOME}/workspace/example && \
    ls -al ${HOME}/.config

COPY editors/blog-for-sublime/blog* ${HOME}/.config/sublime-text-3/Packages/User/
COPY example/*.blog ${HOME}/example/

RUN ls -al ${HOME}/workspace && \
    sudo /bin/chown -R ${USER_ID}:${USER_ID} ${HOME}/.config ${HOME}/data ${HOME}/workspace && \
    ls -al ${HOME}/.config/sublime-text-3/Packages/User/ && \
    find ${HOME}/.config && \
    find ${HOME}/workspace

############################# 
#### ---- Workspace setup ----
############################# 
USER "developer"

VOLUME "${HOME}/data"
VOLUME "${HOME}/workspace"
VOLUME "${HOME}/.config"

WORKDIR ${HOME}/workspace

#RUN echo $HOME
CMD "${SUBLIME_EXE}" "${HOME}/example/burglary.blog"
#CMD "${SUBLIME_EXE}" 
