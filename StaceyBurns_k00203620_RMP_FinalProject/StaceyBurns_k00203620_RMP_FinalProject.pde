import processing.video.*; //imports processing video library to use video functions
import ddf.minim.*; //imports minim audio library use access functions later
import java.awt.Color; //imports java color library use when converting colour mode to hsb

Capture video; // declare capture object called video

float[] hsb; //declare array of floats to push rgb values into later
float r; //makes new float variable to hold red value
float g; //makes new float variable to hold green value
float b; //float new variable to hold blue value

int filter = 40; //makes new int variable set to 40 which will set the frequaency and size of the boxes drawn from pixels later
int filterIndex = 6; //makes new int variable set to 6 which holds the value of the current position in the filters array
int[] filters = {1, 2, 4, 5, 8, 10, 20, 40, 80, 160};//makes array of int variables with set values which will set the frequaency and size of the boxes drawn from pixels later
float songNumber = random(9); //makes new float variable set to a random number between 0 and 10 which will later be used to pick a song from the data folder using xml




 
Minim minim; //instantiate a minum object
AudioPlayer player; //instantiate a minum object
float myBufferSize; //makes new float variable that returns the internal buffer size of this sound object, in sample frames
int i = 0; //makes new int variable that is set to 0

void setup() { //set up function triggers when file runs
    size(640, 480); //set window size to 640x480px
    hsb = new float[3]; //initialise hsb float and set its size to 4



    XML xml = loadXML("songs.xml"); //load songs.xml file from data folder to read song list from

    XML[] tracks = xml.getChildren("track");//create float called tracks, get the values of track from xml file and put them into array 
    String playTrack = tracks[int(songNumber)].getString("text"); //make new string whos value is set to a string gotten from the text attribute of a random track from 0-10 in the xml file


    video = new Capture(this, 640, 480); //initialize capture object at 640x480px
    video.start(); // start capturing frames
    minim = new Minim(this); //initialize minim library
    player = minim.loadFile(playTrack); // load track (selected by random array number in xml) into player
    player.play(); // play track
    filter = filters[filterIndex]; //set value of filter to index in filters array determined by filterIndex variable
}

