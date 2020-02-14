<?php
    require_once '../conexao/conecta.php';

    if ($_POST['id_sala']) {
        $id_sala = $_POST['id_sala'];
        $sql = " SELECT id_sala, id_adm, usuario.nome, nome_sala, imagem FROM sala INNER JOIN usuario ON sala.id_adm = usuario.id_usuario WHERE sala.status = 1 and id_sala = $id_sala";
        $resultado = mysqli_query($conexao, $sql);

        if (isset($resultado)) {
            $info_sala = mysqli_fetch_assoc($resultado);

            $json = json_encode($info_sala);

            print $json;
            die;
        }else{
            print 'erro';
        }
    }else{
        print 'erro';
    }