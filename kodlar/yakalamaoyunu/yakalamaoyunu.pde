void setup(){
 size(700,400); 
 x=350;
 y=200;
 yemy=40;
 yemx=40;
}
int y;
int x;
int yemx;
int yemy;
int yemcap=30;
int cap=40;
int a=0;
int  hiz=10;
boolean test;
int xcounterneg;
int ycounterneg;
int xcounterpos;
int ycounterpos;
  
void draw(){
 background(255,255,255);
 fill(0,0,255);
ellipse(x,y,cap,cap);
fill(255,0,0);
ellipse(yemx,yemy,yemcap,yemcap);
fill(0,0,0);
text("Yakalanan Yem: ",(width/2)-100,height-30);
text(a,(width/2),height-30);
if(dist(x,y,yemx,yemy) < (cap+yemcap)/2){
  a=a+1;
  
  createNewRandom();
}
if(test == true){
hiz= hiz+10;
  test=false;
}
if(xcounterpos >= 4 || ycounterpos >=4 || xcounterneg >= 4 || ycounterneg >=4 ){
hiz=40;
 xcounterneg=0;
 ycounterneg=0;
 xcounterpos=0;
 ycounterpos=0;
}

}

void createNewRandom(){
  yemx = int(random(700));
  yemy = int(random(400));
  
  if(dist(x,y,yemx,yemy) < (cap+yemcap)/2){
    createNewRandom();
  }
}


void keyPressed(){

  if(key=='w' || keyCode== UP){
    if(!(x <= 20 || y <=20 || x>= width-20 || y >= height-20)) {
    y=y-hiz;
    ycounterneg= ycounterneg+1;
    }else{
    a=a-1;    }
    
    
  }
  if(key=='s'  || keyCode== DOWN){
    if(!(y <=20 )) {
    y=y+hiz;
    ycounterpos= ycounterpos+1;
    }else{
    a=a-1;    }
  }
  if(key=='a'  || keyCode== LEFT){
    if(!(x <= 20 )) {
    x=x-hiz;
    xcounterneg= xcounterneg+1;
    }else{
    a=a-1;    }
  }
  if(key=='d' || keyCode== RIGHT){
    if(!( x>= width-20 )) {
    x=x+hiz;
    xcounterpos= xcounterpos+1;
    }else{
    a=a-1;    }
  }
}
void mouseClicked(){
  test =true;
  
}
