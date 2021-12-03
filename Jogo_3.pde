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
int tela;
Personagem jogador;

void setup() {
  size(800,800);
  tela = 6;
  jogador = new Personagem ();
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

    jogador.gravidade();
    
    // Impede o jogador de sair do lado inferior da tela
    if (jogador.py >= height - jogador.altura/2) {
      jogador.colisao ("lado inferior", height - jogador.altura/2);
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

    // Impede o jogador de sair dos outros lados da tela
    if (jogador.px >= width - jogador.largura/2) {
      jogador.colisao("lado direito", width - jogador.largura/2);
    }
    if (jogador.px <= jogador.largura/2) {
      jogador.colisao("lado esquerdo", jogador.largura/2);
    }
    if (jogador.py <= jogador.altura/2) {
      jogador.colisao("lado superior", jogador.altura/2);
    }

    background (235);
    jogador.imagem();
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
