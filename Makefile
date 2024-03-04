PROJECT_NAME=connect-apigw
VERSION=0.1.0
IMAGE_NAME=ghcr.io/mrexmelle/$(PROJECT_NAME)
ENV_VARS='$${AUTHX_HOST} $${AUTHX_PORT} $${ORG_HOST} $${ORG_PORT} $${EMP_HOST} $${EMP_PORT}'
OPENRESTY_TEMP=client_body_temp fastcgi_temp proxy_temp scgi_temp uwsgi_temp

clean:
	rm -rf default.conf
	
distclean:
	rm -rf default.conf logs $(OPENRESTY_TEMP)

docker-build:
	docker build -t $(IMAGE_NAME):$(VERSION) .

docker-push:
	docker push $(IMAGE_NAME):$(VERSION)

conf:
	envsubst $(ENV_VARS) < default-template.conf > default.conf

run:
	-mkdir logs
	openresty -p $(PWD) -c nginx.conf
	
stop:
	openresty -s stop
	
reload:
	openresty -s reload
