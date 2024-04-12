FROM ghcr.io/seisscoped/container-base

LABEL maintainer="Yiyu Ni"

# following is necessary to run as non-root user and
# allow jovyan user from Jupyterhub to access user's directory
# create user scoped and set user home directory
ARG NB_USER="scoped"
ARG NB_UID="1001"
ARG NB_GID="100"
RUN useradd --gid 100 --uid "${NB_UID}" --no-create-home --home-dir "${HOME}" "${NB_USER}"

# change permissions of user home directory to allow jovyan from Jupyterhub
# to write. Necessary to run from Jupyterhub
USER root
RUN chown -R "${NB_USER}":100 "${HOME}"

USER ${NB_UID}
WORKDIR "${HOME}"

RUN pip install noisepy-seis \
    && docker-clean