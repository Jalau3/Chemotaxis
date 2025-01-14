class paw {
  int x, y, r, g, b, addX, addY;
  paw() {
    x = (int)(Math.random()*500);
    y = (int)(Math.random()*500);
    addX = ((int)(Math.random()*3)-1)*20;
    addY = ((int)(Math.random()*3)-1)*20;
    r = (int)(Math.random()*256);
    g = (int)(Math.random()*256);
    b = (int)(Math.random()*256);
  }
  void show() {
    fill(r, g, b);
    translate(x, y);
    float rot = 0;
    if (addX<0) {
      float angle = (float)(-addY)/(float)(addX);
      rot = PI/2-atan(angle)+PI;
    } else if (addX ==0) {
      if (addY>0)
        rot = PI;
      else
        rot = 0;
    } else {
      float angle = (float)(-addY)/(float)(addX);
      rot = PI/2-atan(angle);
    }
    rotate(rot);

    scale(0.2);

    beginShape();
    vertex(0, 0);
    bezierVertex(20, -50, 80, -50, 100, 0);
    bezierVertex(120, 40, 90, 40, 75, 30);
    bezierVertex(60, 20, 40, 20, 25, 30);
    bezierVertex(10, 40, -20, 40, 0, 0);
    endShape();


    translate(-15, -40);
    rotate(-PI/6);
    ellipse(0, 0, 40, 60);
    rotate(PI/6);
    translate(15, 40);

    translate(25, -75);
    rotate(-PI/12);
    ellipse(0, 0, 40, 70);
    rotate(PI/12);
    translate(-25, 75);

    translate(115, -40);
    rotate(PI/6);
    ellipse(0, 0, 40, 60);
    rotate(-PI/6);
    translate(-115, 40);

    translate(75, -74);
    rotate(PI/12);
    ellipse(0, 0, 40, 70);
    rotate(-PI/12);
    translate(-75, 74);    

    scale(5);
    rotate(-rot);
    translate(-x, -y);
  }
  void walk() {
    addX = ((int)(Math.random()*3)-1)*30;
    addY = ((int)(Math.random()*3)-1)*30;
    x += addX;
    y += addY;
    if (x > 500) {
      while (x > 500){
        x = x-10;
      }
    }
    if (y < 0) {
      while (x < 0){
        x = x+10;
      }
    }
    if (y > 500) {
      while (y > 500){
        y = y-10;
      }
    }
    if (y < 0) {
      while (y < 0){
        y = y+10;
      }
    }
  }
}
paw [] dots;
void setup() {
  background(0);
  size(500, 500);
  dots = new paw[10];
  for (int i = 0; i<dots.length; i++) {
    dots[i] = new paw();
  }
  frameRate(4);
}
void draw() {
  for (int j = 0; j<dots.length; j++) {
    dots[j].show();
    dots[j].walk();
  }
  fill(0, 0, 0, 50);
  rect(0, 0, 500, 500);
}







