<?php
$value = 3;

$result = match ($value) {
    1 => "one",
    2 => "two",
    default => "unknown", // PHP 8.5 permite "default" como keyword
};

echo $result . PHP_EOL;
