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
float px_i, py_i, vx_i, vy_i, ax_i, desax_i, largura_i, altura_i;
float px, py, vx, vx_limite, vy, ax, desax, largura, altura;

void setup() {
  size(800,800);
  tela = 6;

  // Inicializações padrão do jogador
  px_i = width/2;
  py_i = height/2;
  vx_i = 7;
  vy_i = 0;
  ax_i = 0.6;
  desax_i = ax_i * 4;
  largura_i = 75;
  altura_i = 75;

  // Inicializações do jogador
  px = px_i;
  py = py_i;
  vx = 0;
  vx_limite = 20; // Velocidade em que o jogador para de acelerar
  vy = 0;
  ax = ax_i;
  desax = desax_i;
  largura = largura_i;
  altura = altura_i;
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
    // Move o personagem quando alguma tecla é pressionada
    if (keyPressed == true) {
      // Movimento para a direita
      if (key == 'd' || key == 'D') {
        if (vx < 0) {
          vx = 0;
        }
        if (vx == 0) {
          vx = vx_i;
        }
        else if (vx < vx_limite) {
          vx += ax;
        }
      }
      // Movimento para a esquerda
      if (key == 'a' || key == 'A') {
        if (vx > 0) {
          vx = 0;
        }
        if (vx == 0) {
          vx = -vx_i;
        }
        else if (vx > -vx_limite) {
          vx += -ax;
        }
      }
    }
    
    // Desacelera o personagem quando nenhuma tecla está pressionada
    if (keyPressed == false) {
      // Desaceleração quando se move para a direita
      if (vx > 0) {
        if (vx < desax) {
          vx = 0;
        }
        else {
          vx -= desax;
        }
      }
      // Desaceleração quando se move para a esquerda
      if (vx < 0) {
        if (vx > desax) {
          vx = 0;
        }
        else {
          vx -= -desax;
        }
      }
    }
    px += vx;

    // Desenha o personagem e o cenário na tela
    background (0);
    fill (255);
    noStroke ();
    rectMode (CENTER);
    rect (px, py, largura, altura);
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
