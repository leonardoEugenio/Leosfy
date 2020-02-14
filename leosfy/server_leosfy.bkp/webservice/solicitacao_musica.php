<?php
    require_once '../conexao/conecta.php';
    if ($_POST['id_musica'] && $_POST['id_user'] && $_POST['id_sala']) {
        $idMusica = $_POST['id_musica'];
        $idUser   = $_POST['id_user'];
        $idSala   = $_POST['id_sala'];

        $sql = "INSERT INTO playlist VALUES(0, $idMusica, $idSala, $idUser, 1)";

        $resultado = mysqli_query($conexao, $sql);

        if ($resultado) {
            print 'sucesso';
            die;
        }else{
            print  'erro';
            die;
        }
    }else{
        print 'erro';
        die;
    }