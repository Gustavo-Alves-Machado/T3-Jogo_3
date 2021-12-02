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
    
    jogador.dentroDaTela("lado inferior");

    if (keyPressed == true) {
      if (jogador.direita()) {
        jogador.moveDireita();
      }
      if (jogador.esquerda()) {
        jogador.moveEsquerda();
      }
      if (jogador.cima()) {
        jogador.moveCima();
        jogador.podePular(false);
      }
    }
    
    if (keyPressed == false) {
      jogador.freiaVx();
    }

    jogador.atualizaPx();
    jogador.atualizaPy();

    jogador.dentroDaTela("lado direito");
    jogador.dentroDaTela("lado esquerdo");
    jogador.dentroDaTela("lado superior");

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
