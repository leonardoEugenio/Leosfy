//cadastro sala
function cadastrar_sala() {
    var id_adm = usuarioLogado.id;
    $('#id_adm').val(id_adm);

    var form = $('#form_sala').get(0);
    var dados_form = new FormData(form);
    $.post({
        url: urlServer + 'webservice/cadastro_sala.php',
        data: dados_form,
        processData: false,
        contentType: false,
    }).done(function(resposta) {
        var sala = JSON.parse(resposta);
        if (sala.id != "") {
            localStorage.setItem('Sala', JSON.stringify(sala));
            window.location.href = "sala.html?id_sala=" + sala.id;
        } else {
            alert('Ouve um erro, tente novamente mais tarde')
        }
    })
}

function listar_sala() {
    $.get({
        url: urlServer + 'webservice/listar_sala.php',

    }).done(function(resposta) {
        var salas = JSON.parse(resposta);

        salas.map(function(sala) {

            var card = $('#modelo_sala').html();

            card = card.replace('%IMG_URL_SALA%', sala.img_url);
            card = card.replace('%SALA%', sala.nome_sala);
            card = card.replace('%URL_SALA%', sala.sala_url);
            card = card.replace('%URL_SALA%', sala.sala_url);
            card = card.replace('%ADM%', sala.nome);
            card = card.replace('%ID%', sala.id_sala);

            // convertendo a string em elemento html
            var dom = $(card).get(0);

            $('#lista_salas').append(dom);
        });
    })
}



function infoSala() {
    var sala = JSON.parse(localStorage.getItem('Sala'));
    if (sala.id) {
        $.post({
            url: urlServer + "webservice/info_sala.php",
            data: {
                id_sala: sala.id,
            }
        }).done(function(resposta) {
            var infoSala = JSON.parse(resposta);

            $('#img').attr('src', urlServer + 'upload_sala/' + infoSala.imagem);

            $('#nome_sala').text(infoSala.nome_sala);

            $('#adm').text(infoSala.nome);

        })
    }
}

function verifica_sala() {
    if (!localStorage.Sala)
        window.location.href = 'index.html';
}