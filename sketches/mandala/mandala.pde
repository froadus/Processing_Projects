//Variablar för Mandalans utseende
int iterations = 3;
int rot = 40;
int opacityFactor = 5;


ArrayList<Mandala> mandalas = new ArrayList<Mandala>();
int elapsedFrames = 0;
float spawnRateMillisec = 3000;
void setup() {
  //size(500,500);
  fullScreen();
}
void draw() {
  background(0);
    for (int i = mandalas.size()-1; i >= 0; i--) {
      Mandala m = mandalas.get(i);
      m.show();
      m.fade();
      if (m.fade <= 0) {
        mandalas.remove(i);
      }
    }
    if (mandalas.size() < 4) {
      mandalas.add(new Mandala(random(width),random(height))); 
    }
    elapsedFrames++;  
}

void mousePressed() {
  //mandalas.add(new Mandala(mouseX,mouseY)); 
  println(mandalas.size());
}

class Mandala {
  
  public float x;
  public float y;
  
  public float[] w;
  public float[] h;
  
  public float r;
  public float b;
  public float g;
  public float fade;
  
  public float fadeRate;
  
  public int existingLength;
  
  public Mandala(float x,float y) {
    this.x = x;
    this.y = y;
    
    this.w = new float[iterations];
    this.h = new float[iterations];
    for (int i = 0; i < iterations; i++) {
      this.w[i] = random(100,200);
      this.h[i] = random(300,500);
    }
    this.r = random(255);
    this.b = random(255);
    this.g = random(255);
    this.fade = 255/opacityFactor;
    this.existingLength = 0;
    this.fadeRate = random(1,4);
  }
  
  void fade() {
     this.existingLength++;
     if (existingLength > 0) {
       this.fade -= this.fadeRate;
     }
  }
  
  void show() {
    color c = color(this.r,this.b,this.g,this.fade);
    translate(this.x,this.y);
    noFill();
    stroke(c);
    for (int i = 0; i < rot; i++) {
      rotate(TWO_PI/rot);
      for (int j = 0; j < iterations; j++) {
        ellipse(0,0,this.w[j],this.h[j]);
      }
      
    }
    translate(-this.x,-this.y);
  }
}