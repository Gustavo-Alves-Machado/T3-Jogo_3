class Personagem {
  float largura_i, altura_i, px_i, py_i, vx_i, ax_i, vx_limite_i, desax_i;
  float largura,   altura,   px,   py,   vx,   ax,   vx_limite,   desax;
  char t_d_min_i, t_d_mai_i, t_e_min_i, t_e_mai_i, t_c_min_i, t_c_mai_i; // Teclas iniciais de controle
  char t_d_min,   t_d_mai,   t_e_min,   t_e_mai,   t_c_min,   t_c_mai; // Teclas executivas de controle
  PImage sprite1;
  
  Personagem () {
    // Inicializações padrão
    largura_i = 42;
    altura_i = 60;
    px_i = width/2;
    py_i = height/2;
    vx_i = 7;
    ax_i = 0.6;
    vx_limite_i = 20; // Velocidade em que o jogador para de acelerar
    desax_i = ax_i * 4;
    t_d_min_i = 'd';
    t_d_mai_i = 'D';
    t_e_min_i = 'a';
    t_e_mai_i = 'A';
    t_c_min_i = 'w';
    t_c_mai_i = 'W';

    // Inicializações executáveis
    largura = largura_i;
    altura = altura_i;
    px = px_i;
    py = py_i;
    vx = 0;
    ax = ax_i;
    vx_limite = vx_limite_i; // Velocidade em que o jogador para de acelerar
    desax = desax_i;
    t_d_min = t_d_min_i;
    t_d_mai = t_d_mai_i;
    t_e_min = t_e_min_i;
    t_e_mai = t_e_mai_i;
    t_c_min = t_c_min_i;
    t_c_mai = t_c_mai_i;

    // Inicialização de sprites
    sprite1 = loadImage ("SMWSmallMarioSprite.png");
  }

  // Retorna atributos do personagem
  float largura () {
    return largura;
  }
  float altura () {
    return altura;
  }
  float px () {
    return px;
  }
  float py () {
    return py;
  }
  PImage sprite () {
    return sprite1;
  }

  // Verifica quando uma tecla está sendo pressionada
  boolean direita () {
    boolean pressionada = false;
    if (key == t_d_min) {
      pressionada = true;
    }
    return pressionada;
  }
  boolean esquerda () {
    boolean pressionada = false;
    if (key == t_e_min || key == t_e_mai) {
      pressionada = true;
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

  // Muda a posição do personagem
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

  void freiaX () {
    vx = 0;
  }

  // Atualiza a posição do personagem
  void atualizaPx () {
    px += vx;
  }
  //void atualizaPy () {
  //  py += -vy; // vy é negativo porque y aumenta para baixo no Processing
  //}
}
