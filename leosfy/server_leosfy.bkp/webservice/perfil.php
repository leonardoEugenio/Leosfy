<?php
require_once '../conexao/conecta.php';



if(isset($_POST['id'])){
$id = $_POST['id'];

$sql = "SELECT * from usuario where id_usuario = $id ";

$resultado = mysqli_query($conexao, $sql);

if($resultado) {
    $lista_user = mysqli_fetch_assoc($resultado);

    
        $lista_user['img_url'] = $url_server . 'server_leosfy/upload_user/' . $lista_user['img_perfil'];
        //$lista_user['img_url'] = 'http://localhost/server_leosfy/upload_user/' . $lista_user['img_perfil'];
        
    

    $json = json_encode($lista_user);
    print $json;
    die;
}
}