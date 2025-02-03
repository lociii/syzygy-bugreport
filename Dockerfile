FROM debian:bookworm

ENV PYTHONUNBUFFERED 1
ENV LC_ALL=C.UTF-8
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update && apt-get -y install \
      build-essential \
      gcc \
      python3-venv \
      python3-dev \
      libffi-dev \
      libssl-dev \
    && \
    apt-get clean && \
    mkdir /app && \
    useradd -m app

USER app

WORKDIR /app

ENV PATH /home/app/venv/bin:${PATH}

RUN python3 -m venv ~/venv && \
    pip install --upgrade pip && \
    pip install wheel psycopg-binary Django django-syzygy

ENV DJANGO_SETTINGS_MODULE bugreport.settings

EXPOSE 8000
