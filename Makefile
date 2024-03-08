up :
		docker compose -f ./srcs/docker-compose.yml up  --build

down:
		docker-compose -f ./srcs/docker-compose.yml down --rmi all

re:		down 
		docker system prune -af
		$(MAKE) up

.PHONY: up down re