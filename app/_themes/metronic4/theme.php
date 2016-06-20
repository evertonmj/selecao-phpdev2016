<?php

class Theme {

    var $info = array();

    function __construct() {
        $this->info['tema'] = 'default';
        $this->info['desc'] = 'Tema Default';
        $this->info['arquivos'] = array(
            'plugins/font-awesome/css/font-awesome.css',
            'plugins/simple-line-icons/simple-line-icons.min.css',
            'plugins/bootstrap/css/bootstrap.min.css',
            'plugins/uniform/css/uniform.default.css',
            'plugins/icheck/skins/all.css',
            'plugins/jquery-ui/jquery-ui.min.css',

            'css/components-md.css',
            // 'css/plugins-md.css',
            'css/layout.css',
            'css/themes/default.css',
            'css/custom.css',

            // ---------- Plugins defaults ---------- //
            'plugins/jquery-ui/jquery-ui.min.js',
            'plugins/bootstrap/js/bootstrap.min.js',
            'plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js',
            'plugins/jquery-slimscroll/jquery.slimscroll.min.js',
            'plugins/jquery.blockui.min.js',
            'plugins/jquery.cokie.min.js',
            'plugins/uniform/jquery.uniform.min.js',
            'plugins/bootbox/bootbox.min.js',
            'plugins/icheck/icheck.min.js',
            'plugins/jquery-file-upload/js/vendor/jquery.ui.widget.js',
            'plugins/jquery-file-upload/js/jquery.iframe-transport.js',
            'plugins/jquery-file-upload/js/jquery.fileupload.js',

            'scripts/metronic.js',
            'scripts/layout.js',

            // --------------
            '_css/global.css',
            '_js/functions.js'
        );
    }

    function getFiles() {
        return $this->info['arquivos'];
    }

}
