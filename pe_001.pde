// Visualization for Project Euler Problem #001.
// Find the sum of all the multiples of 3 and/or 5 below 1000.
// Colors taken from http://www.color-hex.com/color/800080. 
int goal = 1000;

int count = 0;          // Overall counter
int my_sum = 0;         // Overall sum
int xcount = 0;         // Horizontal (col) count
int black = #000000;
int blue = #0000ff;
int purple = #800080;
int grey = #808080;
int red = #ff0000;
int white = #ffffff;

int text_y = 0;        // Holds y position for text. 

int wd = 8;            // Rectangle width 
int y = wd;            // Vertical (row) count  

void setup() {
  background(grey);
  stroke(grey);        // Shape borders blend into background.
  // TODO: Set up some if/else cases for various drawing sizes.
  size(816, 126);      // width, height
  
  text_y = height - wd;
  
  // Draw problem title.
  textSize(14);
  fill(white);
  text("Project Euler Problem #001", wd, text_y);
}

void draw() {
  int x = 0;
  count++;             // Incr overall count
  xcount++;            // Incr horiz (col) count
  x = xcount*wd;
  
  // Check boundaries. Increment y so that the next cube is drawn
  // on the next row.
  if (x >= wd+(wd*100)) {
    y += wd;
    xcount = 1;        // Set column count back to 1.
    x = xcount*wd;     //
  }
  
  // If divisible by 3 and 5, cube color is purple.
  if ((count % 3 == 0) && (count % 5 == 0)) {
    fill(purple);
    my_sum += count;
  }
  // If divisible by 3, cube color is blue.
  else if (count % 3 == 0) {
    fill(blue);
    my_sum += count;
  }
  // If the number is divisible by 5, cube color is red.
  else if (count % 5 == 0) {
    fill(red);
    my_sum += count;
  }
  // Color is white.
  else {
    fill(white);
  }
  // Draw cube.
  rect(x,y,wd,wd);
  
  // Cover up previous text.
  fill(grey);
  rect(599,100,width-608,22);
  // Draw sum.
  textSize(14);
  fill(white);
  text("Total Sum: ", 600, text_y);
  text(my_sum, 708, text_y);
  
  // Once goal is reached, pause for 1 minute.
  if (count >= goal) {
    print("60s naptime. ");
    delay(60000);
    println("done");
    exit();
  }
}

// On a mouse-click, set flag in order to end the program. 