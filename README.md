# Dockerized Medland MML-Lite script

## Build Instructions

```bash
% docker-compose build
```

## Run Instructions

```bash
% docker-compose up -d
% docker-compose exec --user=ubuntu grass bash run.sh years=200 prfx=sim
```

Currently generates an unexpected parenthesis syntax error related to running `r.mapcalc`, see [issue #1](https://github.com/comses/example-medland/issues/1)
