NAME=mpd
VERSION=1.0
IMAGE_NAME=$(NAME):$(VERSION)
DATA_DIR=/usr/local/media/Music
CONTAINER_DATA_DIR=/var/lib/mpd/music
PORTS=6600
build-image:
	docker build -t $(IMAGE_NAME) .

run-foreground:
	docker run -it --rm --hostname $(NAME)-$(VERSION) -v $(DATA_DIR):/$(CONTAINER_DATA_DIR):ro -p $(PORTS):$(PORTS) $(IMAGE_NAME)
run-daemonize:
	docker run -d --hostname $(NAME)-$(VERSION) --name $(NAME) -v $(DATA_DIR):/$(CONTAINER_DATA_DIR):ro -p $(PORTS):$(PORTS) $(IMAGE_NAME)
