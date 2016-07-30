import ketai.camera.*;
import ketai.cv.facedetector.*;
import ketai.data.*;
import ketai.net.*;
import ketai.net.bluetooth.*;
import ketai.net.nfc.*;
import ketai.net.nfc.record.*;
import ketai.net.wifidirect.*;
import ketai.sensors.*;
import ketai.ui.*;

import android.view.MotionEvent;
import ketai.ui.*;


// Phone
KetaiGesture gesture;
float Size = 100;

// Enigma
EnigmaMng enigma;

void setup()
{
  size(displayWidth, displayHeight);
//  minim = new Minim(this);
//  se_renda = minim.loadFile("");
  gesture = new KetaiGesture(this);
  enigma = new EnigmaMng();
  
  Initialize();
}


void Initialize()
{
  enigma.Start(eType.Egg);
  float rnd = random(0, 6);
  println(rnd);

  if(0 <= rnd && 1 > rnd)  enigma.Start(eType.Egg);
  if(1 <= rnd && 2 > rnd)  enigma.Start(eType.Denden);
  if(2 <= rnd && 3 > rnd)  enigma.Start(eType.Taiko);
  if(3 <= rnd && 4 > rnd)  enigma.Start(eType.Dog);
  if(4 <= rnd && 5 > rnd)  enigma.Start(eType.Eye);
  if(5 <= rnd && 6 > rnd)  enigma.Start(eType.Mike);
}


void stop()
{
  println("stopped");
}


void draw()
{
  // Clear
  background(128);
  
  // Main
  enigma.Update();
  enigma.Draw();

  // TEST
//  image(img, 0, 0, displayWidth, displayHeight);
}


void onPinch(float x, float y, float d)
{
  Size = constrain(Size+d, 10, 2000);
}


void onTap(float x, float y)
{
  float rnd = random(0, 6);
  println(rnd);

  if(0 <= rnd && 1 > rnd)  enigma.Change(eType.Egg);
  if(1 <= rnd && 2 > rnd)  enigma.Change(eType.Denden);
  if(2 <= rnd && 3 > rnd)  enigma.Change(eType.Taiko);
  if(3 <= rnd && 4 > rnd)  enigma.Change(eType.Dog);
  if(4 <= rnd && 5 > rnd)  enigma.Change(eType.Eye);
  if(5 <= rnd && 6 > rnd)  enigma.Change(eType.Mike);
  
  
  switch(enigma.type)
  {
    case Egg:
      break;
    case Denden:
      break;
    case Taiko:
      break;
    case Dog:
      break;
    case Eye:
      break;
    case Mike:
      break;
  }
}


public boolean surfaceTouchEvent(MotionEvent event)
{
  //call to keep mouseX, mouseY, etc updated
  super.surfaceTouchEvent(event);
  
  //forward event to class for processing
  return gesture.surfaceTouchEvent(event);
}