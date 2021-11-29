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

import controlP5.*;
import processing.sound.*;

SoundFile audio;
ControlP5 cp5;

float volume;
boolean tocando;
int tela, LargBotao, AltBotao;


void setup() {
  size(800,800);
  tela = 1;
  cp5 = new ControlP5(this);
  LargBotao = 200;
  AltBotao = 50;
  }

void draw(){ 
  //------------------------------TELA PRINCIPAL---------------------------------
  if (tela == 1){
    background(255);

    //Botão que leva para configurações
    Button config = cp5.addButton("config");
    config.setPosition(width/2-LargBotao/2, height/2+AltBotao+20);
    config.setSize(LargBotao, AltBotao);
    config.setCaptionLabel("Config");
    
     //Botão que leva para play
    Button play = cp5.addButton("play");
    play.setPosition(width/2-LargBotao/2, height/2);
    play.setSize(LargBotao, 50);
    play.setCaptionLabel("play");
  }

  //------------------------------CONFIGURAÇÕES---------------------------------
  if (tela == 2){ 
    background(255);
    //Slider de volume
    Slider volume = cp5.addSlider("volume");
    volume.setPosition(20, 60);
    volume.setSize(360, 30);
    volume.setMin(0);
    volume.setMax(1);
    volume.setCaptionLabel("volume:");
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

  //Seta o funcionamento dos botões
  void config() {
  tela = 2;
  }
 
