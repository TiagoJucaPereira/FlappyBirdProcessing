class Bird {
  float x, y, gravity, r;
  Bird() {
    x = width/2;
    y = height/2;
    gravity = 1.9; //pixel/second
    r = 32;
  }

  void display() {
    stroke(0);
    fill(255, 255, 0);
    rect(x, y, r, r, r);

    //olho
    fill(255);
    circle(x+r-3, y+8, 5);

    //asa
    fill(255);
    ellipse(x+5, y+(r/2)+3, 15, 10);

    //boca
    fill(255, 0, 0);
    ellipse(x+r-2, y+(r/2), 10, 4);
    ellipse(x+r-2, y+(r/2)+4, 10, 4);
    noStroke();
  }

  void fall() {
    this.y = this.y + gravity;
  }
  void up() {
    this.y = this.y - 50;
  }
}
