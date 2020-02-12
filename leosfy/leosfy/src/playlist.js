var musica_atual = [id_musica = 0, linha_musica = 0];

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
    console.log(itens[musica_atual])

    var musica_tocando = itens[musica_atual.linha_musica];

    $('#musica_tocando').attr('src', urlServer + 'musica/' + musica_tocando.nome);
    $('#leosfy').text('Leos.Fy/' + musica_tocando.nome)
    $('#musica_play').text(musica_tocando.nome);
    $('#enviado').text(musica_tocando.usuario);



    audio = document.getElementById('musica_tocando');

    console.log(musica_tocando);
}


function play() {
    // var nome_musica - $('#musica_tocando').attr('src')
    audio.play();
    $('#icone_play_pause').text('pause');
    duracao = audio.duration;
    $('#btn').attr('onclick', 'pause()');
    conta_tempo();
}

function pause() {
    audio.pause();
    $('#icone_play_pause').text('play_arrow');
    $('#btn').attr('onclick', 'play()');
}

function proximo() {
    var numero_musicas = playlist.length - 1;
    if (musica_atual.linha_musica < numero_musicas) {
        musica_atual.linha_musica++;
    } else {
        musica_atual.linha_musica= 0;
    }
    muda_musica(playlist);
    play()
}
function anterior() {
    var numero_musicas = playlist.length - 1;
    if (musica_atual.linha_musica > 0) {
        musica_atual.linha_musica--;
    } else {
        musica_atual.linha_musica = numero_musicas;
    }
    muda_musica(playlist);
    play()
}

function conta_tempo() {

    setInterval(function () {
        tempo_musica = (audio.currentTime / audio.duration) * 100;
        $('#barra_progreso').attr('style', 'width: ' + tempo_musica + '%')
        if (audio.currentTime == audio.duration) {
            proximo();
        }
    }, (1000))
}
function click_musica(id) {
    musica_tocando.id_musica = id;
    var i = 0
    for (; i < playlist.length; i++) {
        if (playlist[i]['id_musica'] === id) {
            musica_atual.linha_musica = i;
            muda_musica(playlist);
            play()
            i = playlist.length;
        }
    }
}