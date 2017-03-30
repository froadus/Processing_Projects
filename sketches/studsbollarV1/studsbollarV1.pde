//Huvuddelen av koden
float gravity = 9.82;
ArrayList<Boll> bollar = new ArrayList<Boll>();
boolean hasTheMouseBeenPressed = false;
int elapsedFrames = 0;
void setup() {
  createBalls(2);
  size(500, 500);
}
void mousePressed() {
  createBalls(1,mouseX,mouseY);
  hasTheMouseBeenPressed = true;
}
void draw() {
  background(0);
  for (int i = 0; i < bollar.size(); i++) {
    bollar.get(i).move();
    bollar.get(i).show();
  }
  if (elapsedFrames > 60*5 && !hasTheMouseBeenPressed) {
    fill(255);
    textSize(25);
    textAlign(CENTER,CENTER);
    text("Klicka med musen!", width/2, height/2);
  }
  elapsedFrames++;
}

void createBalls(int n) {
  for (int i = 0; i < n; i++) {
    color c = color(random(5,255),random(5,255),random(5,255), 200);
    float r = random(20,40);
    float x = width/2;
    float y = random((width/8)+r,height-r-(width/4));
    float speedX = random(-5,5);
    bollar.add(new Boll(x,y,speedX,0,r,c));
  }
}
void createBalls(int n, float x, float y) {
  for (int i = 0; i < n; i++) {
    color c = color(random(5,255),random(5,255),random(5,255), 200);
    float r = random(20,40);
    float speedX = random(-5,5);
    bollar.add(new Boll(x,y,speedX,0,r,c));
  }
}

//Klass för bollen
class Boll {
  public float x;
  public float y;
  public float speedX;
  public float speedY;
  public float speedYInit;
  public float d;
  public float fallTime;
  public color c;
  
  public Boll(float x, float y, float speedX, float speedY, float d, color c) {
    this.x = x;
    this.y = y;
    
    this.fallTime = 0;
    
    this.speedX = speedX;
    this.speedY = speedY;
    
    this.d = d;
    
    this.c = c;
  }
  
  void move() {
    //Add speed
    float virtualGravity = gravity * 0.1120162932790224;
    this.speedY = this.speedYInit + virtualGravity * this.fallTime;
    this.fallTime++;
    
    //Flytta bollen
    this.y = this.y + this.speedY;
    this.x = this.x + this.speedX;
    
    //Botten
    if (this.y > height-this.d/2) {
      this.speedYInit = -this.speedY;
      this.fallTime = 0;
    }
    //Toppen
    if (this.y < 0+this.d/2) {
      this.speedYInit = -this.speedY;
      this.fallTime = 0;
    }
    //Höger
    if (this.x > width-this.d/2) {
      this.speedX = -this.speedX;
    }
    //Vänster
    if (this.x < 0+this.d/2) {
      this.speedX = -this.speedX;
    }
  }
  
  void show() {
    noStroke();
    fill(this.c);
    ellipse(this.x,this.y,this.d,this.d);
  }
}