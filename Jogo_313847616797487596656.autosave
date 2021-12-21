
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

import processing.sound.*;

SoundFile menuMusic;
boolean estaTocandoMenu = false; //variável utilizada para evitar as repetições dos sons dentro do comando "draw"
SoundFile jogoMusic;
boolean estaTocandoJogo = false; //variável utilizada para evitar as repetições dos sons dentro do comando "draw"
SoundFile selecaoMusic;
boolean estaTocandoSelecao = false; //variável utilizada para evitar as repetições dos sons dentro do comando "draw"
SoundFile gameoverMusic;
boolean estaTocandoGameover= false; //variável utilizada para evitar as repetições dos sons dentro do comando "draw"
SoundFile vitoriaMusic;
boolean estaTocandoVitoria= false; //variável utilizada para evitar as repetições dos sons dentro do comando "draw"

float volume, timer, t_inicial, t_passado, t_menu, LarguraBotao, AlturaBotao, posicaoSlider, posicaoPontaSlider;
boolean tocando, inGame, timerOn, ganhou_jogo;
int tela, dificuldade, botoesDeDificuldadeSelecionados, delayBotao, distancia_nomes_creditos, posicaoY_creditos, vel_creditos, contador_creditos, parte_creditos;
int LarguraSlider, AlturaSlider, posicaoYSlider, posicaoXSlider;
PImage BotaoStart, BotaoInstrucoes, BotaoX, BotaoConfig, BotaoRetry, BotaoContinuar, BotaoMenu, BotaoTimer, BotaoCreditos, PontaSlider, PortraitSlider, VolumeON, VolumeOFF;
PImage BotaoStartSelecionado, BotaoInstrucoesSelecionado, BotaoXSelecionado, BotaoConfigSelecionado, BotaoRetrySelecionado, BotaoContinuarSelecionado, BotaoMenuSelecionado, BotaoTimerSelecionado, BotaoCreditosSelecionado;
PImage BGjogo, BGMenu, BGVitoria, Vitoria, Logo, TirinhaLore, TelaCompiuter; 
PImage GameOver;
PImage cafevida;
int vida = 3;

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
  }

void setup() {
  size(1200, 800);
  tela = 1;
  inGame = false;
  timerOn = false;
  delayBotao = 0;
  timer = 0;
  
  //configuração base do volume das músicas
  volume = 0.5;
  
  
  //Configurações base para funcionamento dos créditos
  distancia_nomes_creditos  = 60;
  posicaoY_creditos = height/2;
  vel_creditos = 1;
  contador_creditos = 0;
  ganhou_jogo = false;
  parte_creditos = 0;

  LarguraBotao = 914/3;
  AlturaBotao = 326/3;
  
  //Configurações base de tamanho e localização do Slider de Volume
  LarguraSlider = 300;
  AlturaSlider = 60;
  posicaoSlider = LarguraSlider/2;
  posicaoYSlider = 60 + 80; 
  posicaoXSlider = 60 + 150;
  posicaoPontaSlider = posicaoSlider+posicaoXSlider;
  
  //Carregamento de imagens para os botões
  BotaoStart = loadImage("Start.png");
  BotaoStartSelecionado = loadImage("Start Selecionado.png");
  BotaoInstrucoes = loadImage("Instruções.png");
  BotaoInstrucoesSelecionado = loadImage("Instruções Selecionado.png");
  BotaoX = loadImage("X.png");
  BotaoXSelecionado =  loadImage("X Selecionado.png");
  BotaoConfig =  loadImage("Configurações.png");
  BotaoConfigSelecionado =  loadImage("Configurações Selecionado.png");
  BotaoRetry =  loadImage("Retry.png");
  BotaoRetrySelecionado =  loadImage("Retry Selecionado.png");
  BotaoContinuar  =  loadImage("Continuar.png");
  BotaoContinuarSelecionado  =  loadImage("Continuar Selecionado.png");
  BotaoMenu =  loadImage("Menu.png");
  BotaoMenuSelecionado =  loadImage("Menu Selecionado.png");
  BotaoTimer =  loadImage("Timer.png");
  BotaoTimerSelecionado =  loadImage("Timer Selecionado.png");
  BotaoCreditos = loadImage ("Creditos.png");
  BotaoCreditosSelecionado = loadImage ("Creditos Selecionado.png");
  PontaSlider = loadImage("Ponta Slider.png");
  PortraitSlider = loadImage("Portrait Slider.png");
  VolumeON = loadImage("Volume ON.png");
  VolumeOFF = loadImage("Volume OFF.png");
  
  //Carregamento de imagens do jogo
  BGjogo = loadImage("BG.png");
  BGMenu = loadImage("BG menu.png");
  BGVitoria = loadImage("BG Vitória.png"); 
  TelaCompiuter = loadImage("Compiuter.png");
  GameOver = loadImage("Frase de morte.png");
  Vitoria = loadImage("Vitória.png");
  Logo = loadImage("Logo.png");
  TirinhaLore = loadImage("Lore.png");
  cafevida = loadImage ("cafe.png");
  
  //Carregamento dos arquivos de som
  menuMusic = new SoundFile(this, "musicamenu.mp3"); //carrega a trilha de audio de dentro da pasta "data"
  jogoMusic = new SoundFile(this, "musicajogo.mp3"); //carrega a trilha de audio de dentro da pasta "data"
  selecaoMusic = new SoundFile(this, "musicaselecao.mp3"); //carrega a trilha de audio de dentro da pasta "data"
  gameoverMusic = new SoundFile(this, "musicagameover.mp3"); //carrega a trilha de audio de dentro da pasta "data"
  vitoriaMusic = new SoundFile(this, "musicavitoria.mp3"); //carrega a trilha de audio de dentro da pasta "data"
  
}


