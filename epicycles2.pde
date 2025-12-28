
float x = 0.;
float y = 0.;
float r1 = 200.;
float r2 = 60.;
float t = 0.;
float w1 = PI*.5/300.;
float w2 = PI*.05/300.;
int l = 50;
float phase= 2*PI/l;


void setup(){
  size(800,800);
  background(#FFFFFF);
  fill(#00FF00);
  smooth();
  frameRate(24);

}

void draw(){
  t+=1;
  fill(255,255,255,40);
  noStroke();
  rect(0,0,width, height);
  
  fill(#FF0000);
  noStroke();
  for (int i =0; i< l; i++){
    x = r1*cos(i*w2*t/2.) + r2*cos(i*w1*t/3.);
    y = r1*sin(i*w2*t/2.) - r2*sin(i*w1*t/3.);
   ellipse(x+width/2,-y+height/2,5,5);
   ellipse(-x+width/2,y+height/2,5,5);
   ellipse(x+width/2,y+height/2,5,5);
   ellipse(-x+width/2,-y+height/2,5,5);
  }
}

void mouseMoved(){
  phase = float(mouseX)/width*2*PI/l;
}
