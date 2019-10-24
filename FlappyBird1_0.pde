PImage backImg;
PImage [] img = new PImage[4];

ArrayList<Wall> wall = new ArrayList<Wall>();
Bird bird;
int time = 0;
int contWall = 0;
int totalScore = 0;
boolean game = false;
boolean first = true;
int last;
int best;
int timeWall = 0;
float pt =1;
float newSpeed = 1;
int day = 0;
boolean claro = true;

void setup () {
  size(800, 600);
  bird = new Bird ();
  timeWall = 350;
  contWall = 0;
  //backImg = loadImage("back.jpg");
  img[0] = loadImage("back01.jpg");
  img[1] = loadImage("back02.jpg");
  img[2] = loadImage("back03.jpg");
  img[3] = loadImage("back04.jpg");
}

void isAlive() {
  game = true;
  timeWall = 350;
  contWall = 0;
  time = 0;
  totalScore = 0;
  newSpeed = 1;
  day = 0;
}

void isDead() {
  game = false;
  bird = new Bird();
  for (int i=wall.size()-1; i>=0; i--) {
    wall.remove(i);
    println(i);
  }
  last = totalScore;
  if (first) {
    first = !first;
    best = last;
  } else {
    if (last > best) {
      best = last;
    }
  }
  println(wall.size());
  
}

void keyPressed() {
  if (keyCode == 32) {
    bird.up();
  }
}

void mousePressed() {
  if (mouseX>=350 && mouseX<=450 && mouseY>=300 && mouseY<=350) {
    isAlive();
  }
}

void pass (int i) {
  if (bird.x+bird.r>wall.get(i).x+wall.get(i).r) {
    wall.get(i).score = 1;
  }
}

void countScore() {
  totalScore = 0;
  for (int i = 0; i<wall.size(); i++) {
    totalScore += wall.get(i).score;
  }
}

void colision(int i) {
  //area de colisão
  if (bird.x+bird.r >= wall.get(i).x && bird.x <= wall.get(i).x + wall.get(i).r) {
    //colisão no bloco do chão
    if (bird.y+bird.r>=wall.get(i).yFloor || bird.y <= wall.get(i).yRoof) {
      isDead();
    }
  }
}

void upDown() {
  if (bird.y+bird.r>=550 || bird.y <=0) {
    isDead();
  }
}

void increaseSpeed() {
  for (int i=wall.size()-1; i>=0; i--) {
      newSpeed = wall.get(i).speed+0.5;
      wall.get(i).speed = newSpeed;
  }
}

void back() {
  image(img[day],0,0,width,height);
  /*background(12, 151, 237);
  fill(222, 200, 135);
  noStroke();
  rect(0, 550, width, height);*/
}

void inicial() {
  //background(12, 151, 237);
  //fill(222, 200, 135);
  //noStroke();
  //rect(0, 550, width, height-550);
  image(img[0],0,0,width,height);
  fill(0);
  textSize(70);
  text("FLAPPY BIRD", 400, 250);
  fill(200);
  rect(350, 300, 100, 50);
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(16);
  text("JOGAR", 400, 325);
  if (!first) {
    text("Última pontuação: "+last, 400, 400);
    text("Melhor pontuação: "+best, 400, 420);
  }
}

void changeBack(){
  if(claro){
    if(day<3){
      day++;
    }
    else{
      day--;
      claro = false;
    }
  }else{
    if(day>0){
      day--;
    }else{
      claro=true;
    }
  }
}

void draw() {
  if (game) {
    back();
    if (time >= timeWall || time == 0) {
      wall.add(new Wall(newSpeed));
      println(wall.size());
      time = 0;
      contWall++;
      if(contWall%8==0){
        changeBack();
      }
      if (wall.size()%2==0) {
        if (timeWall>=150) {
          timeWall-=50;
          increaseSpeed();
        }
      }
    }
    time ++;
    bird.display();
    bird.fall();
    for (int i = 0; i<wall.size(); i++) {
      wall.get(i).move();
      wall.get(i).display();
      pass(i);
      colision(i);
    }

    countScore();
    upDown();
    fill(0);
    textAlign(LEFT);
    textSize(16);
    text("Pontos: "+totalScore, 0, 16);
  } else {
    inicial();
  }
}
