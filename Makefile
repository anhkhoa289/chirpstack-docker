import-lorawan-devices:
	docker-compose run --rm --entrypoint sh --user root chirpstack -c '\
		apk add --no-cache git && \
		git clone https://github.com/brocaar/lorawan-devices /tmp/lorawan-devices && \
		chirpstack -c /etc/chirpstack import-legacy-lorawan-devices-repository -d /tmp/lorawan-devices'

gen-pass:
	docker run \
  --entrypoint htpasswd \
  httpd:2 -Bbn company Abcd1234- > auth/htpasswd

gen-traefik-auth:
	docker run \
  --entrypoint htpasswd \
  httpd:2 -Bbn khoa i5dEovjW9^70f4 > traefik-users

login:
  aws ecr get-login-password | docker login --username AWS --password-stdin 902637028063.dkr.ecr.ap-southeast-1.amazonaws.com
