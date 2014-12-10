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
