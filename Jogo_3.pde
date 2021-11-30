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
float px_i, py_i, vx_i, ax_i, desax_i, vy_i, g_i, largura_i, altura_i;
float px, py, vx, vx_limite, ax, desax, vy, g, largura, altura;
boolean pode_pular;
PImage sprite;
char t_d_min_i, t_d_mai_i; // Teclas iniciais de controle 
char t_d_min, t_d_mai; // Teclas executivas de controle

void setup() {
  size(800,800);
  tela = 6;

  // Inicializações padrão do jogador
  largura_i = 42;
  altura_i = 60;
  px_i = width/2;
  py_i = height/2;
  vx_i = 7;
  //vy_i = 14;
  //ax_i = 0.6;
  //desax_i = ax_i * 4;
  //g_i = 0.5;
  t_d_min_i = 'd';
  t_d_mai_i = 'D'; 

  // Inicializações do jogador
  sprite = loadImage ("SMWSmallMarioSprite.png");
  largura = largura_i;
  altura = altura_i;
  px = px_i;
  py = py_i;
  vx = 0;
  //vx_limite = 20; // Velocidade em que o jogador para de acelerar
  //vy = 0;
  //ax = ax_i;
  //desax = desax_i;
  //g = g_i;
  //pode_pular = true;
  t_d_min = t_d_min_i;
  t_d_mai = t_d_mai_i; 
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
    //// Impede o personagem de sair da tela por baixo
    //if (py >= height - altura/2) {
    //  vy = 0;
    //  py = height - altura/2;
    //  pode_pular = true;
    //}
    
    // Move o personagem quando alguma tecla é pressionada
    if (keyPressed == true) {
      // Movimento para a direita
      if (key == t_d_min || key == t_d_mai) {
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
      //// Movimento para a esquerda
      //if (key == 'a' || key == 'A') {
      //  if (vx > 0) {
      //    vx = 0;
      //  }
      //  if (vx == 0) {
      //    vx = -vx_i;
      //  }
      //  else if (vx > -vx_limite) {
      //    vx += -ax;
      //  }
      //}
      // Movimento de pulo
      //if (key == 'w' || key == 'W') {
      //  if (vy == 0 && pode_pular == true) {
      //    vy = vy_i;
      //    pode_pular = false;
      //  }
      //}
    }
    
    //// Desacelera vx do personagem quando nenhuma tecla está pressionada
    //if (keyPressed == false) {
    //  // Desaceleração quando se move para a direita
    //  if (vx > 0) {
    //    if (vx < desax) {
    //      vx = 0;
    //    }
    //    else {
    //      vx -= desax;
    //    }
    //  }
    //  // Desaceleração quando se move para a esquerda
    //  if (vx < 0) {
    //    if (vx > desax) {
    //      vx = 0;
    //    }
    //    else {
    //      vx -= -desax;
    //    }
    //  }
    //}

  //// Ação da gravidade
  //vy -= g;

  // Atualiza a posição do personagem
  px += vx;
  py += -vy; // vy é negativo porque y aumenta para baixo no Processing

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

  // Desenha o personagem e o cenário na tela
  background (235);
  imageMode (CENTER);
  image (sprite, px, py, largura, altura);
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
