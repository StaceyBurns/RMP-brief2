import ddf.minim.*;
float r;
float g;
float b;
Minim minim;
AudioPlayer player;
float myBufferSize; 
int i = 0; 
 
void setup() {
  size(1200, 800);
  background(255); 
  minim = new Minim(this);
  player = minim.loadFile("Pursuit of Happiness.mp3");
  player.play();
  myBufferSize = player.bufferSize() - 1;
}
 
void draw() {
  background(255); 
 
  r = map ( abs(player.mix.get(i)), 0, .7, 0, 255);
  
  g = map ( abs(player.mix.get(i)), .5, .7, 0, 255);
  
  b = map ( abs(player.mix.get(i)), 0, 1, 0, 255);
   
  println ( abs(player.mix.get(i))
    + " -> "
    + r, g, b ); 
  fill(r, g, b, 255);
  noStroke();
  ellipse(width/2, height/2, 300, 300);
  // }
  if (i < player.bufferSize() - 1) 
  {
    i++;
  }
  else
  {
    i=0;
    myBufferSize = player.bufferSize() - 1;
  }
}