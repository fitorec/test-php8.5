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
docker compose run php85 php tests/pipes.php
```

### 3. Ejecutar otras pruebas

```bash
docker compose run php85 php tests/<archivo>.php
```

## 📁 Estructura del proyecto

```
.
├── docker-compose.yml
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
