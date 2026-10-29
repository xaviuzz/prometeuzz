export PATH := /home/xaviuzz/.local/share/node18/node_modules/node/bin:$(PATH)

.PHONY: install build test check fix watch web

install:
	pnpm install --frozen-lockfile

build:
	pnpm build

test: build
	pnpm test

check:
	pnpm check:all

fix:
	pnpm fix:all

watch:
	pnpm watch

web:
	pnpm run-in-browser
