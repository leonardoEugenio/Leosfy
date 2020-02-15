<?php  
    require_once '../conexao/conecta.php';
    
    // Declara o comando SQL
    $sql = "SELECT id_sala, id_adm, usuario.nome, nome_sala, imagem FROM sala INNER JOIN usuario ON sala.id_adm = usuario.id_usuario WHERE sala.status = 1 ";
    
    // Executa o comando SQL
    $resultado = mysqli_query($conexao, $sql);
    
    
    if($resultado) { // se tem resultado
    
        // Converte o resultado em um array de registros
        $salas = mysqli_fetch_all($resultado, MYSQLI_ASSOC);
        
        $lista = [];
        foreach ($salas as $sala) {
            $sala['img_url'] = $url_server . 'upload_sala/' . $sala['imagem'];
            $sala['sala_url'] = 'sala.html?id=' . $sala["id_sala"];
            $lista[] = $sala;
        }

        $json_str = json_encode($lista);
    
        // Envia o json para o cliente
        print $json_str;
        exit; // impedir que exista sujeira no json
    }