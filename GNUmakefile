.PHONY: help install-laravel build clean

LARAVEL_DIR=laravel
CONTAINER_NAME=php85

help:
	@echo "Uso:"
	@echo "  make <objetivo>"
	@echo ""
	@echo "Objetivos disponibles:"
	@echo "  install-laravel   Instala Laravel en ./laravel, configura .env, instala dependencias y corre migraciones."
	@echo "  build             Construye los contenedores Docker."
	@echo "  clean             Elimina los contenedores y la carpeta ./laravel."

install-laravel:
	@if [ ! -d "$(LARAVEL_DIR)" ]; then \
		echo "→ Descargando Laravel en ./$(LARAVEL_DIR)..."; \
		docker run --rm -v "$$PWD":/app -w /app composer create-project laravel/laravel $(LARAVEL_DIR) --no-interaction; \
	fi

	@echo "→ Corrigiendo permisos completos de la carpeta Laravel..."
	@sudo chown -R $$(id -u):$$(id -g) $(LARAVEL_DIR)

	@echo "→ Copiando archivo .env..."
	@cp -n $(LARAVEL_DIR)/.env.example $(LARAVEL_DIR)/.env || true

	@echo "→ Configurando .env con datos de conexión MySQL..."
	@chmod u+w $(LARAVEL_DIR)/.env
	@sed -i 's/^.*DB_CONNECTION=.*/DB_CONNECTION=mysql/' $(LARAVEL_DIR)/.env
	@sed -i 's/^.*DB_HOST=.*/DB_HOST=mysql/' $(LARAVEL_DIR)/.env
	@sed -i 's/^.*DB_PORT=.*/DB_PORT=3306/' $(LARAVEL_DIR)/.env
	@sed -i 's/^.*DB_DATABASE=.*/DB_DATABASE=laravel/' $(LARAVEL_DIR)/.env
	@sed -i 's/^.*DB_USERNAME=.*/DB_USERNAME=laravel/' $(LARAVEL_DIR)/.env
	@sed -i 's/^.*DB_PASSWORD=.*/DB_PASSWORD=secret/' $(LARAVEL_DIR)/.env


	@echo "→ Construyendo contenedores..."
	docker compose build

	@echo "→ Instalando dependencias con Composer..."
	docker compose run --rm $(CONTAINER_NAME) composer install --ignore-platform-reqs

	@echo "→ Generando clave de aplicación..."
	docker compose run --rm $(CONTAINER_NAME) php artisan key:generate

	@echo "→ Ejecutando migraciones..."
	docker compose run --rm $(CONTAINER_NAME) php artisan migrate

	@echo "✔ Laravel está listo en http://localhost:8000"

build:
	@echo "→ Construyendo imagen PHP 8.5..."
	docker compose build

	# @echo "→ Corrigiendo permisos de la carpeta $(LARAVEL_DIR)..."
	# @sudo chown -R $$(id -u):$$(id -g) $(LARAVEL_DIR)

clean:
	@echo "→ Deteniendo y eliminando contenedores..."
	docker compose down -v

	@echo "→ Eliminando carpeta ./$(LARAVEL_DIR)..."
	@rm -rf $(LARAVEL_DIR)

	@echo "✔ Limpieza completada."
