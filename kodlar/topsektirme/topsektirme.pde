void setup() { //<>//
  size(400, 700);
  background=loadImage("background.jpg");
  image(background, 0, 0);
  ball=loadImage("top.png");
  Men=loadImage("adam.jpg");
  fuatAbi=loadImage("yan.png");
  x=random(21, width-21);
}
float x;
float y=50;
float speedXStart=1;
float speedYStart=2;
float speedX=1;
float speedY=2;
float gravity=0.25;
float rectX=0;
float rectY=660;
float rectSpeed;
int scoreCounter=0;
boolean mouse;
boolean gameover;
float mouseXCheck;
PImage background;
PImage ball;
PImage Men;
float ballCurve;
int heart=5;
PImage fuatAbi;
int achievement;
float randomValue;
float pillX=250;
float pillY=500;
float pillX_2=100;
float pillY_2=250;
boolean debugCheck=false;
int ballInvisibilityCounter;
int timeCounter;
int nextLevelValue=25;
int visibilityTime=60;
int invisibilityTime=15;
float rectW=100;
float rectH=40;
float ballR=40;
float r=ballR/2;
float boxSizeW=100;
float boxSizeH=50;
boolean beingMenu=true;
int gameMode = 0;

void draw()
{
  if (gameMode == 0) {
    mainMenu();
  } else {
    if (gameover==true && debugCheck==false)
    {
      oyunbitti();
      if (mouse)
      {
        gameover=false; 
        x=random((r+1), width-(r+1));
        y=50;
        speedY=speedYStart;
        speedX=speedXStart;
        rectSpeed=0;
        scoreCounter=0;  
        gravity=0.5;
        heart=5;
        achievement=0;
      }
    } else if (gameMode==1) {
      play();
    } else if (gameMode==2) {
      
      play();
    }
  }
}
void play() 
{
  timeCounter=timeCounter+1;
  mouse=false;
  fill(0, 0, 0);
  image(background, 0, 0);
  //ellipse(x,y,40,40);

  if (y >=height-(rectH+ballR+r))
  {
    ballCurve = int(map(y, height-(rectH+ballR+r), height-(rectH), 0, ballR));
  } else
  {
    ballCurve=ballR;
  }

  if (scoreCounter>=nextLevelValue) {
    if (timeCounter >=visibilityTime) {
      if (ballInvisibilityCounter<=invisibilityTime) {
        ballInvisibilityCounter=ballInvisibilityCounter+1;
        image(ball, x-r, y-r, ballR, ballCurve);
        image(background, 0, 0);
        if (scoreCounter>=nextLevelValue)
        {
          image(fuatAbi, width-150, 0);
          achievement=1;
        }
        if (ballInvisibilityCounter==invisibilityTime) {
          ballInvisibilityCounter=0;
          timeCounter=0;
        }
      }
    }
    if (timeCounter <=visibilityTime) {
      if (scoreCounter>=nextLevelValue)
      {
        image(fuatAbi, width-150, 0);
        achievement=1;
      }
      image(ball, x-r, y-r, ballR, ballCurve);
    }
  }
  if (scoreCounter<nextLevelValue) {
    image(ball, x-r, y-r, ballR, ballCurve);
  }
  //rect(karex,karey,100,40);
  image(Men, rectX, rectY, rectW, rectH);
  rectX = map(mouseX, 0, width, 0, width-rectW);

  textSize(25);
  fill(255, 255, 255);
  text("Skor:", 5, 30);
  text(scoreCounter, 100, 30);
  text("Can:", 5, 55);
  text(heart, 100, 55);
  fill(0, 0, 0);

  y=y+speedY;
  x=x+speedX;

  mouseXCheck = mouseX-pmouseX;                          //BEST CODE EVER!
  rectSpeed= int(map(mouseXCheck, 0, width, 0, 7));
  //karehiz=karehiz*-1;
  speedX=speedX+rectSpeed;

  if (y<=r) 
  {
    y=y-speedY;
    speedY=speedY*-1;
  }

  if (y >= rectY && x<rectX+rectW && x>rectX) 
  {
    y=y-speedY;
    speedY=speedY*-1;
    scoreCounter=scoreCounter+1;
    speedX=speedX+rectSpeed;
  }

  if (x >= width-r || x<=r ) 
  {
    x=x-speedX;
    speedX=speedX*-1;
  }
  speedY=speedY+gravity;
  if (y>height)
  {
    x=random((r+1), width-(r+1));
    y=50;
    speedY=speedYStart;
    speedX=speedXStart;
    if (debugCheck==false) {
      heart=heart-1;

      if (heart==0) {
        gameover = true;
      }
    }
  }
  if (y>=height-r) {
    if (debugCheck==true) {
      y=y-speedY;
      speedY=speedY*-1;
    }
  }


  fill(255, 0, 0);
  ellipse(pillX, pillY, ballR, ballR);

  if (dist(pillX, pillY, x, y) <=ballR-2)
  {
    pillX = random(width-50);
    pillY = random(height-50);
    scoreCounter=scoreCounter-1;
  }
  fill(0, 0, 255);
  ellipse(pillX_2, pillY_2, ballR, ballR);

  if (dist(pillX_2, pillY_2, x, y) <=ballR-2)
  {
    pillX_2 = random(width-50);
    pillY_2 = random(height-50);
    scoreCounter=scoreCounter+1;
  }
}
void mouseClicked()
{
  if (beingMenu) {
    if (mouseX > 50 && mouseX < 50+boxSizeW && mouseY < (height*2/3-60)+boxSizeH && mouseY> (height*2/3-60)) {
      gameMode=1;
      mouse=false;
      beingMenu=false;
    }
    if (mouseX > 250 && mouseX < 250+boxSizeW && mouseY < (height*2/3-60)+boxSizeH && mouseY> (height*2/3-60)) {
      gameMode=2;
      mouse=false;
      beingMenu=false;
      speedYStart=speedYStart+1;
      speedXStart=speedXStart+1;
      speedY=speedYStart;
      speedX=speedXStart;
      gravity=0.5;
    }
  }
  //if (gameover || beingMenu ) {
  mouse=true;
  // }
}

void mainMenu() {
  if (beingMenu) {
    image(background, 0, 0);
    image(fuatAbi, width/2-80, height/15);
    textSize(25);
    fill(0, 0, 0);
    rect(0, height/3-25, 400, 30);
    fill(255, 255, 255);
    text("BASLAMAK ICIN ZORLUK SEC!", 20, height/3);
    fill(0, 0, 0);
    rect(50, height*2/3-60, boxSizeW, boxSizeH);
    fill(255, 255, 255);
    text("EASY", 70, height*2/3-25);
    fill(0, 0, 0);
    rect(250, height*2/3-60, boxSizeW, boxSizeH);
    fill(255, 255, 255);
    text("MEDIUM", 250, height*2/3-25);
    fill(0, 0, 0);
  }
}


void oyunbitti()
{
  if (debugCheck==false) {
    background(0, 0, 0);
    fill(255, 255, 255);
    textSize(25);
    text("GAME OVER!", 50, height/2);
    textSize(15);
    text("Yeniden oynamak icin tıkla", 50, height/2+50);
    textSize(15);
    text("score:", 50, (height/2)-60);
    text(scoreCounter, 95, (height/2)-60);
    text("Kazanılan Başarılar:", 50, (height/2)+100);
    if (achievement==1)
    {
      text("(Yanıyosun Fuat Abi!)Kazandın!!!", 50, (height/2)+150);
    } else
      text("Hiçbir şey alamadın!", 50, (height/2)+150);
  }
}
