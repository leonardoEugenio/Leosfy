<?php
    require_once '../conexao/conecta.php';
    if($_POST['nome'] && $_POST['id_adm']){
        $id_adm = $_POST['id_adm'];
        $nome   = $_POST['nome'];
        $senha  = $_POST['senha'];

        if (isset($_FILES)) {
            $imagem = $_FILES['img']['name'];

        $sql = "INSERT INTO sala VALUES (0, '$id_adm', '$nome', '$senha', '$imagem', 1)";

        $resultado = mysqli_query($conexao, $sql);

        if ($resultado) {
            $id_sala      = mysqli_query($conexao, " SELECT LAST_INSERT_ID() AS id");
            $id_sala      = mysqli_fetch_assoc($id_sala);
            $sala         = [];
            $sala['id']   = $id_sala['id'];
            $sala['tipo_usuario'] = 'adm';

            move_uploaded_file($_FILES['img']['tmp_name'], "../upload_sala/$imagem");

            $json  = json_encode($sala);
            print $json;
        }
    }
}