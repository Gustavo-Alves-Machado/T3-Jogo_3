/*
FAU USP – Design T15 – 2021
PCS3021 - Linguagem Computacional
Prof. Ricardo Nakamura
Monitor Leonardo Prates Marques

TRABALHO FINAL

INTEGRANTES DO GRUPO
Arthur Siviero da Silva – 11832750
Everton Bela de Jesus Costa – 11841419
Gustavo Alves Machado – 11761507
Vitória Campos Moreira Tavares – 11761581
*/

// --------------------------------------- NOME DO JOGUINHO ----------------------------------------
import ptmx.*;
Ptmx mapa;
int tela, px_mapa, py_mapa;
float [] tile_colisao_coordenadas, tile_tamanho, mapa_tamanho;
Personagem jogador;

void setup() {
  size(1200,800);
  tela = 6;
  jogador = new Personagem ();

  mapa = new Ptmx (this, "mapa_blocos.tmx");
  mapa.setBackgroundMode("NONE");
  mapa.setDrawMode (CENTER);
  mapa.setPositionMode ("CANVAS");
  px_mapa = int(width/2);
  py_mapa = int(height/2);
  tile_tamanho = mapa.getTileSize().array();
  mapa_tamanho = mapa.getMapSize().array();
  mapa_tamanho [0] *= tile_tamanho [0];
  mapa_tamanho [1] *= tile_tamanho [1];
  imageMode(CENTER);
  }

void draw(){ 
  //------------------------------TELA PRINCIPAL---------------------------------
  if (tela == 1){
  }

  //------------------------------CONFIGURAÇÕES---------------------------------
  if (tela == 2){   
  }
  
  //--------------------------EXPLICAÇÕES DA LORE-------------------------------
  if (tela == 3){
  }
  
  //-------------------------------INSTRUÇÕES-----------------------------------
  if (tela == 4){
  }
  
  //-------------------------------CONTROLES-----------------------------------
  if (tela == 5){
  }
  
  //----------------------------------O JOGO-----------------------------------
  if (tela == 6){
    
    // Colisão com plataforma abaixo
    tile_colisao_coordenadas = mapa.canvasToMap(round(jogador.px), round(jogador.py + jogador.altura/2)).array();
    switch(mapa.getTileIndex(0, round(tile_colisao_coordenadas [0]), round(tile_colisao_coordenadas [1]))) {
      case 0: case 1:
        jogador.colisao("vertical", (tile_tamanho [1] * tile_colisao_coordenadas [1]) - tile_tamanho[1]/9); // Não encontrei um py aqui que tornasse a colisão 100% estável
        jogador.pode_pular = true;
        break;
      default:
        jogador.gravidade();
        break;
    }
    // Colisão com o lado inferior da tela
    if (jogador.py >= height - jogador.altura/2) {
      jogador.colisao ("vertical", height - jogador.altura/2);
      jogador.pode_pular = true;
    }

    if (keyPressed == true) {
      if (jogador.direita()) {
        jogador.moveDireita();
      }
      if (jogador.esquerda()) {
        jogador.moveEsquerda();
      }
      if (jogador.cima()) {
        jogador.pula();
        jogador.pode_pular = false;
      }
    }
    
    if (keyPressed == false) {
      jogador.freiaVx();
    }

    // Atualiza a posição do jogador
    jogador.px += jogador.vx;
    jogador.py -= jogador.vy; // Aqui vy é subtraído para facilitar o raciocínio, porque o eixo y diminui para cima no Processing

    // Colisão com plataforma à direita
    tile_colisao_coordenadas = mapa.canvasToMap(round(jogador.px + jogador.largura/2), round(jogador.py)).array();
    switch(mapa.getTileIndex(0, round(tile_colisao_coordenadas [0]), round(tile_colisao_coordenadas [1]))) {
      case 0: case 1:
        jogador.colisao("horizontal", (tile_tamanho [0] * tile_colisao_coordenadas [0]) - 3);
    }
    // Colisão com plataforma à esquerda
    tile_colisao_coordenadas = mapa.canvasToMap(round(jogador.px - jogador.largura/2), round(jogador.py)).array();
    switch(mapa.getTileIndex(0, round(tile_colisao_coordenadas [0]), round(tile_colisao_coordenadas [1]))) {
      case 0: case 1:
        jogador.colisao("horizontal", (tile_tamanho [0] * (tile_colisao_coordenadas [0] + 1)) + 3);
    }
    // Colisão com plataforma acima
    tile_colisao_coordenadas = mapa.canvasToMap(round(jogador.px), round(jogador.py - jogador.altura/2)).array();
    switch(mapa.getTileIndex(0, round(tile_colisao_coordenadas [0]), round(tile_colisao_coordenadas [1]))) {
      case 0: case 1:
        jogador.colisao("vertical", (tile_tamanho [0] * (tile_colisao_coordenadas [0] + 1)) + 15);
    }
    // Colisão com as extremidades superior e laterais da tela
    if (jogador.px >= mapa_tamanho[0] - jogador.largura/2) {
      jogador.colisao("horizontal", mapa_tamanho[0] - jogador.largura/2);
    }
    if (jogador.px <= jogador.largura/2) {
      jogador.colisao("horizontal", jogador.largura/2);
    }
    if (jogador.py <= jogador.altura/2) {
      jogador.colisao("vertical", jogador.altura/2);
    }

    background (235);
    if (jogador.px <= width/2) {
      jogador.imagem("começo");
    }
    else if (jogador.px >= mapa_tamanho[0] - width/2) {
      image (jogador.sprite1, jogador.px - (mapa_tamanho[0] - width), jogador.py, jogador.largura, jogador.altura);
    }
    else {
      jogador.imagem("meio");
      px_mapa = int (jogador.px);
    }
    mapa.draw (px_mapa, py_mapa);
    
    // APAGAR - Mostra coordenadas do jogador na tela
    fill (0);
    textSize (24);
    text ("px = " + str(round(jogador.px)), 100, 50);
    text ("py = " + str(round(jogador.py)), 100, 85);
    text (int(tile_colisao_coordenadas[0]), 200, 50);
    text (int(tile_colisao_coordenadas[1]), 200, 85);
    text ("tipo de bloco: " + str(mapa.getTileIndex(0, round(tile_colisao_coordenadas [0]), round(tile_colisao_coordenadas [1]))), 100, 150);
  }
  
  //--------------------------------GAME OVER-----------------------------------
  if (tela == 7){
  }
  
  //--------------------------------CRÉDITOS------------------------------------
  if (tela == 8){
  }
  
  //--------------------------------TELA FINAL-----------------------------------
  if (tela == 9){
  }
}
