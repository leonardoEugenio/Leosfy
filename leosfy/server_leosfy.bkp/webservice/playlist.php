<?php
    require_once '../conexao/conecta.php';
    if (isset($_POST['id_sala'])) {
        $id_sala = $_POST['id_sala'];
        
        $sql = "SELECT id_solicitacao, usuario.nome as 'usuario', musica.nome, musica.id_musica FROM playlist INNER JOIN usuario ON playlist.usuario = usuario.id_usuario INNER JOIN musica ON playlist.musica = musica.id_musica WHERE playlist.status = 1 and sala = $id_sala";
        $resultado = mysqli_query($conexao, $sql);;
        if (isset($resultado)) {
            $playlist = mysqli_fetch_all($resultado, MYSQLI_ASSOC);

            $json     = json_encode($playlist);
            print $json; 
        }else{
            print 'erro';
        }
    }else{
        print 'Sala não logada';
    }