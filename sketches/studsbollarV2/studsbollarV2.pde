
/*
----------------------
Huvuddelen av sketchen
----------------------
*/

float gravity = 9.82;
ArrayList<Boll> bollar = new ArrayList<Boll>();
boolean hasTheMouseBeenPressed = false;
int elapsedFrames = 0;

void setup() {
  createBalls(2,random(20,40)); //Skapar 2st bollar i början med slupmässig radie mellan 20 och 40
  size(1000, 1000);
}

void mousePressed() {
  createBalls(1,mouseX,mouseY,random(20,40)); //Skapar en boll med positionen mouseX och mouseY
  hasTheMouseBeenPressed = true; //Nu har musen klickats minst en gång
}

void draw() {
  background(0);
  for (int i = 0; i < bollar.size(); i++) {
    bollar.get(i).move();
    bollar.get(i).show();
    bollar.get(i).collideCalc();
  }
  if (!hasTheMouseBeenPressed) {
    fill(255);
    textSize(25);
    textAlign(CENTER,CENTER);
    text("Klicka med musen!", width/2, height/2);
  }
  elapsedFrames++;
}

/*
------------------
Bollens egenskaper
------------------
*/

//Skapa bollar med antal och storlek som parametrar
void createBalls(int n, float d) {
  for (int i = 0; i < n; i++) {
    color c = color(random(5,255),random(5,255),random(5,255), 200);
    float x = width/2;
    float y = random((width/8)+d,height-d-(width/4));
    float speedX = random(-3,3);
    float mass = (pow((d/2),2)*PI)/10000;
    bollar.add(new Boll(x,y,speedX,0,d,c,mass));
  }
}
//Skapa bollar med antal, x, y och storlek som parametrar
void createBalls(int n, float x, float y, float d) {
  for (int i = 0; i < n; i++) {
    color c = color(random(5,255),random(5,255),random(5,255), 200);
    float speedX = random(-3,3);
    float mass = (pow((d/2),2)*PI)/10000;
    bollar.add(new Boll(x,y,speedX,0,d,c,mass));
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
  public color c;
  public float mass;
  
  public Boll(float x, float y, float speedX, float speedY, float d, color c, float mass) {
    this.x = x;
    this.y = y;
    
    this.speedX = speedX;
    this.speedY = speedY;
    
    this.d = d;
    
    this.c = c;
    
    this.mass = mass;
  }
  
  void move() {
    //Add speed
    float virtualGravity = gravity * 0.2120162932790224;
    this.speedY = this.speedY + virtualGravity;
    
    //Flytta bollen
    this.y = this.y + this.speedY;
    this.x = this.x + this.speedX;
    
    //Botten
    if (this.y > height-this.d/2) {
      this.speedY = -40;//-this.speedY;
      while (this.y >= height-this.d/2) {
        this.y--;
      }
    }
    //Toppen
    if (this.y < 0+this.d/2) {
      this.speedY = -this.speedY;
    }
    //Höger
    if (this.x > width-this.d/2) {
      this.speedX = -this.speedX;
      this.x = width-this.d/2;
    }
    //Vänster
    if (this.x < 0+this.d/2) {
      this.speedX = -this.speedX;
      this.x = 0+this.d/2;
    }
  }
  
  void show() {
    noStroke();
    fill(this.c);
    ellipse(this.x,this.y,this.d,this.d);
  }
  
  void collideCalc() {
    for (int i = 0; i < bollar.size(); i++) {
      Boll other = bollar.get(i);
      float distance = dist(this.x,this.y,other.x,other.y);
      if (distance <= (this.d/2 + other.d/2) && distance != 0) {
        
        //Beräkna krock
        float dx = abs(this.x - other.x);
        float dy = abs(this.y - other.y);
        float ang = atan(dx/dy) + 1.57079633;
        float angD = degrees(ang);
        
        //Beräkna hastighetsfaktorer
        float xSpeedFac = map(angD,90,180,0,1);
        float ySpeedFac = 1 - xSpeedFac;
        
        //Beräkna hastigheter
        float tXSpTmp = (((this.mass*this.speedX)-(other.mass*this.speedX)+(2*other.mass*other.speedX))/(this.mass+other.mass));
        float oXSpTmp = (((2*this.mass*this.speedX)-(this.mass*other.speedX)+(other.mass*other.speedX))/(this.mass+other.mass));
        float tYSpTmp = (((this.mass*this.speedY)-(other.mass*this.speedY)+(2*other.mass*other.speedY))/(this.mass+other.mass));
        float oYSpTmp = (((2*this.mass*this.speedY)-(this.mass*other.speedY)+(other.mass*other.speedY))/(this.mass+other.mass));
        this.speedX = (tXSpTmp*xSpeedFac + tYSpTmp*xSpeedFac);
        other.speedX = (oXSpTmp*xSpeedFac + oYSpTmp*xSpeedFac);
        this.speedY = (tYSpTmp*ySpeedFac + tXSpTmp*ySpeedFac);
        other.speedY = (oYSpTmp*ySpeedFac + oYSpTmp*ySpeedFac);
        
        //Testa så att de inte kolliderar flera gånger per kollision
        float distanceNew = dist(this.x,this.y,other.x,other.y);
        while(distanceNew <= (this.d/2 + other.d/2) && distance != 0) {
          //for x
          if ((this.x - other.x) < 0) {
            this.x--;
            other.x++;
          } else {
            this.x++;
            other.x--;
          }
          //for y
          if ((this.y - other.y) < 0) {
            this.y--;
            other.y++;
          } else {
            this.y++;
            other.y--;
          }
          distanceNew = dist(this.x,this.y,other.x,other.y);
        }
        break;
      }
    }
  }
}