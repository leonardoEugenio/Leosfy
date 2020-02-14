<?php
    require_once "../conexao/conecta.php";
 
    if ($_FILES['musica']){
        $nome = $_FILES['musica']['name'];
        $separa = explode('.', $nome); 
        $ext = end($separa);
        $musica = $_POST['nome'];
        $nome = $musica.'.'. $ext;   
        
        $id = $_POST['id'];
        // move o arquivo para a pasta desejada

        $sql = "INSERT INTO musica values (0, '$nome' , 1, '$id')";
        
        move_uploaded_file($_FILES['musica']['tmp_name'], "../musica/$nome");

        $resultado = mysqli_query($conexao, $sql);

        if ($resultado) {
            print 'Sucesso';
        }else{
            print'erro';
        }
    }