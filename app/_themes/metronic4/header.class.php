<?php

class GHeader extends GHeaderParent {

    private $titulo;
    private $subtitulo;

    function __construct($tilulo, $subtitulo = '') {
        $this->titulo = $tilulo;
        $this->subtitulo = $subtitulo;

        parent::__construct($tilulo);
    }

    /**
     * Exibir o cabeçalho da página completo
     *
     * @param boolean $isIframe default: false
     * @param string $currentMenu default: '' caminho completo para a página
     * @param string $breadcrumb default: ''
     */
    function show($isIframe = false, $currentMenu = '', $breadcrumb = '') {
        parent::show();

        $html = '';
        $html .= '<meta name="description" content="">';
        $html .= '<meta name="author" content="">';

        $html .= '<!--[if lt IE 9]> ';
        $html .= '<script src="' . URL_SYS_THEME . 'plugins/respond.min.js"></script> ';
        $html .= '<script src="' . URL_SYS_THEME . 'plugins/excanvas.min.js"></script> ';
        $html .= '<![endif]-->';

        // fechar head
        $html .= '</head>';

        if (!$isIframe) {
            if ($this->_bodyClass != ""){
                $html .= '<body class="' . $this->_bodyClass . '">';
            } else {
                $html .= '<body class="page-md">';
            }

            $html .= '<script>var URL_API = "' . URL_API . '";</script>';

            $html .= '<div class="page-header">';
            $html .= '<div class="page-header-top">';
            $html .= '<div class="container">';

            $html .= '<div class="page-logo">';
            $html .= '<a href="' . URL_SYS . 'index.php"><img src="' . URL_SYS_THEME . '_img/logo-simplesvet.png" alt="logo" class="logo-default" /></a>';
            $html .= '</div>';

            $html .= '<a href="javascript:;" class="menu-toggler"></a>';

            $html .= '<div class="top-menu">';
            $html .= '</div>'; //.top-menu

            $html .= '</div>'; //.container
            $html .= '</div>'; //.page-header-top

            $html .= '<div class="page-header-menu">';
            $html .= '<div class="container">';

            $html .= '<div class="hor-menu">';
            $html .= $this->getMenu($currentMenu);
            $html .= '</div>';

            $html .= '</div>'; //.container
            $html .= '</div>'; //.page-header-menu
            $html .= '</div>';

            $html .= '<div class="page-container">';

            $html .= '<div class="page-head">';
            $html .= '<div class="container">';

            if (!empty($this->titulo)) {
                $html .= '<div class="page-title">';
                $html .= '<h1>' . $this->titulo . ' ';
                if (!empty($this->subtitulo)) {
                    $html .= '<small>' . $this->subtitulo . '</small>';
                }
                $html .= '</h1>';
                $html .= '</div>';
            }

            $html .= '</div>'; //.container
            $html .= '</div>'; //.page-head

            $html .= '<div class="page-content">';
            $html .= '<div class="container">';

        } else {
            if ($this->_bodyClass != "")
                $html .= '<body class="' . $this->_bodyClass . '">';
            else
                $html .= '<body>';
        }



        echo $html;
    }

    function getMenu($current) {
        $html = '';
        $html .= '<ul class="nav navbar-nav">';

        $arrayMenu[] = array('title' => 'Início', 'url' => 'index.php', 'icon' => 'fa fa-home');
        $arrayMenu[] = array('title' => 'Usuários', 'url' => 'usuario/usuario.php', 'icon' => 'fa fa-user');
        $arrayMenu[] = array('title' => 'Animais', 'url' => 'animal/animal.php', 'icon' => 'fa fa-github');
        $arrayMenu[] = array('title' => 'Proprietários', 'url' => 'proprietario/proprietario.php', 'icon' => 'fa fa-user');

        foreach ($arrayMenu as $menu) {
            $html .= '<li class="' . $active . '">';
            $html .= '<a href="' . URL_SYS . $menu['url'] . '">';
            if(!empty($menu['icon'])){
                $html .= '<i class="' . $menu['icon'] . '"></i> ';
            }
            $html .= $menu['title'];
            $html .= '</a>';
            $html .= '</li>';
        }


        $html .= '</ul>';
        return $html;
    }

    function getBreacrumb($breadcrumb) {
        //TODO: Implementar os breadcrumbs de acordo com o sistema
        $html = '';
        return $html;
    }

}

?>
