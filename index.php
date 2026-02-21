<?php
    define("IN_SITE", true);
    require_once(__DIR__."/config/config.php");
    require_once(__DIR__."/config/function.php");

$IULA = new IULA();

//LẤY MODUN XEM ADMIN HAY NGƯỜI DÙNG, NÊU TỒN TẠI module THÌ LẤY module MẶC ĐINH LÀ CLIENT
$module = !empty($_GET['module']) ? xss($_GET['module']) : 'frontend';

//BẢO TRÌ, CHỈ ADMIN ĐƯỢC TRUY CẬP
if ($IULA->site('status') != 'ON' && $module  == 'frontend') {
    require_once(__DIR__.'/frontend/page/views/maintenance.php');
    exit();
}

// FORDER
$category = !empty($_GET['category']) ? xss($_GET['category']) : 'page';
$views = !empty($_GET['views']) ? xss($_GET['views']) : 'views';

//LỰA CHỌN TỆP
$action = !empty($_GET['action']) ? xss($_GET['action']) : 'home';


if($action == 'footer' || $action == 'header' || $action == 'sidebar' || $action == 'nav'):
    require_once(__DIR__.'/frontend/page/views/404.php');
    exit();
endif;
$path = "$module/$category/$views/$action.php";
if (file_exists($path)) {
    require_once(__DIR__.'/'.$path);
    exit();
} else {
    require_once(__DIR__.'/frontend/page/views/404.php');
    exit();
}
?>
