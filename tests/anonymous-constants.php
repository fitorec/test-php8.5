<?php
$foo = new class {
    public const FOO = true;
};

echo $foo::FOO ? "true" : "false", PHP_EOL;
