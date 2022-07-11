build:
	sudo docker compose -f infra/docker-compose.yaml up

rebuild:
	sudo docker compose -f infra/docker-compose.yaml up -d --build

migrate:
	sudo docker compose -f infra/docker-compose.yaml exec web python3 manage.py makemigrations reviews
	sudo docker compose -f infra/docker-compose.yaml exec web python3 manage.py migrate

createsuperuser:
	sudo docker compose -f infra/docker-compose.yaml exec web python3 manage.py createsuperuser

collectstatic:
	sudo docker compose -f infra/docker-compose.yaml exec web python3 manage.py collectstatic --no-input

import_csv:
	sudo docker compose -f infra/docker-compose.yaml exec web python3 manage.py import_csv

dumpdb:
	sudo docker compose -f infra/docker-compose.yaml exec web python manage.py dumpdata > fixtures.json

down:
	sudo docker compose -f infra/docker-compose.yaml  down -v