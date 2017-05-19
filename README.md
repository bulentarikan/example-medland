# example-medland-initial

## Build Instructions

```bash
docker-compose build
```

## Run Instructions

```bash
docker-compose up -d
docker-compose exec --user=ubuntu grass bash run.sh years=200 prfx=sim
```

This should give a syntax error message about an unexpected parenthesis
