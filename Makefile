SHELL := bash

YS_VERSION := 0.1.82

export YSPATH := $(PWD)/templates

NAME := name-$(shell date +%s)

HELM_YS_PRE := /tmp/helmys
HELM_YS_DIR := .helmys

YS := $(HELM_YS_PRE)/bin/ys-$(YS_VERSION)

test: clean compare

test-install: helm-uninstall helm-install

compare: .original.yaml .manifest.yaml
	diff -q $^
	$(call -------)
	$(call echo-green,*** IT WORKED ***)
	$(call -------)

.manifest.yaml: $(HELM_YS_DIR)
	helm template . | helmys
	$(call -------)

helm-install:
	HELM_YS_OUTPUT=helm-install.yaml helm install $(NAME) . --post-renderer helmys
	$(call -------)

helm-uninstall:
	-helm uninstall $(NAME)
	$(call -------)

diff: .original.yaml .manifest.yaml
	diff -u $^
	$(call -------)

clean:
	$(RM) .manifest.yaml helm-install.yaml
	$(call -------)

realclean: clean
	$(RM) -r $(HELM_YS_DIR) $(HELM_YS_PRE)
	$(call -------)

$(HELM_YS_DIR):
	curl -sL yamlscript.org/helmys | bash
	$(call -------)

define -------
@printf '%.0s-' {1..80} && echo
endef

define echo-green
@echo -e "\e[32m$1\e[0m"
endef
