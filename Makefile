
ENV_VARS='$${AUTHX_HOST} $${AUTHX_PORT} $${ORG_HOST} $${ORG_PORT} $${EMP_HOST} $${EMP_PORT}'
OPENRESTY_TEMP=client_body_temp fastcgi_temp proxy_temp scgi_temp uwsgi_temp

clean:
	rm -rf nginx.conf
	
distclean:
	rm -rf nginx.conf logs $(OPENRESTY_TEMP)

conf:
	envsubst $(ENV_VARS) < nginx-template.conf > nginx.conf

run:
	-mkdir logs
	openresty -p $(PWD) -c nginx.conf
	
stop:
	openresty -s stop
	
reload:
	openresty -s reload
