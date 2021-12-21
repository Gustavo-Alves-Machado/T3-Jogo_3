class Botao {
    float largura, altura, posicaoX, posicaoY;
    int telinha;
    PImage naoSelecionado, Selecionado;
   
    Botao(PImage nselec, PImage selec, float x, float y, float larg, float alt) {
      largura = larg;
      altura = alt;
      posicaoX = x;
      posicaoY = y;
      Selecionado = selec;
      naoSelecionado = nselec;
    }
   
    //Esse método é responsável por criar interação que faz o botão mudar a tela
    void criarInteracaoTela(int telinha) {
      imageMode (CENTER); 
      image (naoSelecionado, posicaoX, posicaoY, largura, altura);
        if (mouseX < posicaoX + largura/2 && mouseX > posicaoX - largura/2 && mouseY < posicaoY + altura/2 && mouseY > posicaoY - altura/2) {
          image (Selecionado, posicaoX, posicaoY, largura, altura);
          if (mousePressed == true && (mouseButton == LEFT)) { 
            tela = telinha;
            if( estaTocandoSelecao == false){
            selecaoMusic.play();
            jogoMusic.stop();
            estaTocandoJogo = false ;
            vitoriaMusic.stop();
            estaTocandoVitoria = false;
            gameoverMusic.stop();
            estaTocandoGameover = false;}
          }
        }
    }
  
    //Esse método é responsável por ligar e desligar o timer
    void ligarTempo(){
      //Faz com que haja um contador para a variável "delay", que evita com que o botão seja clicado 2 vezes instantaneamente
      if(delayBotao > 0){
        delayBotao  = delayBotao - 1;
      }
      
      //Muda o ícone do timer a depender se ele foi selecionado ou não
      if (timerOn == false){
        image (naoSelecionado, posicaoX, posicaoY, largura, altura);
      }
      if (timerOn == true){
        image (Selecionado, posicaoX, posicaoY, largura, altura);
      }
      
      if (mouseX < posicaoX + largura/2 && mouseX > posicaoX - largura/2 && mouseY < posicaoY + altura/2 && mouseY > posicaoY - altura/2) {
        if (mousePressed == true && (mouseButton == LEFT)) {
         
         //Configuração dos efeitos sonoros
         if( estaTocandoSelecao == false){
         selecaoMusic.play();
         jogoMusic.stop();
         estaTocandoJogo = false ;
         vitoriaMusic.stop();
         estaTocandoVitoria = false;
         gameoverMusic.stop();
         estaTocandoGameover = false;}
      
          if (timerOn == false && delayBotao == 0){
            timerOn = true;
            delayBotao = 10;
          }
          if (timerOn == true && delayBotao == 0){
            timerOn = false;
            delayBotao = 10;
          }
        }
      }
    }
    
    //Método responsável por reiniciar o contador de tempo quando se clica em um botão
    void MexerNoTempo(){
      if (mouseX < posicaoX + largura/2 && mouseX > posicaoX - largura/2 && mouseY < posicaoY + altura/2 && mouseY > posicaoY - altura/2) {
        if (mousePressed == true && (mouseButton == LEFT)) { 
          t_inicial = millis();
        }
      }
    }
    
    //Método responsável por reiniciar as informações básicas do jogo para poder jogar novamente
    void reiniciarJogo(){
    vida = 3;
    jogador.px = jogador.px_i;
    jogador.py = jogador.py_i;
    px_mapa = width/2;
    py_mapa = height/2;
    t_menu = 0;
    }
  }
