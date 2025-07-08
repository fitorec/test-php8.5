<?php
class Greeter {
    public function __invoke($name) {
        return "Hola, $name!";
    }
}

$greeter = new Greeter();

echo $greeter("Miguel") . PHP_EOL;
