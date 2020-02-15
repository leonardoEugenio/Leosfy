var musica_atual = 0;

var linha_musica = 0

var playlist;

var audio;


function monta_playlist() {
    var sala = JSON.parse(localStorage.getItem('Sala'));
    $.post({
        url: urlServer + '/webservice/playlist.php',
        data: {
            id_sala: sala.id
        }
    }).done(function (resposta) {
        var itens = JSON.parse(resposta);
        if (itens.length != 0) {
            $('#musicas').html('');
            itens.map(function (musica) {
                var linha = $('#itens_tabela').html();

                linha = linha.replace('%MUSICA%', musica.nome);
                linha = linha.replace('%USUARIO%', musica.usuario);
                linha = linha.replace('%ID_MUSICA%', musica.id_musica);
                linha = linha.replace('%ID_MUSICA%', musica.id_musica);

                // convertendo a string em elemento html
                var dom = $(linha).get(0);

                $('#musicas').append(dom);
            });
            playlist = itens;
            muda_musica(playlist);
        }
    })
}


function muda_musica(itens) {
    var musica_tocando = itens[musica_atual];
    $('#musica_tocando').attr('src', urlServer + 'musica/' + musica_tocando.nome);
    $('#leosfy').text('Leos.Fy/' + musica_tocando.nome);
    $('#musica_play').text(musica_tocando.nome);
    $('#enviado').text(musica_tocando.usuario);



    audio = document.getElementById('musica_tocando');
}


function play() {
    $('#icone_play_pause').text('pause');
    duracao = audio.duration;
    $('#btn').attr('onclick', 'pause()');
    conta_tempo();
    audio.play();
    
}

function pause() {
    audio.pause();
    $('#icone_play_pause').text('play_arrow');
    $('#btn').attr('onclick', 'play()');
}

function proximo() {

    var numero_musicas = playlist.length;
    if (musica_atual < numero_musicas -1 ) {
        musica_atual++;
    } else {
        musica_atual = 0;
    }
    muda_musica(playlist);

    audio.play()

}
function anterior() {

    var numero_musicas = playlist.length;
    if (linha_musica > numero_musicas -1 ) {
        musica_atual--;
    } else {

        musica_atual = numero_musicas;
    }
    muda_musica(playlist);
    audio.play()
}

function conta_tempo() {

    setInterval(function () {
        tempo_musica = (audio.currentTime / audio.duration) * 100;
        $('#barra_progreso').attr('style', 'width: ' + tempo_musica + '%')
        if (tempo_musica = audio.duracao) {
            proximo();
        }
    }, (1000))
}
function click_musica(id) {
    musica_tocando.id_musica = id;
    var i = 0
    for (; i < playlist.length; i++) {
        if (playlist[i]['id_musica'] === id) {
            musica_atual = i;
            muda_musica(playlist);
            audio.play()
            i = playlist.length;
        }
    }
}