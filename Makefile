SHELL := bash

YS_DIR := charts/yamlscript
export YSPATH := $(YS_DIR)

test: .original.yaml .manifest.yaml
	@echo
	diff -q $^
	@echo
	@echo -e "\e[32m*** IT WORKED ***\e[0m"

.manifest.yaml:
	@echo
	helm template . | ys -Ys - > $@

clean:
	$(RM) .manifest.yaml
