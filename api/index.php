<?php

require 'vendor/autoload.php';

$settings['displayErrorDetails'] = true;
$settings['determineRouteBeforeAppMiddleware'] = true;

$app = new \Slim\App(["settings" => $settings]);

require 'config.php';
require '_genesis/genesis.php';
require 'endpoints/usuarios.php';
require 'endpoints/animais.php';
require 'endpoints/proprietarios.php';
require 'endpoints/animalVacinas.php';

$app->run();
