Player player;
PVector grav;
int grabForce=50;


void setup(){
  size(800,800);
  player = new Player(width/2, height/2, 64);
  grav = new PVector(0,0.2);
  grav.mult(player.m);
}

void draw(){
  background(101);
  player.applyForce(grav);
  player.move();
  player.checkWalls();
  player.show();
  mouseHeld();
}

void mouseHeld(){
  if(mousePressed){
    PVector force = new PVector(mouseX-player.pos.x,mouseY-player.pos.y);
    force.limit(grabForce);
    if(player.pos.dist(new PVector(mouseX,mouseY))>=70){
      player.applyForce(force);
    }
  }
}