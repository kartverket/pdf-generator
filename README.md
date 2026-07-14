# PDF konvertering mikrotjeneste


## Kjør med Docker Compose

```zsh
docker compose up --build
```

- API: http://localhost:8089
- Helsesjekk: http://localhost:8089/health

## Eller bygg og kjør direkte

```zsh
docker build -t matrikkel-gotenberg .
docker run --rm -p 8089:8089 matrikkel-gotenberg
```
