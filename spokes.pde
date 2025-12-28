
float x = 0.;
float y = 0.;
float r1 = 100.;
float r2 = 30.;
float t = 0.;
float w1 = 2.*PI*.5/60.;
float w2 = 2.*PI*.05/60.;
int l = 50;
float phase= 2*PI/l;


void setup(){
  size(400,400);
  background(#FFFFFF);
  fill(#00FF00);
  smooth();

}

void draw(){
  t+=1;
  fill(#FFFFFF);
  noStroke();
  rect(0,0,width, height);
  
  fill(#0000FF);
  stroke(#00FF00);
  for (int i =0; i< l; i++){
    x = r1*cos(w2*t-i*phase) + r2*cos(w1*t+i*phase);
    y = r1*sin(w2*t+i*phase) - r2*sin(w1*t+i*phase);
    ellipse(x+width/2,-y+height/2,5,5);
    ellipse(-x+width/2,y+height/2,5,5);
    ellipse(x+width/2,y+height/2,5,5);
    ellipse(-x+width/2,-y+height/2,5,5);
    line(x+width/2,-y+height/2,-x+width/2,y+height/2);
    line(x+width/2,y+height/2,-x+width/2,-y+height/2);
  }
}

void mouseMoved(){
  phase = float(mouseX)/width*2*PI/l;
}