void draw() { 
  
  menuMusic.amp(volume);
  jogoMusic.amp(volume);
  selecaoMusic.amp(volume);
  vitoriaMusic.amp(volume);
  gameoverMusic.amp(volume);
  
  //------------------------------TELA PRINCIPAL---------------------------------
  if (tela == 1) {
    imageMode(CORNER);
    image(BGMenu,0,0,width,height);
    imageMode(CENTER);
    image(Logo,width/2-200,height/2,600,600);
    
    //Configur~ção dos efeitos sonoros
    if (tela == 1 && estaTocandoMenu == false) {
      menuMusic.loop();
      estaTocandoMenu = true;
      jogoMusic.stop();
      estaTocandoJogo = false;
      selecaoMusic.stop();
      estaTocandoSelecao= false;
      vitoriaMusic.stop();
      estaTocandoVitoria = false;
      gameoverMusic.stop();
      estaTocandoGameover = false;}

    //Configurações dos botões da tela
    Botao botaoStart = new Botao(BotaoStart, BotaoStartSelecionado, width-260, 250, LarguraBotao, AlturaBotao);
    botaoStart.criarInteracaoTela(3);

    Botao botaoConfig = new Botao(BotaoConfig, BotaoConfigSelecionado, width-260, 400, LarguraBotao, AlturaBotao);
    botaoConfig.criarInteracaoTela(2);

    Botao botaoInstrucoes = new Botao(BotaoInstrucoes, BotaoInstrucoesSelecionado, width-260, 550, LarguraBotao, AlturaBotao);
    botaoInstrucoes.criarInteracaoTela(4);

  }
  //------------------------------CONFIGURAÇÕES---------------------------------
  if (tela == 2) { 
    background(121,130,185);
    imageMode(CENTER);
    image(TelaCompiuter,width/2,height/2,1150*1.04,775*1.04);
    
    //Slider de Volume 
    fill(77,86,206);
    rect(posicaoXSlider-1, posicaoYSlider+1, posicaoSlider, AlturaSlider-2,30);
    imageMode(CORNER);
    image(PortraitSlider, posicaoXSlider-10, posicaoYSlider, LarguraSlider+20, AlturaSlider);
    imageMode(CENTER);
    image(PontaSlider, posicaoPontaSlider,posicaoYSlider + AlturaSlider/2,30,90);
      if (mouseX < posicaoXSlider + LarguraSlider && mouseX > posicaoXSlider && mouseY <  posicaoYSlider + AlturaSlider && mouseY >  posicaoYSlider) {
        if (mousePressed == true && (mouseButton == LEFT)){
          posicaoSlider = mouseX - posicaoXSlider;
          posicaoPontaSlider = mouseX;
        }
      }
      volume = posicaoSlider/300;
      
    //Muda o ícone de volume caso o slider atinja 0
    if(volume>0.015){
      image(VolumeON,  posicaoXSlider - 60, posicaoYSlider + AlturaSlider/2, 70, 70);
    } else {
      image(VolumeOFF, posicaoXSlider - 60, posicaoYSlider + AlturaSlider/2, 70, 70);
    }
      
    //Configurações dos botões da tela
    Botao botaoFecharConfiguracoes = new Botao(BotaoX, BotaoXSelecionado, width-100, 100, 50, 50);
    if(inGame == false){
      botaoFecharConfiguracoes.criarInteracaoTela(1);
    } else {
      botaoFecharConfiguracoes.criarInteracaoTela(6);
      t_menu = int((millis() - t_inicial)/1000) - t_passado;
    }
    
    Botao botaoTimer = new Botao(BotaoTimer, BotaoTimerSelecionado, width/2-350, height/2-30, 170, 170);
    botaoTimer.ligarTempo();
    
    Botao botaoCreditos = new Botao(BotaoCreditos, BotaoCreditosSelecionado, 100+LarguraBotao/2, height/2+200, LarguraBotao, AlturaBotao);
    botaoCreditos.criarInteracaoTela(8);
  }

  //--------------------------EXPLICAÇÕES DA LORE-------------------------------
  if (tela == 3) {
    background(121,130,185);
    imageMode(CENTER);
    image(TirinhaLore,width/2,height/2,1150*1.04,775*1.04);
    Botao botaoContinuarParaJogo = new Botao(BotaoContinuar, BotaoContinuarSelecionado, width/2, height-55, LarguraBotao/2, AlturaBotao/2);
    botaoContinuarParaJogo.criarInteracaoTela(6);
    botaoContinuarParaJogo.MexerNoTempo();
  }

  //-------------------------------INSTRUÇÕES-----------------------------------
  if (tela == 4) {
    background(121,130,185);
    imageMode(CENTER);
    image(TelaCompiuter,width/2,height/2,1150*1.04,775*1.04);

    Botao botaoFecharInstrucoes = new Botao(BotaoX, BotaoXSelecionado, width-100, 100, 50, 50);
    botaoFecharInstrucoes.criarInteracaoTela(1);
  }

  //-------------------------------CONTROLES-----------------------------------
  if (tela == 5) {
  }

  //----------------------------------O JOGO-----------------------------------
  if (tela == 6) {
    inGame = true;
    background(121,130,185);
    
    //Faz com que as imagens de café apareçam na tela
    for (int i = 0; i < vida; i++)
    {image(cafevida,80 + i * 80, 80);}
  
    //Muda para a tela de Game Over quando acabam-se as vidas
    if(vida == 0){
    tela = 7;}
    
    //if( Personagem bate em um ladrilho ruim){
    //vida = vida - 1;}
    
    //Configur~ção dos efeitos sonoros
    if (tela == 6 && estaTocandoJogo == false) {
      jogoMusic.loop();
      estaTocandoJogo = true;
      menuMusic.stop();
      estaTocandoMenu = false;
      selecaoMusic.stop();
      estaTocandoSelecao= false;
      vitoriaMusic.stop();
      estaTocandoVitoria = false;
      gameoverMusic.stop();
      estaTocandoGameover = false;}
   
    t_passado = int((millis() - t_inicial)/1000) - t_menu;
    timer = t_passado;
    
    if (timerOn == true){
      textAlign (CENTER,TOP);
      textSize (30);
      fill(255);
      text (str(timer), width-50,20);
    }
    
    if (keyPressed == true){
      if (key == 'T'){
        tela = 2; 
      }
    }
  }

  //--------------------------------GAME OVER-----------------------------------
  if (tela == 7) {
    imageMode (CORNER);
    image (BGjogo,0,0,width,height);
    filter(GRAY);
    image (GameOver,0,height/2-290/2,width,290);
    
    //Configur~ção dos efeitos sonoros
    if (tela == 7 && estaTocandoGameover == false) {
      gameoverMusic.loop();
      estaTocandoGameover = true;
      jogoMusic.stop();
      estaTocandoJogo = false;
      selecaoMusic.stop();
      estaTocandoSelecao= false;
      vitoriaMusic.stop();
      estaTocandoVitoria = false;
      menuMusic.stop();
      estaTocandoMenu = false;}
    
    Botao botaoMenu = new Botao(BotaoMenu, BotaoMenuSelecionado, width/2+200, height/2+300, LarguraBotao, AlturaBotao);
    botaoMenu.criarInteracaoTela(1);
    
    Botao botaoRetry = new Botao(BotaoRetry, BotaoRetrySelecionado, width/2-200, height/2+300, LarguraBotao, AlturaBotao);
    botaoRetry.criarInteracaoTela(6);
    botaoRetry.MexerNoTempo();
  }

  //--------------------------------CRÉDITOS------------------------------------
 
  
  if (tela == 8) {
    if (parte_creditos == 0){
      contador_creditos = contador_creditos + 1;
      if (contador_creditos == 20){
        parte_creditos = 1;
        contador_creditos = 0;
      }
    }
    
    //Permite com que o jogador acelere a passagem dos créditos
    if (keyPressed == true){
      if (key == 'A' | key == 'a'){
        vel_creditos = 6; 
      }
    } else {
        vel_creditos = 1;
      }
      
      //Configura os efeitos sonoros
      if (tela == 9  && estaTocandoVitoria == false) {
      vitoriaMusic.loop();
      estaTocandoVitoria = true;
      jogoMusic.stop();
      estaTocandoJogo = false;
      selecaoMusic.stop();
      estaTocandoSelecao= false;
      menuMusic.stop();
      estaTocandoMenu = false;
      gameoverMusic.stop();
      estaTocandoGameover = false;}

   
    //Configura o posicionamento de todas as informações dos créditos
    background(0);
    textAlign (CENTER);
    textSize (60);
    fill(255);
    text ("NOME DO JOGO" , width/2,posicaoY_creditos - 150);
    textSize (30);
    text ("Arthur Siviero - Programação, Game design", width/2,posicaoY_creditos);
    text ("Everton Bela - Arte, Animações", width/2,posicaoY_creditos+distancia_nomes_creditos);
    text ("Gustavo Machado - Programação, UI design", width/2,posicaoY_creditos+distancia_nomes_creditos*2);
    text ("Vitoria Campos - Arte, música", width/2,posicaoY_creditos+distancia_nomes_creditos*3);
    textSize (90);
    text ("MUITO OBRIGADO!", width/2,posicaoY_creditos+distancia_nomes_creditos*10.75);
    
    if (parte_creditos == 1){
      if (posicaoY_creditos > -200){
        posicaoY_creditos = posicaoY_creditos - vel_creditos;
      } else {
        contador_creditos = contador_creditos + 1;  
      }
      if (contador_creditos == 120){
        if (ganhou_jogo==true){
          tela = 1;
          contador_creditos = 0;
          parte_creditos = 0;
          posicaoY_creditos = height/2;
       } else {
           tela = 2;
           contador_creditos = 0;
           parte_creditos = 0;
           posicaoY_creditos = height/2;
       }
      }
    }
  }
    
  //--------------------------------TELA FINAL-----------------------------------
  if (tela == 9) {
    image(BGVitoria,0,0,width,height);
    imageMode(CENTER);
    image(Vitoria,width/2,350,800,600);
    Botao botaoMenu = new Botao(BotaoMenu, BotaoMenuSelecionado, width/2, height/2+300, LarguraBotao, AlturaBotao );
    botaoMenu.criarInteracaoTela(1);
  }
      //Configur~ção dos efeitos sonoros
    if (tela == 9  && estaTocandoVitoria == false) {
      vitoriaMusic.loop();
      estaTocandoVitoria = true;
      jogoMusic.stop();
      estaTocandoJogo = false;
      selecaoMusic.stop();
      estaTocandoSelecao= false;
      menuMusic.stop();
      estaTocandoMenu = false;
      gameoverMusic.stop();
      estaTocandoGameover = false;}
}
