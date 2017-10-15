service=web
command=ls
args=

compose:
	docker-compose build
	docker-compose up

build:
	docker build .

run:
	$(MAKE) compose/exec service=web command=php args=/opt/app/main.php

redis:
	$(MAKE) compose/exec service=redis command=redis-cli args="get xxx"

compose/exec:
	docker-compose exec $(service) $(command) $(args)
