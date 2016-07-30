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
  PImage g_denden, g_egg, g_taikoN, g_taikoR, g_taikoL, g_cheken, g_mike;
  eType type;
  boolean isAction;
  int c_renda;
  int c_warm;
  int c_voice;
  int c_slop;
  
  EnigmaMng()
  {
    g_denden = loadImage("taiko.png");
    g_egg =    loadImage("egg00.png");
    g_taikoN = loadImage("taikoN.png");
    g_taikoR = loadImage("taikoR.png");
    g_taikoL = loadImage("taikoL.png");
    g_cheken = loadImage("cheken.png");
    g_mike =   loadImage("mike.png");
  }
  
  
  void Start(eType type)
  {
    this.type = type;
  }


  void Update()
  {
     switch(this.type)
     {
       case Egg:  break;
       case Denden:  break;
       default:  break;
     }
  }
  
  void Draw()
  {
    switch(this.type)
    {
      case Egg:    image(g_egg, 0, 0, displayWidth, displayHeight);     break;
      case Denden: image(g_denden, 0, 0, displayWidth, displayHeight);  break;
      case Taiko:  image(g_taikoN, 0, 0, displayWidth, displayHeight);  break;
      case Dog:    image(g_denden, 0, 0, displayWidth, displayHeight);  break;
      case Eye:    image(g_denden, 0, 0, displayWidth, displayHeight);  break;
      case Mike:    image(g_mike, 0, 0, displayWidth, displayHeight);   break;
      default:  break;
    }
  } 
   
  void Change(eType type){
    this.type = type;
  }
   
   
  boolean Action(){
    return isAction;
  }
}