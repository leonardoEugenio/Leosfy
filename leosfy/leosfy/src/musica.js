function upload_musica() {

    var id_user = usuarioLogado.id

    var form = $('#form_musica').get(0);
    var dados_form = new FormData(form);
    dados_form.set('id', id_user);
    dados_form.set('nome', $('#nome').val());


    $.post({
        url: urlServer + "webservice/upload_musica.php",
        data: dados_form,
        processData: false,
        contentType: false,
    }).done(function(resposta) {
        if (resposta === 'Sucesso') {
            alert('Musica cadastrada com sucesso')
            pesquisa()
        } else {
            alert('Tente novamente, mais tarde ')
        }
    })
}

function add_musica(id) {
    var id_user = usuarioLogado.id;
    var sala = JSON.parse(localStorage.getItem('Sala'));
    // var musica = [];
    // musica.id_musica = id;
    // musica.id_user   = id_user;
    $.post({
        url: urlServer + "webservice/solicitacao_musica.php",
        data: {
            id_musica: id,
            id_user: id_user,
            id_sala: sala.id,
        },
    }).done(function(resposta) {
        if (resposta === 'sucesso') {
            alert('A sua musica foi solicitada');
            monta_playlist();
        } else {
            alert('Infelismente houve um erro, tente novamente mais tarde');
        }
    })
}

function pesquisa() {
    $('#resultado').html('');
    $('#lista_musica').html('');
    var musicas = $('#pesquisa_musica').val();
    if (musicas != '') {
        $.post({
            url: urlServer + 'webservice/pesquisa_musica.php',
            data: {
                pesquisa: musicas
            },
        }).done(function(resposta) {
            var lista_pesquisa = JSON.parse(resposta);

            $('#resultado').html('');
            $('#lista_musica').html('');
            if (lista_pesquisa.length === 0) {

                var modal = $('#upload_musicas').html();

                var dom = $(modal).get(0);

                $('#resultado').append(dom);
            } else {
                $('#resultado').html('');
                $('#lista_musica').html('');
                lista_pesquisa.map(function(musica) {

                    var item_musica = $('#modelo_musica').html();

                    item_musica = item_musica.replace('ID', musica.id_musica);
                    item_musica = item_musica.replace('%MUSICA%', musica.nome);

                    var dom = $(item_musica).get(0);

                    $('#lista_musica').append(dom);
                });
            }
        })
    } else {
        $('#resultado').html('');
        $('#lista_musica').html('');
    }
}