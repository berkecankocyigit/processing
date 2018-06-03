void setup(){
size(700,700);


}
int x=40;
int y= 40;
void draw(){
   background(255,255,255);
  fill(255,0,0);
 ellipse(x,y,40,40);
 if(dist(x,y,mouseX,mouseY) < 20){
   x = int(random(700));
   y = int(random(700));
 }

}
