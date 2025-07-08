<?php
class Saludo {
    public function __invoke($name) {
        return "Hola, $name!";
    }
}

$saludar = new Saludo();

echo $saludar("Miguel") . PHP_EOL;
