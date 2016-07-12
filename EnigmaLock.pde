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


enum eType
{
  Egg,
  Denden,
  Taiko,
  Dog,
  Eye,
  Mike
}


// Phone
KetaiGesture gesture;
float Size = 100;

// Enigma
EnigmaMng enigma;
PImage img;

void setup()
{
  size(displayWidth, displayHeight);
//  minim = new Minim(this);
//  se_renda = minim.loadFile("");
  img = loadImage("taiko.png");
  gesture = new KetaiGesture(this);
  enigma = new EnigmaMng();
  
  Initialize();
}


void Initialize()
{
  enigma.Start(eType.Egg);
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
  println("tapped" + " " + x);
}


public boolean surfaceTouchEvent(MotionEvent event)
{
  //call to keep mouseX, mouseY, etc updated
  super.surfaceTouchEvent(event);
  
  //forward event to class for processing
  return gesture.surfaceTouchEvent(event);
}