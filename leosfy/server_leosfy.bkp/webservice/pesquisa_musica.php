<?php
require_once '../conexao/conecta.php';

$pesquisa = $_POST['pesquisa'];
$sql = "SELECT nome, id_musica FROM musica WHERE nome LIKE '%$pesquisa%'"; 

$resultado = mysqli_query($conexao, $sql);

if ($resultado) {
    $musicas = mysqli_fetch_all($resultado, MYSQLI_ASSOC);

    $json = json_encode($musicas);
    print $json;
}
