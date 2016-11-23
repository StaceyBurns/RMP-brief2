import processing.video.*;
import ddf.minim.*;
import java.awt.Color;

Capture video;

float[] hsb;
float r;
float g;
float b;

int filter = 40;
int filterIndex = 6;
int[] filters = {1, 2, 4, 5, 8, 10, 20, 40, 80, 160};
 
Minim minim;
AudioPlayer player;
float myBufferSize;
int i = 0;
int cols, rows;

void setup() {
  size(640,480);
  hsb = new float[3];
  video = new Capture(this,640,480);
  video.start();
  minim = new Minim(this);
  player = minim.loadFile("Pursuit of Happiness.mp3");
  player.play();
  myBufferSize = player.bufferSize() - 1;
  filter = filters[filterIndex];
}

void draw() {
  
  if (video.available()) {
    background( 255 );
    video.read();
    
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
    
    
    
    
    
    for (int x = 0; x < video.width; x+=filter) {
      for (int y = 0; y < video.height; y+=filter ) {


        
        for (int ro = x; ro < x+filter; ro++) {
          for (int c = y; c < y+filter; c++ ) {
            int loc = ro + c*video.width;



   
        r = (video.pixels[loc] >> 16) & 0xFF;
        g = (video.pixels[loc] >> 8) & 0xFF;
        b = (video.pixels[loc]) & 0xFF;
        
        hsb = Color.RGBtoHSB((int)r,(int)g,(int)b, null);
        
   
        float deg = hsb[0]*360;
        
         if (deg >= 0 && deg < 15){ //red
          // green
          r = map ( abs(player.mix.get(i)), 0, 1, 120, 155); 
          g = 0;
          b = 0;
        } 
           else if (deg >=  16 && deg <  30){ //red
          r = map ( abs(player.mix.get(i)), 0, 1, 150, 255);
          g = 0; 
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
         else if (deg >=  151 && deg < 165){ //cyan
          r = 0;
          g = map ( abs(player.mix.get(i)), 0, 1, 70, 120);
          b = map ( abs(player.mix.get(i)), 0, 1, 70, 120);
          
        }
           else if (deg >=  166 && deg < 180){ //cyan
          r = 0; 
          g = map ( abs(player.mix.get(i)), 0, 1, 120, 160);
          b = map ( abs(player.mix.get(i)), 0, 1, 120, 160);
          
        }
           else if (deg >=  181 && deg < 195){ //cyan
          r = 0;
          g = map ( abs(player.mix.get(i)), 0, 1, 160, 255);
          b = map ( abs(player.mix.get(i)), 0, 1, 160, 255);
          
        }
           else if (deg >=  196 && deg < 210){ //cyan
          r = 0;
          g = map ( abs(player.mix.get(i)), 0, 1, 80, 120);
          b = map ( abs(player.mix.get(i)), 0, 1, 120, 255); 
          
        }

         else if (deg >=  211 && deg < 225){ //blue
          r = 0;
          g = 0;
          b = map ( abs(player.mix.get(i)), 0, 1, 120, 150);
          
        }
         else if (deg >=  226 && deg < 240){ //blue
          r = 0;
          g = 0;
          b = map ( abs(player.mix.get(i)), 0, 1, 150, 200);
          
        }
         else if (deg >=  241 && deg < 255){ //blue
          r = 0;
          g = 0;
          b = map ( abs(player.mix.get(i)), 0, 1, 200, 225);
          
        }
         else if (deg >=  256 && deg < 270){ //blue
          r = 0;
          g = 0;
          b = map ( abs(player.mix.get(i)), 0, 1, 225, 255);
          
        }
            else if (deg >=  271 && deg < 285){ //magenta
          r = map ( abs(player.mix.get(i)), 0, 1, 120, 150);
          g = 0;
          b = map ( abs(player.mix.get(i)), 0, 1, 120, 150); 
          
        }
            else if (deg >=  296 && deg < 300){ //magenta
          r = map ( abs(player.mix.get(i)), 0, 1, 150, 190);
          g = 0;
          b = map ( abs(player.mix.get(i)), 0, 1, 150, 190); 
          
        }
            else if (deg >=  301 && deg < 315){ //magenta
          r = map ( abs(player.mix.get(i)), 0, 1, 190, 225);
          g = 0;
          b = map ( abs(player.mix.get(i)), 0, 1, 190, 220); 
          
        }
            else if (deg >=  316 && deg < 330){ //magenta
          r = map ( abs(player.mix.get(i)), 0, 1, 220, 255);
          g = 0;
          b = map ( abs(player.mix.get(i)), 0, 1, 220, 255); 
          
        }
        
        else {
          // Make everything black
          // r = g = b = 0;
        }



          }
        }

        color c = color(r,g,b);
        fill( c );
        noStroke();
        rect(x,y,filter,filter);
      }
    }
    
  }
}
void keyPressed() {
  if( keyCode == 38 ) {
    filterIndex++;
  } else if( keyCode == 40 ) {
    filterIndex--;
  }
  filter = filters[filterIndex];
}