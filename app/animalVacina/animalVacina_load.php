<?php

require_once("../_inc/global.php");

$html = '';
$mysql = new GDbMysql();
$form = new GForm();
//------------------------------ Parâmetros ----------------------------------//
$type = $_POST['type'];
$page = $_POST['page'];
$count = $_POST['count'];
$rp = (int) $_POST['rp'];
$start = (($page - 1) * $rp);
//------------------------------ Parâmetros ----------------------------------//
//-------------------------------- Filtros -----------------------------------//
$filter = new GFilter();

$anv_var_nome = $_POST['p__anv_var_nome'];

/*if (!empty($anv_var_nome)) {
    $filter->addFilter('AND', 'anv_var_nome', 'LIKE', 's', '%' . str_replace(' ', '%', $ani_var_nome) . '%');
}*/

//-------------------------------- Filtros -----------------------------------//

try {
    if ($type == 'C') {
        $query = "SELECT count(1) FROM vw_animal_vacina " . $filter->getWhere();
        $param = $filter->getParam();
        $mysql->execute($query, $param);
        if ($mysql->fetch()) {
            $count = ceil($mysql->res[0] / $rp);
        }
        $count = $count == 0 ? 1 : $count;
        echo json_encode(array('count' => $count));
    } else if ($type == 'R') {
        $filter->setOrder(array('ani_var_nome' => 'ASC'));
        //if (!empty($ani_int_codigo)) {
            //$filter->addFilter('AND', 'ani_int_codigo', '=', 's', $ani_int_codigo);
        //}
        $filter->setLimit($start, $rp);

        $query = "SELECT anv_int_codigo, ani_int_codigo, ani_var_nome, vac_int_codigo, vac_var_nome, anv_dat_programacao, anv_dti_aplicacao, anv_dti_inclusao FROM vw_animal_vacina " . $filter->getWhere();
        $param = $filter->getParam();

        $mysql->execute($query, $param);

        if ($mysql->numRows() > 0) {
            $html .= '<table class="table table-striped table-hover">';
            $html .= '<thead>';
            $html .= '<tr>';
            $html .= '<th>Nome Animal</th>';
            $html .= '<th>Nome Vacina</th>';
            $html .= '<th>Data Programação</th>';
            $html .= '<th>Data Aplicação</th>';
            $html .= '<th>Aplicada?</th>';
            $html .= '<th class="__acenter hidden-phone" width="100px">Actions</th>';
            $html .= '</tr>';
            $html .= '</thead>';
            $html .= '<tbody>';
            while ($mysql->fetch()) {
                $class = ($_POST['p__selecionado'] == $mysql->res['ani_int_codigo']) ? 'success' : '';
                $aplicacao = $mysql->res['anv_dti_aplicacao'] == null || $mysql->res['anv_dti_aplicacao'] == "00/00/0000 00:00:00" ? 'Não' : 'Sim';
                $html .= '<tr id="' . $mysql->res['anv_int_codigo'] . '" class="linhaRegistro ' . $class . '">';
                $html .= '<td>' . $mysql->res['ani_var_nome'] . '</td>';
                $html .= '<td>' . $mysql->res['vac_var_nome'] . '</td>';
                $html .= '<td>' . $mysql->res['anv_dat_programacao'] . '</td>';
                $html .= '<td>' . $mysql->res['anv_dti_aplicacao'] . '</td>';
                $html .= '<td>' . $aplicacao  . '</td>';

                //<editor-fold desc="Actions">
                    $html .= '<td class="__acenter hidden-phone acoes">';
                    $html .= $form->addButton('l__btn_aplicar_vacina', '<i class="fa fa-share"></i>', array('class' => 'btn btn-small btn-icon-only l__btn_aplicar_vacina', 'title' => 'Aplicar Vacina'));
                    $html .= $form->addButton('l__btn_excluir', '<i class="fa fa-trash"></i>', array('class' => 'btn btn-small btn-icon-only l__btn_excluir', 'title' => 'Remover'));
                    $html .= '</td>';
                //</editor-fold>
                $html .= '</tr>';
            }
            $html .= '</tbody>';
            $html .= '</table>';
        } else {
            $html .= '<div class="nenhumResultado">Nenhum resultado encontrado.</div>';
        }

        echo $html;
    }
} catch (GDbException $exc) {
    echo $exc->getError();
}
?>
