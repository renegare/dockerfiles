SSL_HOSTNAME=*

generate-ssl:
	@echo "Generating SSL Certificate"
	openssl req -subj '/CN=$(SSL_HOSTNAME)/' -x509 -batch -nodes -newkey rsa:2048 -keyout logstash.key -out logstash.crt -days 365

test-logging:
	@echo "Uploading SSL Certificates to S3"

upload-certificates:
	@echo "Uploading SSL Certificates to S3"

start:
	@rm -rf /etc/nginx/sites-enabled/default
	@if [ "$(KIBANA_SECURE)" = "True" ]; then \
		htpasswd -b -c /etc/nginx/conf.d/.htpasswd $(KIBANA_USER) $(KIBANA_PASS) && \
		ln -n /etc/nginx/sites-available/basic-auth /etc/nginx/sites-enabled/default \
	; fi
	@if [ "$(KIBANA_SECURE)" != "True" ]; then \
		ln -n /etc/nginx/sites-available/insecure /etc/nginx/sites-enabled/default \
	; fi
	@echo "Starting supervisord ..."
	@/usr/bin/supervisord

open-browser: export PORT=$(shell fig port app 80 | sed 's/^.*:\([0-9][0-9]*\)$\/\1/')
open-browser:
	open http://$(shell boot2docker ip 2>/dev/null):$(PORT)

ngrok: export PORT=$(shell fig port app 80 | sed 's/^.*:\([0-9][0-9]*\)$\/\1/')
ngrok:
	ngrok -subdomain=$(shell basename `pwd`)-`whoami` `boot2docker ip`:$(PORT)
