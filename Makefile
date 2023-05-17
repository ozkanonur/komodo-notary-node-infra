.SILENT:

_IF_PODMAN := $(shell command -v podman 2> /dev/null)

define container-tool
	$(if $(_IF_PODMAN), podman, docker)
endef

CONTAINER_NAME = komodod
IMAGE_TAG = latest

build-komodod-container:
	$(call container-tool) build -t $(IMAGE_TAG) -f .containers/Containerfile.komodo .