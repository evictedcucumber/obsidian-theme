# Machine-specific settings such as VAULT live in local.mk (not committed).
-include local.mk

THEME_NAME := $(shell sed -n 's/.*"name": *"\([^"]*\)".*/\1/p' manifest.json)

.PHONY: build
build: ## Build CSS
	sass src/base.scss theme.css --no-source-map --no-charset

.PHONY: snippets
snippets: ## Build CSS for snippets
	sass snippets/src/notion-cards.scss snippets/notion-cards.css --no-source-map
	sass snippets/src/its-frontmatter.scss snippets/its-frontmatter.css --no-source-map
	sass snippets/src/custom-rainbow-colors.scss snippets/custom-rainbow-colors.css --no-source-map
	sass snippets/src/extended-colorschemes.scss snippets/extended-colorschemes.css --no-source-map
	sass snippets/src/floating-search-bar.scss snippets/floating-search-bar.css --no-source-map

.PHONY: install
install: build ## Copy the theme into $(VAULT), alongside any other installed themes
	@test -n "$(VAULT)" || { echo 'Set VAULT, e.g. make install VAULT="/mnt/c/Users/me/Documents/Vault" (or put it in local.mk)'; exit 1; }
	@test -d "$(VAULT)/.obsidian" || { echo '$(VAULT) is not an Obsidian vault'; exit 1; }
	mkdir -p "$(VAULT)/.obsidian/themes/$(THEME_NAME)"
	cp theme.css manifest.json "$(VAULT)/.obsidian/themes/$(THEME_NAME)/"

.PHONY: help
help: ## Display help
	@awk -F ':|##' '/^[^\t].+?:.*?##/ {printf "\033[36m%-30s\033[0m %s\n", $$1, $$NF}' $(MAKEFILE_LIST) | sort
