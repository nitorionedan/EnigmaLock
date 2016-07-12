class EnigmaMng
{
  PImage g_denden, g_egg;
  eType type;
  boolean isAction;
  
  EnigmaMng()
  {
    g_denden = loadImage("taiko.png");
    g_egg = loadImage("egg00.png");
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
      case Egg:  image(g_egg, 0, 0, displayWidth, displayHeight);  break;
      case Denden:  image(g_denden, 0, 0, displayWidth, displayHeight);  break;
      default:  break;
    }
  } 
   
   
  boolean Action(){
    return isAction;
  }
}