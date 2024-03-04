# connect-apigw
API Gateway for Connect

## Installing dependencies

```
$ brew install openresty/brew/openresty
```

## Generating default.conf
`default.conf` is the main file to be used by OpenResty. In its default image, OpenResty looks for `nginx.conf` in `/usr/local/openresty/nginx/conf/nginx.conf`. This `nginx.conf` contains `include` directive that reads configuration files in `/etc/nginx/conf.d/` directory.

### For local environment
```
$ source scripts/env-local.sh
$ make conf
```

### For docker environment
```
$ source scripts/env-docked.sh
$ make conf
```

## Generating apigw docker image
```
$ make docker-build
```

## Running

### For local environment
```
$ make run
```

### For docker environment
```
$ docker compose up
```