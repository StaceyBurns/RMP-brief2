import processing.video.*;
import ddf.minim.*;
import java.awt.Color;

Capture video;

float[] hsb;
float r;
float g;
float b;

Minim minim;
AudioPlayer player;
float myBufferSize; 
int i = 0; 
 
void setup() {
  size(640,480);
  background(255); 
  hsb = new float[3];
 
 video = new Capture(this,640,480); 
  
  video.start();

  minim = new Minim(this);
  player = minim.loadFile("Pursuit of Happiness.mp3");
  player.play();
  myBufferSize = player.bufferSize() - 1;
}
 
void draw() {
if (video.available()) {
    video.read();
    loadPixels();
    video.loadPixels();
 
    for (int x = 0; x < video.width; x++ ) {
      for (int y = 0; y < video.height; y++ ) {   
        int loc = x + y*video.width;
            
        int r, g, b;
        r = (video.pixels[loc] >> 16) & 0xFF;
        g = (video.pixels[loc] >> 8) & 0xFF;
        b = (video.pixels[loc]) & 0xFF;
        
        hsb = Color.RGBtoHSB((int)r,(int)g,(int)b, null);
        
   
        float deg = hsb[0]*360;
        
      
        if (deg >= 30 && deg < 70){ 
          // green
          r = 255;
          g = 0;
          b = 0;
        } 
        else {
          // Make everything black
          // r = g = b = 0;
        }
        color c = color(r,g,b);
        pixels[loc] = c;
      }
    }
    updatePixels();
  }
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