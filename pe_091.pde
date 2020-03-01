/* Use pythagorean theorem to find right triangles. Use hash map to keep track of
right triangles found. */
import java.util.Map;

int xlim, ylim, x1, x2, x3, y1, y2, y3, cnt, right_cnt = 0;
float d1, d2, d3 = 0.0;
String sp2 = "x2,y2 = ";
String sp3 = "x3,y3 = ";
FloatList tri_lens;
String strKey = ""; 
HashMap<String,Integer> hm = new HashMap<String,Integer>();
Boolean is_right = false;
String msg = "";

Boolean pyth(FloatList fl){
  Boolean ret = false;
  float ab, c_2 = 0.0;
  // sort floats
  fl.sort();
  //println(cnt + ". " + fl.get(0) + ", " + fl.get(1) + ", " + fl.get(2));  
  ab = sq(fl.get(0)) + sq(fl.get(1));
  c_2 = sq(fl.get(2));
  if (abs(ab - c_2) < 0.000001) {
    ret = true;
  } else { }
  return ret;
}

void draw_triangle(int x1,int y1,int x2,int y2,int x3,int y3){
    // white triangle, block border
    fill(255);
    stroke(0);
    triangle(x1*100,y1*100,x2*100,y2*100,x3*100,y3*100);
}

// unpause
void keyPressed() {
  loop();
}

void setup(){ 
    size(200,300);
    colorMode(RGB, 255, 255, 255, 100);
    background(100,200,100);
    frameRate(10);
    textSize(14);

    // Init.
    xlim = 2;
    ylim = 2;
    x3 = 0;
    y3 = 0;    
    y2 = 0;
    x2 = 0;
    d1 = 0.0;
    d2 = 0.0;
    d3 = 0.0;
    is_right = false;
    tri_lens = new FloatList();
}

void draw(){
    background(100,200,100); 
    
    // Make gridlines
    stroke(128);
    line(100,0,100,200);
    line(0,100,width,100);
    
    cnt += 1;          // general cycle counter
    is_right = false;    
    
    // Triangles
    d1 = dist(x1,y1,x2,y2);  // orig to x axis
    d2 = dist(x2,y2,x3,y3);  // p2 to p3
    d3 = dist(x3,y3,x1,y1); // p3 to orig
    // 
    if ( (d1 == 0.0) || (d2 == 0.0) || (d3 == 0.0) ) {}
    else {
      // TODO: check if dictionary contains a result
      //strKey = str(x2) + str(y2) + str(x3) + str(y3);
      strKey = str(d1) + str(d2) + str(d3);
      tri_lens.clear();
      tri_lens.append(d1);
      tri_lens.append(d2);
      tri_lens.append(d3);
      
      draw_triangle(x1,y1,x2,y2,x3,y3);          
      
      if (hm.isEmpty() == false){
        if (hm.containsKey(strKey) == false) {
          is_right = pyth(tri_lens);
        } else {
          println("hm has key " + strKey);
          noLoop();
        }
      } else {
        println("hash map is empty");
        is_right = pyth(tri_lens);            
      }// end isEmpty check
    }
    
  // Add point text
  fill(44);
  text("x2,y2",x2*100,y2*100+20);
  text("x3,y3",x3*100,y3*100+20);    
  
  // Make box for message text
  fill(255,255,206); //(light yellow)
  stroke(0);
  rect(0,width,200,250);
  
  // Add message text
  fill(44);
  // n
  text(cnt,10,214);
  // x2, y2
  text(sp2 + "(" + x2 + "," + y2 + ")",10,232);
  // x3, y3
  text(sp3 + "(" + x3 + "," + y3 + ")",10,250);
  
  // Add pyth result text
  if (is_right == true) {
    msg = "Right Triangle";
    right_cnt += 1;
    text(msg,10,268);    
    //println(right_cnt + ". x2,y2 x3,y3 = " + x2 + "," + y2 + " " + x3 + "," + y3);
    hm.put(strKey,0);    // add right triangle points to hash map
    println("found # " + right_cnt + ". key: " + strKey);      
    noLoop();
  }    
  
  x3 += 1;
  if (x3 > xlim) {
    x3 = 0;
    y3 += 1;
    if (y3 > ylim){
      y3 = 0;
      x2 += 1;
      if (x2 > xlim){
        x2 = 0;
        y2 += 1;
        if (y2 > ylim) {
          y2 = 0;
          cnt = 0;
          println("found " + right_cnt + " right triangles.");
          right_cnt = 0;
        }
      }
    }
  } // end xlim checks 
    
}
