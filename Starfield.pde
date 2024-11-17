Particle[] particle=new Particle[750];
void setup(){
  size(500,500);
  for (int i=0;i<particle.length;i++) particle[i]=new Particle();
  particle[0]=new OddballParticle();
}
void draw(){
  background(0);
  for (int i=0;i<particle.length;i++){
    particle[i].move();
    particle[i].show();
  }
}

class Particle{
  double myX,myY,myAngle,mySpeed;
  int myColor;
  Particle(){
    myX=myY=250;
    myAngle=Math.random()*2*Math.PI;
    mySpeed=Math.random()*10;
    myColor=color(255,255,0);
  }
  void move(){
    myX+=Math.cos(myAngle)*mySpeed;
    myY+=Math.sin(myAngle)*mySpeed;
  }
  void show(){
    noStroke();
    fill(myColor);
  star((float)myX,(float)myY,(float)((Math.random()*10)+4),(float)((Math.random()*10)+4), (float)((Math.random()*10)+4));
  }
}
class OddballParticle extends Particle{
  OddballParticle(){
    myX=myY=235;
   myAngle=Math.random()*2*Math.PI;
    mySpeed=Math.random()*10;
    myColor=color(0,255,0);
  }
  void move(){
    myX+=(int)(Math.random()*3)-1;
    myY+=(int)(Math.random()*3)-1;
  }
  void show(){
    noStroke();
    fill(255);
    rect((float)myX,(float)myY,(float)100,(float)100, (float) 100);
  }
}
void star(float x, float y, float radius1, float radius2, float npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
