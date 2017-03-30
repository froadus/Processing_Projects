//Circle object
class Circle {
  float x;
  float y;
  boolean drawIt;
  public Circle(float x, float y, boolean drawIt) {
    this.x = x;
    this.y = y;
    this.drawIt = drawIt;
  }
}

//Main Code
void setup() {
  size(500,500);
}
int amount = 10;
void mousePressed() {
  amount++;
}
float move = 0;
float moveN = 0;
float time = 0;
float select = 0;
int frame = 0;
ArrayList<Circle> circles = new ArrayList<Circle>();

void draw() {
  background(0);
  
  //Add circle object
  for (int i = 0; i < 1; i++) {
    if (frame % 2 == 0) {
      float mX = map(mouseX,0,width,0,1);
      float mY = map(mouseY,0,height,0,1);
      if (mX != 0 && mY != 0) {
        if (circles.size() > amount) {
          circles.remove(0);
        }
        boolean drawIt = true;
        if (circles.size() != 0) {
          Circle last = circles.get(circles.size()-1);
          if (last.x == mouseX && last.y == mouseY) {
            drawIt = false;
          }
        }
        //circles.add(new Circle(mouseX,mouseY,drawIt));
        circles.add(new Circle((sin(move)*width/2)*mX+width/2,(cos(move)*height/2)*mY+height/2,drawIt));
      }
    }
  }
  
  //Draw circle path
  noStroke();
  noFill();
  stroke(255);
  
  beginShape();
  for (int i = circles.size()-1; i >= 0; i--) {
    Circle circle = circles.get(i);
    if (circle.drawIt) {
      int transparency = 140;
      //Blue
      fill(82,161,255,transparency);
      paint(map(circle.y,0,height,height,0),circle.x);
    }
  }
  noFill();
  endShape();
  beginShape();
  for (int i = circles.size()-1; i >= 0; i--) {
    Circle circle = circles.get(i);
    if (circle.drawIt) {
      int transparency = 140;
      //green
      fill(82,255,112,transparency);
      paint(circle.y,map(circle.x,0,width,width,0));
    }
  }
  noFill();
  endShape();
  beginShape();
  for (int i = circles.size()-1; i >= 0; i--) {
    Circle circle = circles.get(i);
    if (circle.drawIt) {
      int transparency = 140;
      //Orange and pink
      fill(255,140,100,transparency);
      paint(circle.x,circle.y);
    }
  }
  noFill();
  endShape();
  beginShape();
  for (int i = circles.size()-1; i >= 0; i--) {
    Circle circle = circles.get(i);
    if (circle.drawIt) {
      int transparency = 140;
      //pink
      fill(255,82,192,transparency);
      paint(map(circle.x,0,width,width,0),map(circle.y,0,height,height,0));
    }
  }
  noFill();
  endShape();
  
  
  
  //Move along path
  move -= 0.03;
  
  //Add one to time and frame
  time++;
  frame++;
  
}

void paint(float x, float y) {
  float rand = map(noise(moveN),0,1,0.1,2);
  float size = 20*rand;
  if (time > 20) {
    select = random(1);
    time = 0;
  }
  if (select < 0.5) {
    ellipse(x,y,size,size);
  } else {
    rect(x-size/2,y-size/2,size,size);
  }
  //Add vertex for line path
  vertex(x,y);
  //Move in noise space
  moveN += 0.004;
}