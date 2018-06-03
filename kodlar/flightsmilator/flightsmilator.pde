void setup() {
size(800,600);
rocket=loadImage("roket.png");
}
float x=width/2;
float y=height/2;
float speedX=0;
float speedY=0;
float speed=0;
float alfa=0;
float speedAlfa=0;
PImage rocket; //<>//
float gravity=0.5;
void draw(){ //<>//
  background(255,255,255); //<>//
  translate(x,y); //<>//
  rotate(radians(alfa)); //<>//
  image(rocket,-25,-25,50,50); //<>//
  speedX=cos(radians(alfa))*speed; //<>//
  speedY=sin(radians(alfa))*speed+gravity; //<>//
  x=x+speedX; //<>//
  y=y+speedY; //<>//
  alfa = alfa + speedAlfa; //<>//
   //<>// //<>//
}
void keyPressed() {
  if (keyCode == UP) {
    speed = 0.6;
  } else if (keyCode == LEFT) {
    speedAlfa = -2;
  } else if (keyCode == RIGHT) {
    speedAlfa = 2;
  }
  
}

void keyReleased() {
  if (keyCode == UP) {
    speed = 0;
  } else if (keyCode == LEFT) {
    speedAlfa = 0;
  } else if (keyCode == RIGHT) {
    speedAlfa = 0;
  }
}
