PVector position, target;
PImage bg, fly, picture, ball, ball2, star, moon; 
float moveY = 0;
int rad = 60;       
float xpos, ypos;    

float xspeed = 2.8; 
float yspeed = 2.2;  

int xdirection = 1;  
int ydirection = 1;
float x, y;
float easing = 0.018;
int apolloX = 255;
int apolloY = 175;

boolean slow = false;



void setup() { 
  size(1200,  800, P2D);
noStroke();
  frameRate(30);
  ellipseMode(RADIUS);

  xpos = width/2;
  ypos = height/2;

  bg = loadImage("2.png");
  
  fly = loadImage("1.png");
  fly.resize(300, 300);
  bg.resize(width, height);
     noStroke();
  fill(255);
  rectMode(CENTER);
  ball = loadImage("3.png");
  ball.resize(100,40);
  ball2 = loadImage("6.PNG");
  ball2.resize(30, 30);
  star = loadImage("4.png");
  star.resize(apolloX+15,apolloY+15);
  moon = loadImage("5.PNG");
  moon.resize(300,300);
  imageMode(CENTER);
}

void draw() {
  background(bg);
   


  position = new PVector(x, y);
  target = new PVector(random(width), random(height));  
  
  PVector mousePos = new PVector(mouseX, mouseY);
 
  slow = position.dist(mousePos) < 200;
  
  if (slow) {
    picture = ball2;

  }else if (position.dist(mousePos) <= 600 || position.dist(mousePos) >= 200){
    picture = ball;
  }

 float targetX = mouseX;
  float dx = targetX - x;
  x += dx * easing ;
  
  float targetY = mouseY;
  float dy = targetY - y;
  y += dy * easing ;
   xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
   if (xpos > width-rad || xpos < rad) {
    xdirection *= -1;
  }
  if (ypos > height-rad || ypos < rad) {
    ydirection *= -1;
  }

  if(moveY > 800){
   moveY = 0; 
  }
  
  if(slow){
   moveY = moveY + 5;
  }
  

  image(moon,xpos, ypos, rad, rad);
  image(star,900,moveY,15,15);
  image(star,700,moveY+50,15,15);
  image(star,600,moveY+200,15,15);
  image(star,900,moveY-200,15,15);
  image(star,1100,moveY+100,15,15);
  image(star,500,moveY-100,15,15);
  image(star,200,moveY-50,15,15);
  image(star,100,moveY+10,15,15);
  image(fly, mouseX, mouseY);
  image(picture, x, y);
   moveY = moveY + 5;
}
