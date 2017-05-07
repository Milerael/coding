class Player {
PVector pos,vel,acc;
int r,colR,colG,colB;
float m;
float airResist = 0.9;
int thickness = 3;

  Player(int x, int y, int r_){
    pos = new PVector(x,y);
    vel = new PVector();
    acc = new PVector();
    colR = floor(random(256));
    colG = floor(random(256));
    colB = floor(random(256));
    r = r_;
    m = 2.5;
  }
  
  void applyForce(PVector force){
    acc.add(force);
    vel.add(acc);
    vel.limit(20);
    acc.mult(0);
  }
  
  void move(){
    pos.add(vel);
  }
  
  void show(){
    pushMatrix();
    strokeWeight(thickness);
    fill(colR,colG,colB);
    translate(pos.x,pos.y);
    rotate(vel.heading());
    //rectMode(CENTER);
    ellipse(0,0,r,r);
    popMatrix();
  }
  
  void checkWalls(){
    if(pos.y+r/2+thickness/2 >= height){
        vel.set(vel.x,-vel.y);
        vel.mult(airResist);
        pos.set(pos.x,height-r/2-thickness/2);
    }
    if(pos.y-r/2-thickness/2 <= 0){
        vel.set(vel.x,-vel.y);
        vel.mult(airResist);
        pos.set(pos.x,r/2+thickness/2);
    }
    if(pos.x-r/2-thickness <= 0){
        vel.set(-vel.x,vel.y);
        vel.mult(airResist);
        pos.set(r/2+thickness/2,pos.y);
    }
    if(pos.x+r/2+thickness/2 >= width){
        vel.set(-vel.x,vel.y);
        vel.mult(airResist);
        pos.set(width-r/2-thickness/2,pos.y);
    } 
  }
  
}