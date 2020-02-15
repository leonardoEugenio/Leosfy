var urlServer = 'http://localhost/server_leosfy.bkp/';

var usuarioLogado = JSON.parse(localStorage.getItem('User'));

function logado() {
    usuarioLogado = JSON.parse(localStorage.getItem('User'));
    if (usuarioLogado) {
        window.location.href = 'index.html';
    }
}

function naoLogado() {
    usuarioLogado = JSON.parse(localStorage.getItem('User'));
    if (!usuarioLogado) {
        window.location.href = 'login.html';
    }
}

function logout() {
    var sair_resp = confirm("deseja, sair da conta");
    if (sair_resp == true) {
        localStorage.clear();
        window.location.href = 'login.html';
    }
}

function logar() {
    form = $('#form_log').get(0);
    dados = new FormData(form);

    $.post({
        url: urlServer + 'webservice/login.php',
        data: dados,
        processData: false,
        contentType: false,
    }).done(function(resposta) {
        if (resposta != 'Erro') {
            localStorage.setItem('User', resposta)
            window.location.href = 'index.html'
        } else {
            alert('Usuário invalido')
        }
    })
}