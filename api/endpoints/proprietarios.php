<?php

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require '_class/proprietarioDao.php';

$app->get('/proprietarios/{pro_int_codigo}', function (Request $request, Response $response) {
    $pro_int_codigo = $request->getAttribute('pro_int_codigo');

    $proprietario = new Proprietario();
    $proprietario->setPro_int_codigo($pro_int_codigo);

    $data = ProprietarioDao::selectByIdForm($proprietario);
    $code = count($data) > 0 ? 200 : 404;

	return $response->withJson($data, $code);
});


$app->post('/proprietarios', function (Request $request, Response $response) {

    $body = $request->getParsedBody();

    $proprietario = new Proprietario();
    $proprietario->setPro_var_nome($body['pro_var_nome']);
    $proprietario->setPro_var_email($body['pro_var_email']);
    $proprietario->setPro_var_telefone($body['pro_var_telefone']);

    $data = ProprietarioDao::insert($proprietario);

    $code = ($data['status']) ? 201 : 500;

	return $response->withJson($data, $code);
});


$app->put('/proprietarios/{pro_int_codigo}', function (Request $request, Response $response) {
  $body = $request->getParsedBody();
  $pro_int_codigo = $request->getAttribute('pro_int_codigo');

  $proprietario = new Proprietario();

  $proprietario->setPro_int_codigo($pro_int_codigo);
  $proprietario->setPro_var_nome($body['pro_var_nome']);
  $proprietario->setPro_var_email($body['pro_var_email']);
  $proprietario->setPro_var_telefone($body['pro_var_telefone']);

  $data = ProprietarioDao::update($proprietario);
  $code = ($data['status']) ? 200 : 500;

	return $response->withJson($data, $code);
});


$app->delete('/proprietario/{pro_int_codigo}', function (Request $request, Response $response) {
	$pro_int_codigo = $request->getAttribute('pro_int_codigo');

    $proprietario = new Proprietario();
    $proprietario->setPro_int_codigo($pro_int_codigo);

    $data = ProprietarioDao::delete($proprietario);
    $code = ($data['status']) ? 200 : 500;

	return $response->withJson($data, $code);
});
