LOGSTASH_CERT_PATH=/var/www/logstash
SSL_HOSTNAME=*
APP_PORT=80

start: generate-ssl
	@rm -rf /etc/nginx/sites-enabled/default
	@if [ "$(KIBANA_SECURE)" = "True" ]; then \
		htpasswd -b -c /etc/nginx/conf.d/.htpasswd $(KIBANA_USER) $(KIBANA_PASS) && \
		ln -n /etc/nginx/sites-available/kibana-basic-auth /etc/nginx/sites-enabled/default \
	; fi
	@if [ "$(KIBANA_SECURE)" != "True" ]; then \
		ln -n /etc/nginx/sites-available/kibana-insecure /etc/nginx/sites-enabled/default \
	; fi
	@ln -n /etc/nginx/sites-available/logstash /etc/nginx/sites-enabled/logstash
	supervisord

generate-ssl:
	@echo "Generating SSL Certificate"
	@mkdir -p $(LOGSTASH_CERT_PATH)
	@openssl req -subj '/CN=$(SSL_HOSTNAME)/' -x509 -batch -nodes -newkey rsa:2048 -keyout $(LOGSTASH_CERT_PATH)/logstash.key -out $(LOGSTASH_CERT_PATH)/logstash.crt -days 365

open-browser: export PORT=$(shell fig port app $(APP_PORT) | sed 's/^.*:\([0-9][0-9]*\)$\/\1/')
open-browser:
	open http://$(shell boot2docker ip 2>/dev/null):$(PORT)
