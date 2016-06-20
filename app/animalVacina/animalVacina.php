<?php
require_once '../_inc/global.php';

$form = new GForm();

$header = new GHeader('Vacinas');
$header->addLib(array('paginate', 'maskMoney'));
$header->show(false, 'animalVacina/animalVacina.php');
// ---------------------------------- Header ---------------------------------//


$html .= '<div id="divTable" class="row">';
$html .= getWidgetHeader();
//<editor-fold desc="Formulário de Filtro">
$html .= $form->open('filter', 'form-inline filterForm');
$html .= $form->addInput('text', 'p__ani_var_nome', false, array('placeholder' => 'Nome', 'class' => 'sepV_b m-wrap small'), false, false, false);

$html .= getBotoesFiltro();
$html .= getBotaoAdicionar();
$html .= $form->close();
//</editor-fold>

$paginate = new GPaginate('animalVacina', 'animalVacina_load.php', SYS_PAGINACAO);
$html .= $paginate->get();
$html .= '</div>'; //divTable
$html .= getWidgetFooter();
echo $html;

//***carrega os proprietarios da base
$mysql = new GDbMysql();
$vacinas = array();
$filter = new GFilter();
$filter->setOrder(array('vac_var_nome' => 'ASC'));
$query = "SELECT vac_int_codigo, vac_var_nome FROM vw_vacina " . $filter->getWhere();
$param = $filter->getParam();
$mysql->execute($query, $param);

while($mysql->fetch()) {
  $vacinas[$mysql->res['vac_int_codigo']] = $mysql->res['vac_var_nome'];
}

$ani_int_codigo = $_GET['animal_id'];

echo '<div id="divForm" class="row divForm">';
include 'animalVacina_form.php';
echo '</div>';

// ---------------------------------- Footer ---------------------------------//
$footer = new GFooter();
$footer->show();
?>
<script>
    var pagCrud = 'animalVacina_crud.php';
    var pagView = 'animalVacina_view.php';
    var pagLoad = 'animalVacina_load.php';

    function filtrar(page) {
        animalVacinaLoad('', '', '', $('#filter').serializeObject(), page);
        return false;
    }

    $(function() {
        filtrar(1);
        $('#filter select').change(function() {
            filtrar(1);
            return false;
        });
        $('#filter').submit(function() {
            if ($('#filter').attr('action').length === 0) {
                filtrar(1);
                return false;
            }
        });
        $('#p__btn_limpar').click(function() {
            clearForm('#filter');
            filtrar(1);
        });
        $(document).on('click', '#p__btn_adicionar', function() {
            scrollTop();
            unselectLines();

            showForm('divForm', 'ins', 'Adicionar');
        });
        $(document).on('click', '.l__btn_editar, tr.linhaRegistro td:not([class~="acoes"])', function() {
            var anv_int_codigo = $(this).parents('tr.linhaRegistro').attr('id');

            scrollTop();
            selectLine(anv_int_codigo);

            loadForm(URL_API + 'animalVacinas/' + anv_int_codigo, function(json) {
                //$('#anv_dec_peso').val(numberFormat(json.anv_dec_peso,3));
                showForm('divForm', 'upd', 'Editar');
            });
        });
        $(document).on('click', '.l__btn_excluir', function() {
            var anv_int_codigo = $(this).parents('tr.linhaRegistro').attr('id');

            $.gDisplay.showYN("Quer realmente deletar o item selecionado?", function() {
                $.gAjax.exec('DELETE', URL_API + 'animalVacinas/' + anv_int_codigo, false, false, function(json) {
                    if (json.status) {
                        filtrar();
                    }
                });
            });
        });
    });
</script>
