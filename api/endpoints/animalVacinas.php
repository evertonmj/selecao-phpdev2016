<?php

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require '_class/animalVacinaDao.php';

$app->get('/animalVacinas/{anv_int_codigo}', function (Request $request, Response $response) {
    $anv_int_codigo = $request->getAttribute('anv_int_codigo');

    $animalVacina = new AnimalVacina();
    $animalVacina->setAni_int_codigo($anv_int_codigo);

    $data = AnimalVacinaDao::selectByIdForm($animalVacina);
    $code = count($data) > 0 ? 200 : 404;

	return $response->withJson($data, $code);
});


$app->post('/animalVacinas', function (Request $request, Response $response) {
    $body = $request->getParsedBody();

    $animal = new Animal();
    $vacina = new Vacina();
    $usuario = new Usuario();

    $animal->setAni_int_codigo($body['ani_int_codigo']);
    $vacina->setVan_int_codigo($body['van_int_codigo']);

    $animalD = AnimalDao::selectByIdForm($animal);
    $vacinaD = VacinaDao::selectByIdForm($vacina);

    $animalVacina = new AnimalVacina();
    $animalVacina->setAnimal($animalD);
   	$animalVacina->setVacina($vacinaD);
   	$animalVacina->setAnv_dat_programacao($body['anv_dat_programacao']);
   	$animalVacina->setAnv_dti_aplicacao($body['anv_dti_aplicacao']);
    $animalVacina->setUsuario($usuario);

    $data = AnimalVacinaDao::insert($animalVacina);
    $code = ($data['status']) ? 201 : 500;

	return $response->withJson($data, $code);
});

$app->put('/animalVacinas', function (Request $request, Response $response) {
    $body = $request->getParsedBody();

    $animal->setAnv_int_codigo($body['anv_int_codigo']);
    $vacina->setAni_int_codigo($body['ani_int_codigo']);

    $animalVacina = new AnimalVacina();
    $animalVacina->setAnimal($animalD);
   	$animalVacina->setVacina($vacinaD);
   	$animalVacina->setAnv_dat_programacao($body['anv_dat_programacao']);
   	$animalVacina->setAnv_dti_aplicacao($body['anv_dti_aplicacao']);
    $animalVacina->setUsuario($usuario);

    $data = AnimalVacinaDao::insert($animalVacina);
    $code = ($data['status']) ? 201 : 500;

	return $response->withJson($data, $code);
});

$app->put('/animalVacinas/aplicarVacina/{anv_int_codigo}', function (Request $request, Response $response) {
  $anv_int_codigo = $request->getAttribute('anv_int_codigo');

  $animalVacina = new AnimalVacina();
  $animalVacina->setAnv_int_codigo($anv_int_codigo);

  $dataAnv = AnimalVacinaDao::selectByIdForm($animalVacina);

  $data = AnimalVacinaDao::aplicarVacina($dataAnv);

  $code = ($data['status']) ? 200 : 500;

  return $response->withJson($data, $code);
});

$app->delete('/animalVacinas/{anv_int_codigo}', function (Request $request, Response $response) {
	$anv_int_codigo = $request->getAttribute('anv_int_codigo');

    $animalVacina = new AnimalVacina();
    $animalVacina->setAnv_int_codigo($anv_int_codigo);

    $data = AnimalVacinaDao::delete($animalVacina);
    $code = ($data['status']) ? 200 : 500;

	return $response->withJson($data, $code);
});
