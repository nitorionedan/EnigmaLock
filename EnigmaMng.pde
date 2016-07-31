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
  final int LimitTime = 1800; // the limit time is about 30 sec
  
  /*these are medias*/
  PImage g_denden,
         g_egg00,
         g_egg01,
         g_taikoN,
         g_taikoR,
         g_taikoL,
         g_mike00,
         g_mike01,
         g_eye00,
         g_eye01,
         g_dog;
  /* now enigma type */
  eType type;
  
  /* if you done correct action, this var switching true */
  boolean isAction;
  
  /* these are counters */
  int c_tap;
  int c_warm;
  int c_voice;
  int c_slop;
  int c_isDark;
  int c_stroke;
  
  /* the limit time */
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
    g_eye00  = loadImage("eye00.png");
    g_eye01  = loadImage("eye01.png");
    g_dog    = loadImage("dog.png");
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
     /* limit time is count down at every frame */
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
    case Egg:    
      image(g_egg00, 0, 0, displayWidth, displayHeight);
      text("warm", 70, 100);
      break;
    
    case Denden:
      image(g_denden, 0, 0, displayWidth, displayHeight);
      text("slop", 70, 100);
      break;
    
    case Taiko:
      if(c_tap == 0)
      {
        image(g_taikoN, 0, 0, displayWidth, displayHeight);
        text("太鼓をたたくドン", 70, 100);
      }
      else
      {
        if(c_tap % 2 == 0)  image(g_taikoL, 0, 0, displayWidth, displayHeight);
        else                image(g_taikoR, 0, 0, displayWidth, displayHeight);
      }
      break;
    
    case Dog:
      image(g_dog, 0, 0, displayWidth, displayHeight);
      text("stroke", 70, 100);
      break;
    
    case Eye:
      if(isAction)  image(g_eye01, 0, 0, displayWidth, displayHeight);
      else          image(g_eye00, 0, 0, displayWidth, displayHeight);
      text("isDark", 70, 100);
      break;
    
    case Mike:
      if(isAction)  image(g_mike01, 0, 0, displayWidth, displayHeight);
      else          image(g_mike00, 0, 0, displayWidth, displayHeight);
      break;
    
    default:  break;
    }
    
//    text("time   = " + limitTime, 70, 500);
//    text("c_slop = " + c_slop, 70, 530);
    
    isAction = false;
  } 
   
   
  void Change(eType type)
  {
    this.type = type;
    Initialize();
  }
  
  
  void RandomChange()
  {
    while(true)
    {
      float rnd = random(0, 6);
      eType temp = eType.Egg;

      if(0 <= rnd && 1 > rnd)  temp = eType.Egg;
      if(1 <= rnd && 2 > rnd)  temp = eType.Denden;
      if(2 <= rnd && 3 > rnd)  temp = eType.Taiko;
      if(3 <= rnd && 4 > rnd)  temp = eType.Dog;
      if(4 <= rnd && 5 > rnd)  temp = eType.Eye;
      if(5 <= rnd && 6 > rnd)  temp = eType.Mike;
      
      if(this.type == temp)  continue;
    
      this.type = temp;
      break;
    } 
    
    Initialize();
  }
  
  
  void Action(eType type)
  {
    if(this.type != type)  return;
    
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