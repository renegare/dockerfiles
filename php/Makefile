version:
	@echo nginx.$$(nginx -v 2>&1 | sed 's/[^0-9\.]//g').php.$$(php -v | grep -m1 PHP | sed -E 's/PHP\s+([0-9\.]+)\s+.+/\1/g')

modules:
	@nginx -v
	@php -v
	@php -m
	@composer -V
