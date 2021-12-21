class Personagem {
  char t_d_min_i, t_d_mai_i, t_e_min_i, t_e_mai_i, t_c_min_i, t_c_mai_i; // Teclas iniciais de controle
  char t_d_min,   t_d_mai,   t_e_min,   t_e_mai,   t_c_min,   t_c_mai; // Teclas executivas de controle
  float largura_i, altura_i, px_i, py_i, vx_i, ax_i, vx_limite_i, desax_i, vy_i, g_i;
  float largura,   altura,   px,   py,   vx,   ax,   vx_limite,   desax,   vy,   g;
  boolean pode_pular;
  PImage sprite1;
  
  Personagem () {
    // Inicializações padrão
    t_d_min_i = 'd';
    t_d_mai_i = 'D';
    t_e_min_i = 'a';
    t_e_mai_i = 'A';
    t_c_min_i = 'w';
    t_c_mai_i = 'W';
    largura_i = 43;
    altura_i = 78;
    px_i = 200;
    py_i = height/2;
    vx_i = 7;
    ax_i = 0.6;
    vx_limite_i = 20; // Velocidade em que o jogador para de acelerar
    desax_i = ax_i * 4;
    vy_i = 14;
    g_i = 0.5;
    
    //Carrega imagens
     boneco_Esquerda_ = new PImage[numAnimacao];
  for (int contador = 0; contador < numAnimacao; contador = contador + 1) {
    String nomeArquivo = "Boneco_Esquerda_" + str(contador) + ".png"; 
    boneco_Esquerda_[contador] = loadImage(nomeArquivo);
  }
  boneco_Direita_ = new PImage[numAnimacao];
  for (int contador = 0; contador < numAnimacao; contador = contador + 1) {
    String nomeArquivo = "Boneco_Direita_" + str(contador) + ".png"; 
    boneco_Direita_[contador] = loadImage(nomeArquivo);
  }

    // Inicializações executáveis
    t_d_min = t_d_min_i;
    t_d_mai = t_d_mai_i;
    t_e_min = t_e_min_i;
    t_e_mai = t_e_mai_i;
    t_c_min = t_c_min_i;
    t_c_mai = t_c_mai_i;
    largura = largura_i;
    altura = altura_i;
    px = px_i;
    py = py_i;
    vx = 0;
    ax = ax_i;
    vx_limite = vx_limite_i; // Velocidade em que o jogador para de acelerar
    desax = desax_i;
    vy = 0;
    g = g_i;
    pode_pular = true;

    // Inicialização de sprites
    sprite1 = loadImage ("Boneco_Direita_0.png");
  }

  // Verifica quando uma tecla está sendo pressionada
  boolean direita () {
    boolean pressionada = false;
    if (key == t_d_min) {
      pressionada = true;
      sprite1 = boneco_Direita_[frameAtual];
    }
    return pressionada;
  }
  boolean esquerda () {
    boolean pressionada = false;
    if (key == t_e_min || key == t_e_mai) {
      pressionada = true;
      sprite1 = boneco_Esquerda_[frameAtual];
    }
    return pressionada;
  }
  boolean cima () {
    boolean pressionada = false;
    if (key == t_c_min || key == t_c_mai) {
      pressionada = true;
    }
    return pressionada;
  }

  // Muda a velocidade do personagem (voluntariamente)
  void moveDireita () {
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
  void moveEsquerda () {
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
  void pula () {
    if (vy == 0 && pode_pular == true) {
      vy = vy_i;
    }
  }

  // Muda a velocidade do personagem (involuntariamente)
  void freiaVx () {
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
    vx = 0; // Decidimos abandonar a desaceleração lateral por dificultar demais o jogo
  }
  void gravidade () {
    vy -= g;
  }
  
  void colisao (String orientacao, float p) {
    if (orientacao == "horizontal") {
      px = p;
      vx = 0;
    }
    if (orientacao == "vertical") {
      py = p;
      vy = 0;
    }
  }

  // Desenha o personagem na tela
  void imagem (String modo) {
    imageMode (CENTER);
    if (modo == "começo") {
      image (sprite1, px, py, largura, altura);
    }
    if (modo == "meio") {
      image (sprite1, width/2, py, largura, altura);
    }
  }
}
