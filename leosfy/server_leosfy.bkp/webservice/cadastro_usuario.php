<?php
require_once "../conexao/conecta.php";

if (isset($_POST)) {
    $nome = $_POST['nome'];
    $email = $_POST['email'];
    $senha = $_POST['senha'];

    if ($_FILES['img_input']) {
        $imagem = $_FILES['img_input']['name'];
        // move o arquivo para a pasta desejada

        $sql = "INSERT INTO usuario values (0, '$nome', '$senha', '$imagem', 1, '$email')";

        $resultado = mysqli_query($conexao, $sql);
        if ($resultado) {
            
            move_uploaded_file($_FILES['img_input']['tmp_name'], "../upload_user/$imagem");
            
            print 'Sucesso';
        }
    } else {
        print 'Erro';
    }
}
