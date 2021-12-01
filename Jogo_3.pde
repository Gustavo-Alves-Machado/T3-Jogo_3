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
//float vy_i, g_i;
//float vy, g;
//boolean pode_pular;

void setup() {
  size(800,800);
  tela = 6;
  jogador = new Personagem ();

  // Inicializações padrão do jogador
  //vy_i = 14;
  //g_i = 0.5;

  // Inicializações do jogador
  //vy = 0;
  //g = g_i;
  //pode_pular = true;
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
    background (235);
    //// Impede o personagem de sair da tela por baixo
    //if (py >= height - altura/2) {
    //  vy = 0;
    //  py = height - altura/2;
    //  pode_pular = true;
    //}
    
    // Move o personagem quando alguma tecla é pressionada
    if (keyPressed == true) {
      if (jogador.direita()) {
        //fill (255);
        //textSize (100);
        //textAlign (CENTER);
        //text ("Direita", width/2, 100);

        jogador.moveDireita();
      }
      if (jogador.esquerda()) {
        //fill (255);
        //textSize (100);
        //textAlign (CENTER);
        //text ("Esquerda", width/2, 100);

        jogador.moveEsquerda();
      }
      if (jogador.cima()) {
        //fill (255);
        //textSize (100);
        //textAlign (CENTER);
        //text ("Cima", width/2, 100);
      }

      // Movimento de pulo
      //if (key == 'w' || key == 'W') {
      //  if (vy == 0 && pode_pular == true) {
      //    vy = vy_i;
      //    pode_pular = false;
      //  }
      //}
    }
    
    //// Desacelera vx do personagem quando nenhuma tecla está pressionada
    if (keyPressed == false) {
      jogador.freiaX();

      //// Desaceleração quando se move para a direita
      //if (vx > 0) {
      //  if (vx < desax) {
      //    vx = 0;
      //  }
      //  else {
      //    vx -= desax;
      //  }
      //}
      //// Desaceleração quando se move para a esquerda
      //if (vx < 0) {
      //  if (vx > desax) {
      //    vx = 0;
      //  }
      //  else {
      //    vx -= -desax;
      //  }
      //}
    }

  //// Ação da gravidade
  //vy -= g;

  // Atualiza a posição do personagem
  jogador.atualizaPx();
  //jogador.atualizaPy();

  //// Impede o personagem de sair da tela
  //if (px >= width - largura/2) {
  //  px = width - largura/2;
  //}
  //if (px <= largura/2) {
  //  px = largura/2;
  //}
  //if (py <= altura/2) {
  //  py = altura/2;
  //}

  //// Desenha o personagem e o cenário na tela
  //background (235);
  image (jogador.sprite(), jogador.px(), jogador.py(), jogador.largura(), jogador.altura);
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
