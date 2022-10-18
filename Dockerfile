# syntax = docker/dockerfile:1.2

FROM rocker/binder:4.2.1

ENV RENV_PATHS_ROOT=/renv
RUN Rscript --vanilla -e "install.packages(\"renv\", repos = \"https://cloud.r-project.org/\")"

COPY renv.lock ${HOME}

USER root
RUN --mount=type=cache,target=/renv Rscript -e "renv::restore()"

USER rstudio
