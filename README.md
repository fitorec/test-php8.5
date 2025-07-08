# Pruebas de PHP 8.5 alpha1 en Docker

```
                          _            ___   ____
          _         _ __ | |__  _ __  ( _ ) | ___|
   ______/ \-.   _ | '_ \| '_ \| '_ \ / _ \ |___ \
.-/     (    o\_// | |_) | | | | |_) | (_) | ___) |
 |  ___  \_/\---'  | .__/|_| |_| .__/ \___(_)____/
 |_||  |_||        |_|         |_|
```

Este proyecto permite compilar y probar la versión **PHP 8.5.0alpha1** desde su código fuente oficial, utilizando Docker y Docker Compose.

Se incluyen ejemplos de pruebas de las nuevas características del lenguaje introducidas en PHP 8.5.

## 🚀 ¿Cómo empezar?

### Requisitos

- Docker
- Docker Compose (integrado como `docker compose` en Docker moderno)

### 1. Construir el contenedor

```bash
docker compose build
````

### 2. Ejecutar una prueba

```bash
docker compose run php85 php /tests/pipes.php
```

### 3. Ejecutar otras pruebas

```bash
docker compose run php85 php /tests/<archivo>.php
```

## 📁 Estructura del proyecto

```
.
├── docker-compose.yml
├── GNUmakefile
├── Dockerfile
├── tests/
│   ├── pipes.php
│   ├── match-default.php
│   ├── anonymous-constants.php
│   ├── object-callable.php
│   └── string-interpolation.php
└── docs/
```

* `tests/`: Contiene ejemplos para probar nuevas características de PHP 8.5.
* `docs/`: Aquí puedes colocar documentación adicional sobre los cambios de PHP 8.5.

## 🧪 Pruebas incluidas

| Archivo                    | Característica probada                |
| -------------------------- | ------------------------------------- |
| `pipes.php`                | Pipe operator (`|>`)                  |
| `match-default.php`        | Default en `match` expressions        |
| `anonymous-constants.php`  | Constantes anónimas (RFC)             |
| `object-callable.php`      | Nuevos tipos de `callable` en objetos |
| `string-interpolation.php` | Mejoras en interpolación de strings   |

## GNUmakefile

### 🔧 `make install-laravel` (requiere permisos de superusuario)

Este objetivo:

- Descarga e instala Laravel 12 en la carpeta `./laravel`
- Configura automáticamente el archivo `.env` para conexión con MySQL
- Instala las dependencias con Composer (ignorando restricciones de versión de PHP)
- Genera la clave de aplicación (`APP_KEY`)
- Ejecuta las migraciones de base de datos
- Corrige los permisos de la carpeta `./laravel`

> ⚠️ Este paso requiere `sudo` porque corrige los permisos de archivos creados por Docker como `root`.

Este entorno es útil para validar compatibilidad de Laravel con versiones futuras de PHP.

---

### 🧪 `make build`

Este objetivo:

- Construye el contenedor con PHP 8.5 desde el código fuente
- No instala Laravel ni depende de MySQL
- Permite ejecutar archivos de prueba ubicados en la carpeta `./tests`, como por ejemplo:

```bash
docker compose run --rm php85 php /tests/pipes.php
````

Ideal para quienes quieran experimentar directamente con nuevas características del lenguaje sin depender de frameworks.


## 🤝 Contribuciones

Si deseas contribuir con más ejemplos para entender juntos **las nuevas características de PHP 8.5**

Puedes:

 - Agregar archivos en la carpeta `./tests/`
 - Proponer documentación en `./docs/`
 - Enviarnos un pull request 🚀

## 📚 Referencias

 - [PHP 8.5 alpha1 - Descarga oficial](https://downloads.php.net/~daniels/php-8.5.0alpha1.tar.bz2)
 - [RFCs activos y aprobados de PHP](https://wiki.php.net/rfc)
 - [PHP GitHub](https://github.com/php/php-src)

---

> Este entorno es ideal para probar y familiarizarte con las nuevas características del lenguaje antes de su lanzamiento estable.
