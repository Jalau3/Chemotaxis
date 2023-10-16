class paw{
  int x, y, r, g, b, addX, addY;
 paw(){
   x = (int)(Math.random()*500);
   y = (int)(Math.random()*500);
   addX = ((int)(Math.random()*3)-1)*20;
   addY = ((int)(Math.random()*3)-1)*20;
   r = (int)(Math.random()*256);
   g = (int)(Math.random()*256);
   b = (int)(Math.random()*256);
 }
 void show(){
   fill(r,g,b);
 pushMatrix();
   translate(x, y);
   float rot;
   pushMatrix();
   if(addX<0){
     rot = PI/2-(atan(((float)-addY)/((float)addX)))+PI;
   }
   else if(addX ==0){
      if(addY>0)
        rot = PI;
      else
        rot = 0;
   }
   else{
     rot = PI/2-atan(((float)-addY)/((float)addX));
   }
    rotate(rot);
    pushMatrix();
    scale(0.2);
    pushMatrix();
    beginShape();
    vertex(0,0);
    bezierVertex(0+20,0-50, 0+80,0-50, 0+100,0);
    bezierVertex(0+120,0+40, 0+90,0+40, 0+75,0+30);
    bezierVertex(0+60,0+20, 0+40,0+20, 0+25,0+30);
    bezierVertex(0+10,0+40, 0-20,0+40, 0,0);
    endShape();
    
    pushMatrix();
    translate(0-15, 0-40);
    rotate(-PI/6);
    ellipse(0,0, 40,60);
    popMatrix();
    
    pushMatrix();
    translate(0+25,0-75);
    rotate(-PI/12);
    ellipse(0, 0, 40, 70);
    popMatrix();
    
    pushMatrix();
    translate(0+115, 0-40);
    rotate(PI/6);
    ellipse(0,0, 40,60);
    popMatrix();
    
    pushMatrix();
    translate(0+75,0-74);
    rotate(PI/12);
    ellipse(0, 0, 40, 70);
    popMatrix();
    
    popMatrix();
    
    popMatrix();
    
    popMatrix();
    
    popMatrix();

 }
 void walk(){
   addX = ((int)(Math.random()*3)-1)*30;
   addY = ((int)(Math.random()*3)-1)*30;
   x += addX;
   y += addY;
   if(x > 500){
     while(x > 500)
       x = x-10;
   }
   if(y < 0){
     while(x < 0)
       x = x+10;
   }
   if(y > 500){
     while(y > 500)
       y = y-10;
   }
   if(y < 0){
     while(y < 0)
       y = y+10;
   }
 }
  
}
paw [] dots;
void setup(){
  background(0);
  size(500,500);
  dots = new paw[10];
  for(int i = 0; i<dots.length;i++){
    dots[i] = new paw();
  }
  frameRate(4);
}
void draw(){
  for(int j = 0; j<dots.length;j++){
    dots[j].show();
    dots[j].walk();
  }
  fill(0,0,0,50);
  rect(0,0,500,500);
}

