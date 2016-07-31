enum eType
{
  Egg,
  Denden,
  Taiko,
  Dog,
  Eye,
  Mike,
}


class EnigmaMng
{
  final int LimitTime = 1800;
  
  PImage g_denden,
         g_egg00,
         g_egg01,
         g_taikoN,
         g_taikoR,
         g_taikoL,
         g_mike00,
         g_mike01,
         g_eye,
         g_dog;
  eType type;
  boolean isAction;
  int c_tap;
  int c_warm;
  int c_voice;
  int c_slop;
  int c_isDark;
  int c_stroke;
  int limitTime;
  
  EnigmaMng()
  {
    g_denden = loadImage("taiko.png");
    g_egg00 =  loadImage("egg00.png");
    g_egg01 =  loadImage("egg01.png");
    g_taikoN = loadImage("taikoN.png");
    g_taikoR = loadImage("taikoR.png");
    g_taikoL = loadImage("taikoL.png");
    g_mike00 = loadImage("mike00.png");
    g_mike01 = loadImage("mike01.png");
    g_eye    = loadImage("eye.png");
    g_dog    = loadImage("mikky.png");
    Initialize();
  }
  
  
  void Initialize()
  {
    c_tap = 0;
    c_warm = 0;
    c_voice = 0;
    c_slop = 0;
    c_isDark = 0;
    c_stroke = 0;
    limitTime = LimitTime;
    isAction = false;
  }
  
  
  void Start(eType type)
  {
    this.type = type;
  }


  void Update()
  {
     limitTime--;
     if(limitTime == 0)  RandomChange();
    
     switch(this.type)
     {
     case Egg:
       if(c_warm > 180)
       {
         exit();
       }
       break;
       
     case Denden:
     if(c_slop > 30)  exit();
     break;
     
     case Taiko:
       if(c_tap > 20)  exit();
       break;
       
     case Dog:
       if(c_stroke > 180)
       {
         exit();
       }
       break;
     
     case Eye:
       if(c_isDark > 180)
       {
         exit();
       }
       break;
     
     case Mike:
       if(c_voice > 180)
       {
         exit();
       }
       break;
     
     default:  break;
     }
  }
  
  void Draw()
  {
    switch(this.type)
    {
    case Egg:    image(g_egg00, 0, 0, displayWidth, displayHeight);   break;
    
    case Denden: image(g_denden, 0, 0, displayWidth, displayHeight);  break;
    
    case Taiko:
      if(c_tap == 0)
      {
        image(g_taikoN, 0, 0, displayWidth, displayHeight);
        textSize(80);
        fill(0);
        text("太鼓をたたくドン", 70, 100);
      }
      else
      {
        if(c_tap % 2 == 0)  image(g_taikoL, 0, 0, displayWidth, displayHeight);
        else                image(g_taikoR, 0, 0, displayWidth, displayHeight);
      }
      break;
    
    case Dog:    image(g_denden, 0, 0, displayWidth, displayHeight);  break;
    
    case Eye:    image(g_denden, 0, 0, displayWidth, displayHeight);  break;
    
    case Mike:
      if(isAction)  image(g_mike00, 0, 0, displayWidth, displayHeight);
      else          image(g_mike00, 0, 0, displayWidth, displayHeight);
      break;
    
    default:  break;
    }
    
    isAction = false;
  } 
   
   
  void Change(eType type){
    this.type = type;
    Initialize();
  }
  
  
  void RandomChange()
  {
    float rnd = random(0, 6);

    if(0 <= rnd && 1 > rnd)  Change(eType.Egg);
    if(1 <= rnd && 2 > rnd)  Change(eType.Denden);
    if(2 <= rnd && 3 > rnd)  Change(eType.Taiko);
    if(3 <= rnd && 4 > rnd)  Change(eType.Dog);
    if(4 <= rnd && 5 > rnd)  Change(eType.Eye);
    if(5 <= rnd && 6 > rnd)  Change(eType.Mike);
    
    Initialize();
  }
  
  
  void Action(eType type)
  {
    switch(type)
    {
    case Egg:
      c_warm++;
      println("onWarm");
      break;
    case Denden:
      c_slop++;
      //println("onShake");
      break;
    case Taiko:
      c_tap++;
      //println("onTap");
      break;
    case Dog:
      println("onStroke");
      c_stroke++;
      break;
    case Eye:
      println("onDark");
      c_isDark++;
      break;
    case Mike:
      println("onVoice");
      c_voice++;
      break;
    default:  break;
    }
    
    isAction = true;
  }
   
   
  boolean isAction(){
    return isAction;
  }
}