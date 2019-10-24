class Wall{
  
  float x, yRoof, yFloor, space, r, speed;
  int score; 
  
  Wall(){
    speed = 1;
    r = 50;
    space = 120;
    x = width;
    yFloor = random(height/4, height-(height/4));
    yRoof = yFloor - space;
    score = 0;
  }
  
  Wall(float newSpeed){
    speed = newSpeed;
    r = 70;
    space = 120;
    x = width;
    yFloor = random(height/4, height-(height/4));
    yRoof = yFloor - space;
    score = 0;
  }
  
  void display(){
    fill(0,255,0);
    //gambiarra para retângulo acabar no chão
    rect(x,yFloor,r,height-(yRoof+space)-50);
    //teto
    rect(x, 0, r, yRoof);
   
    //luz
    fill(200,255,200);
    rect(x+5,0,3,yRoof-3); 
    rect(x+5,yFloor+3, 3, height-(yRoof+space)-53);
    
    //sombra
    fill(0,150,0);
    rect(x+r-5,0, 5,yRoof-3); 
    rect(x+r-5,yFloor+3, 5, height-(yRoof+space)-53);
    
    //"boca"
    fill(0,255,0);
    rect(x-5,yFloor, r+10, 40, 5);
    rect(x-5,yRoof-40, r+10, 40, 5);
    
    //sombra no "encaixe"
    fill(0,150,0);
    rect(x-5,yFloor+40, r+10, 5, 5);
    rect(x-5,yRoof-45, r+10, 5, 5);
    
    //luz na boca
    fill(200,255,200);
    rect(x+3,yFloor, 3, 40);
    rect(x+3,yRoof-40,3,40); 
    
    //sombra na boca
    fill(0,150,0);
    rect(x+r, yFloor, 5, 43, 5);
    rect(x+r, yRoof-43, 5, 43, 5);
  }
  
  void move(){
    this.x -= speed;
  }
  
}
