# Manual de PHP 8.5 (Alpha)

Este documento reúne las principales novedades incluidas en PHP 8.5, basado en los RFCs aprobados y cambios observados en la versión alpha1.

PHP 8.5 es una versión menor con nuevas funcionalidades experimentales, mejoras sintácticas y correcciones internas. Todavía se encuentra en desarrollo, por lo que estos cambios pueden evolucionar antes de la versión estable.

---

## ✨ Nuevas características destacadas

### 1. 🧪 **Pipe Operator (`|>`)**
El operador `|>` permite encadenar expresiones en forma de "pipeline", donde la salida de una función es pasada como argumento a la siguiente.

```php
$result = "Hello World"
    |> strtoupper(...)
    |> strrev(...)
    |> trim(...);
```

Este patrón mejora la legibilidad y permite un enfoque más funcional.

> Ver test: [../tests/pipes.php](../tests/pipes.php)

---

### 2. 🧩 **Soporte para `default` en expresiones `match`**

PHP 8.0 introdujo `match`, pero no aceptaba la palabra clave `default`, solo `_`. PHP 8.5 ahora acepta explícitamente:

```php
$val = match ($input) {
    1 => "uno",
    2 => "dos",
    default => "INDEFINIDO!!", // antes: usar `_`
};
```

> Ver test: [../tests/match-default.php](../tests/match-default.php)

---

### 3. 📦 **Constantes anónimas**

Aunque el soporte está en evaluación en algunos builds alpha, se propone permitir definiciones rápidas de constantes dentro de clases anónimas u objetos sin nombre.

```php
$instancia = new class {
    public const FOO = "bar";
};
```

> Ver test: [../tests/anonymous-constants.php](../tests/anonymous-constants.php)

---

### 4. 🧠 **Interpolación de strings más precisa**

Se corrigen y mejoran errores sutiles en la interpolación de cadenas con variables complejas:

```php
$name = "PHP";
echo "Bienvenido a {$name} 8.5";
```

Esto ayuda a prevenir ambigüedades y errores silenciosos.

---

### 5. 🧬 **Callables en objetos con `__invoke()`**

PHP 8.5 mejora la compatibilidad con objetos invocables (`__invoke`) en contextos de `callable`.

```php
class Saludo {
    public function __invoke($name) {
        return "Hola, $name!";
    }
}

$saludar = new Saludo();

echo $saludar("Miguel") . PHP_EOL;
```

> Ver test: [../tests/anonymous-constants.php](../tests/anonymous-constants.php)

---

### 6. 🛠️ **Mejoras internas (engine)**

* Optimizaciones JIT.
* Depuración mejorada con `--enable-debug`.
* Reducción de memoria en estructuras internas.
* Mejor manejo de errores y mensajes más claros en excepciones.

---

## 📚 Recursos y enlaces

* [RFCs oficiales](https://wiki.php.net/rfc)
* [Descarga PHP 8.5 alpha1](https://downloads.php.net/~daniels/php-8.5.0alpha1.tar.bz2)
* [Repositorio oficial PHP](https://github.com/php/php-src)
* [Testing QA](https://qa.php.net)

---

## 📂 Relación con este repositorio

Este repositorio incluye:

* Compilación automatizada de PHP 8.5 desde fuente.
* Scripts de prueba en `./tests/`.
* Resultados de ejecución en `results.md` (usando GitHub Actions).
* Este manual en `docs/manual_php8.5.md`.

---

## 🤝 ¿Quieres contribuir?

* Agrega más ejemplos en la carpeta `tests/`
* Sugiérenos nuevas características a probar.
* Mejora este documento o tradúcelo.

Tu ayuda es bienvenida para aprender juntos lo nuevo de PHP 8.5 🚀
