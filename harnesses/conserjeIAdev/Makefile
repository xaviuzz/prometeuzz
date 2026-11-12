HARNESS := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
REPO    := $(abspath $(HARNESS)../../Sandbox/conserjeIAdev)
CACHE   := $(HOME)/.cache/conserjeIAdev
IMAGE   := conserjeiadev-build

RUN := docker run --rm \
	--user $(shell id -u):$(shell id -g) \
	-e HOME=/cache -e GRADLE_USER_HOME=/cache/gradle \
	-v $(REPO):/workspace -v $(CACHE):/cache \
	$(IMAGE)

# gradle.properties pins org.gradle.java.home to another machine; the command line wins.
GRADLE := ./gradlew -Dorg.gradle.java.home=/opt/java/openjdk

.PHONY: image test build clean shell

image:
	docker build -t $(IMAGE) $(HARNESS)

$(CACHE):
	mkdir -p $(CACHE)

test: $(CACHE)
	$(RUN) $(GRADLE) testDebugUnitTest

build: $(CACHE)
	$(RUN) $(GRADLE) assembleDebug

clean: $(CACHE)
	$(RUN) $(GRADLE) clean

shell: $(CACHE)
	docker run --rm -it --user $(shell id -u):$(shell id -g) \
		-e HOME=/cache -e GRADLE_USER_HOME=/cache/gradle \
		-v $(REPO):/workspace -v $(CACHE):/cache $(IMAGE) bash
