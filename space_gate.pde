int x;
int y;
PImage ship;

PImage victory;
PImage ded;

void setup(){
  size(1300, 700);
  
  ship = loadImage("shipp.jpg");
  
  x = 1100;
  y = (int) random(0 , height - ship.height);
  
  victory = loadImage("vic.png");
  ded = loadImage("ded.png");
}

boolean isFinished(){
  if (x <= -ship.width)
    return true;
  else
    return false;
}

boolean hitWall(){
  if ( (x <= 50) && (y <= height/2 - ship.height/2 - 10) ||
       (x <= 50) && (y + ship.height >= height/2 + ship.height/2 + 10))
    return true;
  else
    return false;
}

void drawShip(){
  image(ship, x, y);  // height/2 - ship.height/2
  x = x - 1;
}

void drawBase(){
  background(0, 0, 0);
  
  fill(255, 0, 0);
  rect(0, 0, 50, height/2 - ship.height/2 - 10);
  
  fill(255, 0, 0);
  rect(0, height/2 + ship.height/2 + 10, 50, height/2 - ship.height/2 + 10);
}

void draw(){
  drawBase();
  drawShip();
  
  if (hitWall()){
    background(255, 0, 0);
    image(ded, width/2 - victory.width/2, height/2 - victory.height/2);
    noLoop();
  }
  else  if (isFinished()){
    background(0, 255, 0);
    image(victory, width/2 - victory.width/2, height/2 - victory.height/2);
    noLoop();
  }
}

void keyPressed(){
  if (key == 'a'){
  x = x - 5;
  }
  else if (key == 'd'){
  x = x + 4;
  }
  if (key == 'w'){
  y = y - 3;
  }
  else if (key == 's'){
  y = y + 3;
  }
  
  if (key == CODED){
    if (keyCode == LEFT){
    x = x - 5;
    }
    if (keyCode == RIGHT){
    x = x + 4;
    }
    if (keyCode == UP){
    y = y - 3;
    }
    if (keyCode == DOWN){
    y = y + 3;
    }
  }
}