<?php

    require_once '../conexao/conecta.php';

    if(isset($_POST['senha']) && isset($_POST['id'])){

    $senha = $_POST['senha'];
    $id_sala = $_POST['id']; 

    // Declara o comando SQL
    $sql = "SELECT id_sala as 'id' FROM sala WHERE id_sala = $id_sala and senha = '$senha'";

    // Executa o comando SQL
    $resultado = mysqli_query($conexao, $sql);


    if($resultado) { // se tem resultado
        $sala = mysqli_fetch_assoc($resultado);
        $sala['tipo_usuario'] = 'com';

        $json = json_encode($sala); 
        print $json;
    }
}