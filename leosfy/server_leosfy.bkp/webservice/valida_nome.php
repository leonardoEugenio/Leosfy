<?php
    require_once '../conexao/conecta.php';

    if(isset($_GET['nome'])) {
        $nome = $_GET['nome'];

        $sql = "SELECT id_usuario from usuario where nome = '$nome'";

        $resultado = mysqli_query($conexao, $sql);
        
        if($resultado) {
            if(mysqli_num_rows($resultado) > 0 || $nome == '') { // ja existe esse nome
                $json = ['erro' => 'Esse nome já está cadastrado.'];
                print json_encode($json);
                exit;
            } else { // ainda não existe
                $json = ['sucesso' => 'nome válido.'];
                print json_encode($json);
                exit;
            }

        } else {
            $json = [
                'erro' => 'Desculpe, ocorreu um erro.',
            ];
            print json_encode($json);
            exit;
        }
    }


?>