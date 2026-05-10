PID_FILE := .mkdocs.pid
LOG_FILE := .mkdocs.log
HOST     := 127.0.0.1
PORT     := 8003

export DISABLE_MKDOCS_2_WARNING := true

.PHONY: serve start stop build install clean help

help: ## Afficher cette aide
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2}'
	@echo ""

serve: ## Lancer la doc en foreground (Ctrl+C pour arrêter)
	uv run mkdocs serve --dev-addr $(HOST):$(PORT)

start: ## Lancer la doc en background
	@if [ -f $(PID_FILE) ] && kill -0 $$(cat $(PID_FILE)) 2>/dev/null; then \
		echo "MkDocs tourne déjà (PID $$(cat $(PID_FILE))) — http://$(HOST):$(PORT)"; \
	else \
		uv run mkdocs serve --dev-addr $(HOST):$(PORT) > $(LOG_FILE) 2>&1 & \
		echo $$! > $(PID_FILE); \
		echo "MkDocs démarré (PID $$(cat $(PID_FILE))) — http://$(HOST):$(PORT)"; \
		echo "Logs : $(LOG_FILE)"; \
	fi

stop: ## Arrêter la doc lancée en background
	@if [ -f $(PID_FILE) ]; then \
		PID=$$(cat $(PID_FILE)); \
		if kill -0 $$PID 2>/dev/null; then \
			kill $$PID && echo "MkDocs arrêté (PID $$PID)"; \
		else \
			echo "Processus $$PID introuvable (déjà arrêté ?)"; \
		fi; \
		rm -f $(PID_FILE); \
	else \
		echo "Aucun PID enregistré — MkDocs ne tourne pas en background"; \
	fi

build: ## Construire le site statique dans site/
	uv run mkdocs build

install: ## Installer les dépendances (crée/met à jour le venv via uv)
	uv sync

clean: ## Supprimer les artefacts générés (site/, logs, pid)
	rm -rf site/ $(LOG_FILE) $(PID_FILE)
