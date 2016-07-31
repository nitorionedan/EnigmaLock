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
KetaiSensor sensor;
KetaiAudioInput mic;
float Size = 100;

// Enigma
EnigmaMng enigma;
float fingerX, fingerY;


void setup()
{
  size(displayWidth, displayHeight);
  gesture = new KetaiGesture(this);
  sensor = new KetaiSensor(this);
  mic = new KetaiAudioInput(this);
  enigma = new EnigmaMng();
  
  sensor.enableAccelerometer();
  sensor.enableGyroscope();
  sensor.enableOrientation();
  sensor.enableLight();
  sensor.start();
  mic.start();
  
  fill(0);
  textSize(80);
  
  Initialize();
}


void Initialize()
{
  //float rnd = random(0, 6);
  //println(rnd);

  //if(0 <= rnd && 1 > rnd)  enigma.Start(eType.Egg);
  //if(1 <= rnd && 2 > rnd)  enigma.Start(eType.Denden);
  //if(2 <= rnd && 3 > rnd)  enigma.Start(eType.Taiko);
  //if(3 <= rnd && 4 > rnd)  enigma.Start(eType.Dog);
  //if(4 <= rnd && 5 > rnd)  enigma.Start(eType.Eye);
  //if(5 <= rnd && 6 > rnd)  enigma.Start(eType.Mike);
  
  enigma.Start(eType.Dog);
}


void stop()
{
  mic.stop();
  println("stopped");
}


void draw()
{
  // reset
  fingerX = 0f;
  fingerY = 0f;
  
  // clear
  background(128);
  
  // Main
  enigma.Update();
  enigma.Draw();
}


void onPinch(float x, float y, float d)
{
//  Size = constrain(Size + d, 10, 2000);  
}


void onTap(float x, float y)
{ 
  if(y > 697 && y < 907)  enigma.Action(eType.Taiko);
}


int count = 0;
void onAccelerometerEvent(float x, float y, float z)
{
  float AX = abs(x);
  float AY = abs(y);
  float AZ = abs(z);
  
  final boolean isShake = (AX > 15f || AY > 15f || AZ > 15f);
  
  if(isShake)  enigma.Action(eType.Denden);
}


void onGyroscopeEvent(float x, float y, float z)
{
//  println("(" + x + ", " + y + ", " + z + ")");
}

int c = 0;
void onAudioEvent(short[] _data)
{
  c++;
  println(c + ": ok");
}


public boolean surfaceTouchEvent(MotionEvent event)
{
  //call to keep mouseX, mouseY, etc updated
  super.surfaceTouchEvent(event);
  
  //forward event to class for processing
  return gesture.surfaceTouchEvent(event);
}