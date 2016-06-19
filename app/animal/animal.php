<?php
require_once '../_inc/global.php';

$form = new GForm();

$header = new GHeader('Animais');
$header->addLib(array('paginate', 'maskMoney'));
$header->show(false, 'animal/animal.php');
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

$paginate = new GPaginate('animal', 'animal_load.php', SYS_PAGINACAO);
$html .= $paginate->get();
$html .= '</div>'; //divTable
$html .= getWidgetFooter();
echo $html;

//***carrega os proprietarios da base
$mysql = new GDbMysql();
$proprietarios = array();
$filter = new GFilter();
$filter->setOrder(array('pro_var_nome' => 'ASC'));
$query = "SELECT pro_int_codigo, pro_var_nome FROM vw_proprietario " . $filter->getWhere();
$param = $filter->getParam();
$mysql->execute($query, $param);

while($mysql->fetch()) {
  $proprietarios[$mysql->res['pro_int_codigo']] = $mysql->res['pro_var_nome'];
}

//var_dump($proprietarios);die();

echo '<div id="divForm" class="row divForm">';
include 'animal_form.php';
echo '</div>';

// ---------------------------------- Footer ---------------------------------//
$footer = new GFooter();
$footer->show();
?>
<script>
    var pagCrud = 'animal_crud.php';
    var pagView = 'animal_view.php';
    var pagLoad = 'animal_load.php';

    function filtrar(page) {
        animalLoad('', '', '', $('#filter').serializeObject(), page);
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
            var ani_int_codigo = $(this).parents('tr.linhaRegistro').attr('id');

            scrollTop();
            selectLine(ani_int_codigo);

            loadForm(URL_API + 'animais/' + ani_int_codigo, function(json) {
                $('#ani_dec_peso').val(numberFormat(json.ani_dec_peso,3));
                showForm('divForm', 'upd', 'Editar');
            });
        });
        $(document).on('click', '.l__btn_excluir', function() {
            var ani_int_codigo = $(this).parents('tr.linhaRegistro').attr('id');

            $.gDisplay.showYN("Quer realmente deletar o item selecionado?", function() {
                $.gAjax.exec('DELETE', URL_API + 'animais/' + ani_int_codigo, false, false, function(json) {
                    if (json.status) {
                        filtrar();
                    }
                });
            });
        });
    });
</script>
