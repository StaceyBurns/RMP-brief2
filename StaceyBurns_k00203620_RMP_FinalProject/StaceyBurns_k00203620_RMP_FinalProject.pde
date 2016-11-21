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
    
  println ( abs(player.mix.get(i))
    + " -> "
    + r, g, b ); 

  if (i < player.bufferSize() - 1) 
  {
    i++;
  }
  else
  {
    i=0;
    myBufferSize = player.bufferSize() - 1;
  }
    for (int x = 0; x < video.width; x++ ) {
      for (int y = 0; y < video.height; y++ ) {   
        int loc = x + y*video.width;
        
     

            
        float r, g, b;
        r = (video.pixels[loc] >> 16) & 0xFF;
        g = (video.pixels[loc] >> 8) & 0xFF;
        b = (video.pixels[loc]) & 0xFF;
        
        hsb = Color.RGBtoHSB((int)r,(int)g,(int)b, null);
        
   
        float deg = hsb[0]*360;
        
      
        if (deg >= 0 && deg < 50){ //red
          r = map ( abs(player.mix.get(i)), 0, 1, 120, 255); 
          g = 0;
          b = 0;
        } 
           else if (deg >=  16 && deg <  30){ //red
          r = 0;
          g = map ( abs(player.mix.get(i)), 0, 1, 120, 255); 
          b = 0;
          
        }
        else if (deg >=  31 && deg <  45){ //yellow
          r = map ( abs(player.mix.get(i)), 0, 1, 12, 60); 
          g = map ( abs(player.mix.get(i)), 0, 1, 12, 60);
          b = 0;
          
        }
         else if (deg >=  46 && deg <  60){ //yellow
          r = map ( abs(player.mix.get(i)), 0, 1, 60, 150); 
          g = map ( abs(player.mix.get(i)), 0, 1, 60, 150); 
          b = 0;
          
        }
         else if (deg >=  61 && deg <  75){ //yellow
          r = map ( abs(player.mix.get(i)), 0, 1, 150, 200); 
          g = map ( abs(player.mix.get(i)), 0, 1, 150, 200); 
          b = 0;
          
        }
          else if (deg >=  76 && deg <  90){ //yellow
          r = map ( abs(player.mix.get(i)), 0, 1, 200, 255); 
          g = map ( abs(player.mix.get(i)), 0, 1, 200, 255); 
          b = 0;
          
        }
        else if (deg >=  91 && deg < 105){ //green
          r = 0;
          g = map ( abs(player.mix.get(i)), 0, 1, 200, 255);
          b = 0;
          
        }
        else if (deg >=  106 && deg < 120){ //green
          r = 0;
          g = map ( abs(player.mix.get(i)), 0, 1, 150, 200);
          b = 0;
          
        }
        else if (deg >=  121 && deg < 135){ //green
          r = 0;
          g = map ( abs(player.mix.get(i)), 0, 1, 120, 150);
          b = 0;
          
        }
        else if (deg >=  136 && deg < 150){ //green
          r = 0;
          g = map ( abs(player.mix.get(i)), 0, 1, 70, 120);
          b = map ( abs(player.mix.get(i)), 0, 1, 120, 255);
          
        }
         else if (deg >=  151 && deg < 210){ //cyan
          r = map ( abs(player.mix.get(i)), 0, 1, 0, 10); 
          g = map ( abs(player.mix.get(i)), 0, 0.7, 120, 255);
          b = map ( abs(player.mix.get(i)), 0, 1, 120, 255); 
          
        }
          else if (deg >=  211 && deg < 270){ //blue
          r = 0;
          g = 0;
          b = map ( abs(player.mix.get(i)), 0, 1, 120, 255);
          
        }
            else if (deg >=  271 && deg < 330){ //magenta
          r = map ( abs(player.mix.get(i)), 0, 1, 120, 255);
          g = 0;
          b = map ( abs(player.mix.get(i)), 0, 1, 120, 200); 
          
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
    
  }