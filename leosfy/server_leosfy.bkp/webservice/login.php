<?php   

require_once '../conexao/conecta.php';

if (isset($_POST['nome']) && isset($_POST['senha'])) {
    $nome = $_POST['nome'];
    $senha = $_POST['senha'];

    $sql = "SELECT senha, nome, id_usuario FROM `usuario` WHERE nome = '$nome' and senha='$senha'";

$resultado = mysqli_query($conexao, $sql);

if($resultado){
    $usuario = mysqli_fetch_assoc($resultado);

    if($usuario){
        $login = [ "nome"=> $usuario['nome'], "id"=> $usuario['id_usuario'] ];
        $json  = json_encode($login);
        print ($json);
        die;
    }else{
        print('Erro');
        die;
    }
}
}else{
    print('Erro');
}