SSL_HOSTNAME=*

generate-ssl:
	@echo "Generating SSL Certificate"
	openssl req -subj '/CN=$(SSL_HOSTNAME)/' -x509 -batch -nodes -newkey rsa:2048 -keyout logstash.key -out logstash.crt -days 365

test-logging:
	@echo "Uploading SSL Certificates to S3"

upload-certificates:
	@echo "Uploading SSL Certificates to S3"

start:
	@echo "Creating htpasswd file and starting supervisord ..."
	@htpasswd -b -c /etc/nginx/conf.d/.htpasswd $(KIBANA_USER) $(KIBANA_PASS)
	@/usr/bin/supervisord

open-browser: export PORT=$(shell fig port app 80 | sed 's/^.*:\([0-9][0-9]*\)$\/\1/')
open-browser:
	open http://$(shell boot2docker ip 2>/dev/null):$(PORT)

ngrok: export PORT=$(shell fig port app 80 | sed 's/^.*:\([0-9][0-9]*\)$\/\1/')
ngrok:
	ngrok -subdomain=$(shell basename `pwd`)-`whoami` `boot2docker ip`:$(PORT)
