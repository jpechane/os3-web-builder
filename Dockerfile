FROM ubuntu:latest
EXPOSE 8080 8443
USER 0
RUN 	apt-get update && \
	apt-get -y install git rake ruby-dev make g++ apache2 vim && \
	apt-get clean && \
	gem install awestruct bundler bootstrap-sass
RUN	mkdir -p /apache2/lock && \
	mkdir -p /apache2/log && \
	mkdir -p /apache2/www && \
	cp -r /etc/apache2 /apache2/etc && \
	chmod -R 777 /apache2 && \
	sed -i '/User /d' /apache2/etc/apache2.conf && \
	sed -i '/Group /d' /apache2/etc/apache2.conf && \
	sed -i 's/Listen 80/Listen 8080/' /apache2/etc/ports.conf && \
	sed -i 's/.*Listen 443/Listen 8443/' /apache2/etc/ports.conf && \
	rm -rf /var/www/html && \
	ln -s /apache2/www /var/www/html
COPY scripts/run-apache2.sh /apache2/run.sh
USER 1000
CMD bash /apache2/run.sh
