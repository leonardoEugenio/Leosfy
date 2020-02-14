<?php
    $url_server = 'https://leofy.000webhostapp.com/';
    $conexao = mysqli_connect("localhost","id11098704_root", "123123", "id11098704_leosfy");

    // if(mysqli_connect_errno()){
    //     die("Falha na conexão: " . mysqli_connect_error());//não devemos fazer esse comando  mysqli_connect_error(), pois ele espana inforrmações doservidor
    // }

    mysqli_set_charset($conexao, 'utf8');
        
    /**
     * Permite que o servidor receba requisições
     * de qualquer origem, ou seja, de fora do servidor
     * Ex.: aplicativo de celuar
     */
    header('Access-Control-Allow-Origin: *');