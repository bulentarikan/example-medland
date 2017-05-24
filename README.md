# Dockerized Medland MML-Lite script

## Installation Instructions

In order to run this model [docker](https://docs.docker.com/engine/installation/) and [docker-compose](https://docs.docker.com/compose/install/) need to be installed. Please see the links for details.

## Build Instructions

```bash
% docker-compose build
```

## Run Instructions

```bash
% docker-compose up -d
% docker-compose exec --user=ubuntu grass bash run.sh
```
