This file is auto-included from the nginx { } directive, making it one of the highest-level auto-includes in nginx.conf.

Multiple files may be housed here. In particular:

	default.conf: This file is auto-generated by dockergen which listens to the docker daemon for container events. When containers are activated or de-activated, vhosts are created and removed in this file automatically. It is *completely* unrelated to php-fpm and wordpress containers. To be auto-generated into this file, a new container should have the -e "VIRTUAL_HOST=domain.org" environment variable. For more information see https://github.com/jwilder/nginx-proxy and https://github.com/jwilder/docker-gen

	default_site.conf: Defines the default ISP webhome and _; (unmatchable) vhosts which probably have or require special parameters.

	Any upstream { } directives refering to external sites should also be defined here for use by other vhosts if those vhosts are HTTP proxies and should take the form upstream-$name.conf. We include one by default: upstream-archives.conf, which sends traffic to the archive host.