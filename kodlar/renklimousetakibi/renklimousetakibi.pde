void setup(){
  size(1000,700);
    background(255,255,255);
  
}

void draw(){

  float x = map(mouseX,0,width,0,255);
    float y = map(mouseY,0,width,0,255);
  fill(x,y,0);
  ellipse(mouseX,mouseY,30,30);
 
 
}