void draw() { // draw function called every frame

    if (video.available()) { //check to see if a frame is available
        background(255); // set background to white
        video.read(); //read frame

        video.loadPixels(); //load the pixels array from the video

        println(abs(player.mix.get(i)) + // print bufferSize in output with rgb values below
            " -> " + //abs Calculates the absolute valueof a number which will always be positive
            r, g, b);

        if (i < player.bufferSize() - 1) { // if bufferSize is less than 1
            i++; // increase i
        } else { //otherwise
            i = 0; //set i to 0
            myBufferSize = player.bufferSize() - 1; // decrease bufferSize by 1
        }




        for (int x = 0; x < video.width; x += filter) { //loop through every Nth pixel in the video (N decided by the value of filter)
            for (int y = 0; y < video.height; y += filter) {



                for (int ro = x; ro < x + filter; ro++) { // loop through the rows of (later to be) boxes
                    for (int c = y; c < y + filter; c++) { // loop through the columns of (later to be) boxes
                        int loc = ro + c * video.width; //find location of boxes




                        r = (video.pixels[loc] >> 16) & 0xFF; // leaves last significant of r
                        g = (video.pixels[loc] >> 8) & 0xFF;
                        b = (video.pixels[loc]) & 0xFF;

                        hsb = Color.RGBtoHSB((int) r, (int) g, (int) b, null); // change RGB to HSB mode and set hsb float to [r,g,b,null] while casting r,g,b, as ints


                        float deg = hsb[0] * 360; // float variable sets hsb degrees

                        if (deg >= 0 && deg < 15) { // if between 0 and 15 degrees which is red
                            r = map(abs(player.mix.get(i)), 0, 1, 120, 155); // set r to a value between 120 and 155 depending on the sample frames of the song. the sample frames are taken and mapped to a value between 0 and 1 which is then mapped between 120 and 155
                            g = 0; // set g to 0
                            b = 0; // set b to 0
                        } else if (deg >= 16 && deg < 30) { //redthe same method as above is used for setting all the colours 1, 150, 255);
                            g = 0;
                            b = 0;

                        } else if (deg >= 31 && deg < 45) { //yellow
                            r = map(abs(player.mix.get(i)), 0, 1, 12, 60);
                            g = map(abs(player.mix.get(i)), 0, 1, 12, 60);
                            b = 0;

                        } else if (deg >= 46 && deg < 60) { //yellow
                            r = map(abs(player.mix.get(i)), 0, 1, 60, 150);
                            g = map(abs(player.mix.get(i)), 0, 1, 60, 150);
                            b = 0;

                        } else if (deg >= 61 && deg < 75) { //yellow
                            r = map(abs(player.mix.get(i)), 0, 1, 150, 200);
                            g = map(abs(player.mix.get(i)), 0, 1, 150, 200);
                            b = 0;

                        } else if (deg >= 76 && deg < 90) { //yellow
                            r = map(abs(player.mix.get(i)), 0, 1, 200, 255);
                            g = map(abs(player.mix.get(i)), 0, 1, 200, 255);
                            b = 0;

                        } else if (deg >= 91 && deg < 105) { //green
                            r = 0;
                            g = map(abs(player.mix.get(i)), 0, 1, 200, 255);
                            b = 0;

                        } else if (deg >= 106 && deg < 120) { //green
                            r = 0;
                            g = map(abs(player.mix.get(i)), 0, 1, 150, 200);
                            b = 0;

                        } else if (deg >= 121 && deg < 135) { //green
                            r = 0;
                            g = map(abs(player.mix.get(i)), 0, 1, 120, 150);
                            b = 0;

                        } else if (deg >= 136 && deg < 150) { //green
                            r = 0;
                            g = map(abs(player.mix.get(i)), 0, 1, 70, 120);
                            b = map(abs(player.mix.get(i)), 0, 1, 120, 255);

                        } else if (deg >= 151 && deg < 165) { //cyan
                            r = 0;
                            g = map(abs(player.mix.get(i)), 0, 1, 70, 120);
                            b = map(abs(player.mix.get(i)), 0, 1, 70, 120);

                        } else if (deg >= 166 && deg < 180) { //cyan
                            r = 0;
                            g = map(abs(player.mix.get(i)), 0, 1, 120, 160);
                            b = map(abs(player.mix.get(i)), 0, 1, 120, 160);

                        } else if (deg >= 181 && deg < 195) { //cyan
                            r = 0;
                            g = map(abs(player.mix.get(i)), 0, 1, 160, 255);
                            b = map(abs(player.mix.get(i)), 0, 1, 160, 255);

                        } else if (deg >= 196 && deg < 210) { //cyan
                            r = 0;
                            g = map(abs(player.mix.get(i)), 0, 1, 80, 120);
                            b = map(abs(player.mix.get(i)), 0, 1, 120, 255);

                        } else if (deg >= 211 && deg < 225) { //blue
                            r = 0;
                            g = 0;
                            b = map(abs(player.mix.get(i)), 0, 1, 120, 150);

                        } else if (deg >= 226 && deg < 240) { //blue
                            r = 0;
                            g = 0;
                            b = map(abs(player.mix.get(i)), 0, 1, 150, 200);

                        } else if (deg >= 241 && deg < 255) { //blue
                            r = 0;
                            g = 0;
                            b = map(abs(player.mix.get(i)), 0, 1, 200, 225);

                        } else if (deg >= 256 && deg < 270) { //blue
                            r = 0;
                            g = 0;
                            b = map(abs(player.mix.get(i)), 0, 1, 225, 255);

                        } else if (deg >= 271 && deg < 285) { //magenta
                            r = map(abs(player.mix.get(i)), 0, 1, 120, 150);
                            g = 0;
                            b = map(abs(player.mix.get(i)), 0, 1, 120, 150);

                        } else if (deg >= 296 && deg < 300) { //magenta
                            r = map(abs(player.mix.get(i)), 0, 1, 150, 190);
                            g = 0;
                            b = map(abs(player.mix.get(i)), 0, 1, 150, 190);

                        } else if (deg >= 301 && deg < 315) { //magenta
                            r = map(abs(player.mix.get(i)), 0, 1, 190, 225);
                            g = 0;
                            b = map(abs(player.mix.get(i)), 0, 1, 190, 220);

                        } else if (deg >= 316 && deg < 330) { //magenta
                            r = map(abs(player.mix.get(i)), 0, 1, 220, 255);
                            g = 0;
                            b = map(abs(player.mix.get(i)), 0, 1, 220, 255);

                        } else {
                            // Make everything black
                            // r = g = b = 0;
                        }



                    }
                }

                color c = color(r, g, b); //color variable which holds the r, g and b values
                fill(c); // fill the rect with the color set above
                noStroke(); // no stroke on rect
                rect(x, y, filter, filter); //draw a rectangle at location x and y of size set by the filter variable
            }
        }

    }
}


void keyPressed() {
    if (keyCode == 38) { //if up arrow is pressed
        filterIndex++; // the boxes get bigger
    } else if (keyCode == 40) { // if down arrow is pressed
        filterIndex--; // the boxes get smaller
    }
    if (filterIndex < 0) { // if filterIndex is less than 0
        filterIndex = 0; // set it to 0 to prevent it from going out of array bounds
    } else if (filterIndex > 9) { // if filterIndex is greater than 9
        filterIndex = 9; // set it to 9 to prevent it from going out of array bounds
    }

    filter = filters[filterIndex]; // set filter to the index in the array set by the value of filterIndex
}