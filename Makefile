name = inception
all:
	printf "Launch configuration ${name}..."
	mkdir -p ~/data
	mkdir -p ~/data/wordpress
	mkdir -p ~/data/database
	docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up

build:
	printf "Building configuration ${name}..."
	mkdir -p ~/data
	mkdir -p ~/data/wordpress
	mkdir -p ~/data/database
	docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up --build

down:
	printf "Stop configuration ${name}..."
	docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env down

fclean:
	printf "Total clean of all configurations docker"
	@if [ -n "$$(docker ps -qa)" ]; then \
        docker stop $$(docker ps -qa); \
    else \
        echo "No running containers to stop."; \
    fi
	docker system prune --all --force --volumes
	docker volume prune --force
	docker network prune --force
	sudo rm -rf /home/jrasser/data

clean:
	printf "Cleaning configuration ${name}..."
	docker system prune -a
	sudo rm -rf /home/jrasser/data

re:	fclean all


eval:
	docker stop $$(docker ps -qa); docker rm $$(docker ps -qa); docker rmi -f $$(docker images -qa); docker volume rm $$(docker volume ls -q); docker network rm $$(docker network ls -q) 2>/dev/null

.PHONY	: all build down re clean fclean
