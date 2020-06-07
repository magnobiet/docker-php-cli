# 🐳 PHP CLI

> PHP CLI Docker image with MySQL and Postgres client

## Build

```bash
docker build . -t magnobiet/php:7.4-cli-alpine
```

## Publish

```bash
docker login
docker push magnobiet/php:7.4-cli-alpine
```

## Setup

### `.bash_functions`

```bash
function __php() {

  docker run \
    --rm \
    --interactive \
    --user $(id -u):$(id -g) \
    --volume /etc/passwd:/etc/passwd:ro \
    --volume /etc/group:/etc/group:ro \
    --volume $(pwd):/app \
    --workdir /app \
    --network host \
    magnobiet/php:7.4-cli-alpine \
    php "$@"

}

function __php_composer() {

  docker run \
    `tty -s && tty=--tty` \
    --interactive \
    --rm \
    --user $(id -u):$(id -g) \
    --network host \
    --volume /etc/passwd:/etc/passwd:ro \
    --volume /etc/group:/etc/group:ro \
    --volume $(pwd):/app \
    composer "$@"

}
```

### `.bash_aliases`

```bash
alias php='__php'
alias composer='__php_composer'
```

## License

This project is licensed under the [MIT License](https://magno.mit-license.org/2018). Copyright © Magno Biét
