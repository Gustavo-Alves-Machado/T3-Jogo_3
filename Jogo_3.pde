import controlP5.*;

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

SoundFile audio;

float volume, timer, t_inicial, t_passado;
boolean tocando, inGame, timerOn;
int tela, dificuldade, botoesDeDificuldadeSelecionados, delayBotao, LarguraBotao, AlturaBotao;
PImage BotaoStart, BotaoInstrucoes, BotaoX, BotaoConfig, BotaoRetry, BotaoContinuar, BotaoMenu, BotaoTimer;
PImage BotaoStartSelecionado, BotaoInstrucoesSelecionado, BotaoXSelecionado, BotaoConfigSelecionado, BotaoRetrySelecionado, BotaoContinuarSelecionado, BotaoMenuSelecionado, BotaoTimerSelecionado;
PImage BGjogo, BGMenu, BGVitoria, Vitoria, Logo; 
PImage GameOver;

  class Botao {
  int largura, altura, posicaoX, posicaoY, telinha;
  PImage naoSelecionado, Selecionado;
  Botao(PImage nselec, PImage selec, int x, int y, int larg, int alt) {
    largura = larg;
    altura = alt;
    posicaoX = x;
    posicaoY = y;
    Selecionado = selec;
    naoSelecionado = nselec;
  }
  void criarInteracaoTela(int telinha) {
    imageMode (CENTER); 
    image (naoSelecionado, posicaoX, posicaoY, largura, altura);
    if (mouseX < posicaoX + largura/2 && mouseX > posicaoX - largura/2 && mouseY < posicaoY + altura/2 && mouseY > posicaoY - altura/2) {
      image (Selecionado, posicaoX, posicaoY, largura, altura);
      if (mousePressed == true && (mouseButton == LEFT)) { 
        tela = telinha;
      }
    }
  }
  void ligarTempo(){
  if(delayBotao > 0){
    delayBotao  = delayBotao - 1;
  }
  if (timerOn == false){
  image (naoSelecionado, posicaoX, posicaoY, largura, altura);
  }
  if (timerOn == true){
  image (Selecionado, posicaoX, posicaoY, largura, altura);
  }
  if (mouseX < posicaoX + largura/2 && mouseX > posicaoX - largura/2 && mouseY < posicaoY + altura/2 && mouseY > posicaoY - altura/2) {
    if (mousePressed == true && (mouseButton == LEFT)) { 
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
  tela = 9;
  inGame = false;
  timerOn = false;
  delayBotao = 0;
  timer = 0;

  LarguraBotao = 200;
  AlturaBotao = 60;
  
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
  
  //Carregamento de imagens do jogo
  BGjogo = loadImage("BG.png");
  BGMenu = loadImage("BG menu.png");
  BGVitoria = loadImage("BG Vitória.png");
  GameOver = loadImage("Frase de morte.png");
  Vitoria = loadImage("Vitória.png");
  Logo = loadImage("Logo.png");
}

void draw() { 
  //------------------------------TELA PRINCIPAL---------------------------------
  if (tela == 1) {
    imageMode(CORNER);
    image(BGMenu,0,0,width,height);
    imageMode(CENTER);
    image(Logo,width/2+200,height/2,600,600);

    //Configurações dos botões da tela
    Botao botaoStart = new Botao(BotaoStart, BotaoStartSelecionado, 200, 250, LarguraBotao, AlturaBotao);
    botaoStart.criarInteracaoTela(3);

    Botao botaoInstrucoes = new Botao(BotaoInstrucoes, BotaoInstrucoesSelecionado, 200, 400, LarguraBotao, AlturaBotao);
    botaoInstrucoes.criarInteracaoTela(4);

    Botao botaoConfig = new Botao(BotaoConfig, BotaoConfigSelecionado, 200, 550, LarguraBotao, AlturaBotao);
    botaoConfig.criarInteracaoTela(2);
  }
  //------------------------------CONFIGURAÇÕES---------------------------------
  if (tela == 2) { 
    background(121,130,185);

    //Configurações dos botões da tela
    Botao botaoFecharConfiguracoes = new Botao(BotaoX, BotaoXSelecionado, width-50, 50, 30, 30);
    if(inGame == false){
    botaoFecharConfiguracoes.criarInteracaoTela(1);
    } else {
    botaoFecharConfiguracoes.criarInteracaoTela(6);
    
    }
    Botao botaoTimer = new Botao(BotaoTimer, BotaoTimerSelecionado, width/2-400, height/2, 155, 170);
    botaoTimer.ligarTempo();
  }

  //--------------------------EXPLICAÇÕES DA LORE-------------------------------
  if (tela == 3) {
    background(121,130,185);
    Botao botaoContinuarParaJogo = new Botao(BotaoContinuar, BotaoContinuarSelecionado, width/2, height-80, LarguraBotao, AlturaBotao);
    botaoContinuarParaJogo.criarInteracaoTela(6);
    botaoContinuarParaJogo.MexerNoTempo();
  }

  //-------------------------------INSTRUÇÕES-----------------------------------
  if (tela == 4) {
    background(121,130,185);

    //Configurações dos botões da tela
    Botao botaoFecharInstrucoes = new Botao(BotaoX, BotaoXSelecionado, width-50, 50, 30, 30);
    botaoFecharInstrucoes.criarInteracaoTela(1);
  }

  //-------------------------------CONTROLES-----------------------------------
  if (tela == 5) {
  }

  //----------------------------------O JOGO-----------------------------------
  if (tela == 6) {
    inGame = true;
    background(121,130,185);
    
    t_passado = int((millis() - t_inicial)/1000);
    timer = t_passado;
    
    if (timerOn == true){
    textAlign (CENTER,TOP);
    textSize (60);
    fill(255);
    text (str(timer), width-50,50);
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
    
    Botao botaoMenu = new Botao(BotaoMenu, BotaoMenuSelecionado, width/2+200, height/2+300, LarguraBotao, AlturaBotao);
    botaoMenu.criarInteracaoTela(1);
    
    Botao botaoRetry = new Botao(BotaoRetry, BotaoRetrySelecionado, width/2-200, height/2+300, LarguraBotao, AlturaBotao);
    botaoRetry.criarInteracaoTela(6);
    botaoRetry.MexerNoTempo();
    
  }

  //--------------------------------CRÉDITOS------------------------------------
  if (tela == 8) {
    int distancia_nomes = 10;
    int posicaoY_creditos = 0; 
    int vel_creditos = 5;
    background(0);
    textAlign (CENTER);
    textSize (120);
    fill(255);
    for (int contador = 0; contador < 6; contador = contador + 1);
       
  }

  //--------------------------------TELA FINAL-----------------------------------
  if (tela == 9) {
    image(BGVitoria,0,0,width,height);
    imageMode(CENTER);
    image(Vitoria,width/2,350,800,600);
    Botao botaoMenu = new Botao(BotaoMenu, BotaoMenuSelecionado, width/2, height/2+300, LarguraBotao, AlturaBotao );
    botaoMenu.criarInteracaoTela(1);
  }
}
