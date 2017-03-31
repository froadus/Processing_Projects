ArrayList<Particle> ellipses = new ArrayList<Particle>(); // En lista som sparar alla partiklar i sketchen

void setup() {
  //fullScreen();
  size(700,700);
  frameRate(60);
  
  //Skapar partiklarna
  for (int i = 0; i < 80; i++) {
    float x = random(width); // x = slumpmässig bredd
    float y = random(height); // y = slumpmässig höjd
    ellipses.add(new Particle(x,y)); // Skapa en partikel vis x, y
  }
  
  //Beräkna partiklar som ligger nära varandra (endast för prestandaförbättring)
  for (int i = 0; i < ellipses.size(); i++) {
    Particle ellipse = ellipses.get(i);
    ellipse.calcNear();
  }
}

// Drawfunktionen
void draw() {
  background(255); //Ny bakgrund för varje frame
  for (int i = 0; i < ellipses.size(); i++) { // Körs en gång för varje partikel  (varje ellipse)
    Particle ellipse = ellipses.get(i); // Sparar ellipses med index i till variabeln ellipse
    ellipse.move(); // Flytta partikeln med movefunktionen (se nedan)
    ellipse.makeLine(); // Beräkna vilka andra partiklar som det ska dras en linje mellan
    ellipse.show(); // Slutlige så ritas ellipsen med funktionen show()
  }
}

// Partikelklassen
class Particle {
  // Den position där partikeln roterar runt
  public float xCenter; // Rotationspunkt x-led
  public float yCenter; // Rotationspunkt y-led
  
  // Partikelns nuvarade position i dess omloppsbana
  public float xPos; // Position i x-led
  public float yPos; // Position i y-led
  
  public float rot; // Partikelns nuvarande rotation i förhållande till centerpositionen
  public float rotSpeed; // Hastighet och rotation (varierar mellan partiklar)
  
  public color c; // En färgvariabel för varje partikel
  
  public ArrayList<Particle> near; // En variabel för att hålla koll på de partiklarana som ligger nära partikeln (för prestandaoptimering)
  
  public Particle(float x, float y) { // Konstruktionsfunktion
    // xCenter och yCenter variablarna bestäms när partikeln skapas, se funktionen setup()
    this.xCenter = x; 
    this.yCenter = y;
    
    // Partikelns initiala rotation är lika med 0
    this.rot = 0;
    
    // Partikeln får en slumpmässig rotationshastighet
    this.rotSpeed = random(-1,1);
    
    // Definiering av near ArrayList
    this.near = new ArrayList<Particle>();
    
    //Flyttar partikeln och ger den en färg enligt funktionerna nedan
    this.move();
    //this.newColor();
    this.c = color(random(90),random(40,160),random(140,200));
  }
  
  void calcNear() { // En funktion som optimiserar så att varje partikel endast kollar på närliggande partiklar
    for (int i = 0; i < ellipses.size(); i++) { // Körs en gång för varje partikel
      Particle testEllipse = ellipses.get(i); // Placerar partikeln som loopen går igenom i variabeln testEllipse
      if (testEllipse != this) { // Konstrollerar att den ellipse som programmet går igenom inte är sig själv
        if (dist(testEllipse.xCenter,testEllipse.yCenter,this.xCenter,this.yCenter) <= 800) { 
          near.add(testEllipse); // Lägger till en partikel i ArrayList near
        }
      }
    }
  }
  void move() { // Funktion som flyttar en partikel
    // Partikelns x och y positioner flyttas enligt formeln
    this.xPos = this.xCenter + cos(this.rot) * 70; 
    this.yPos = this.yCenter + sin(this.rot) * 70;
    
    // Partikelns rotation ökar/minskar enligt formeln
    this.rot += 0.06 * this.rotSpeed;
  }
  
  void show() { // Partikeln visas med funktionen
    fill(this.c,120); // Partikeln får färg från variabeln this.c med 80/255 opacitet
    //stroke(this.c,70); 
    noStroke();
    ellipse(this.xPos,this.yPos,2,2); // Ritar partikeln med x-positionen, y-positionen med storleken 4 px diameter
  }
  
  void makeLine() { // Funktion för att skapa en linje mellan två partiklar
    beginShape();
    int vertexCount = 0;
    vertex(this.xPos,this.yPos);
    for (int i = 0; i < near.size(); i++) { // Körs en gång för alla partiklar i närheten av partikeln
      Particle testEllipse = near.get(i); // Placerar partikeln som loopen går igenom i variabeln testEllipse
      if (testEllipse != this) { // Konstrollerar att den ellipse som programmet går igenom inte är sig själv
        // Ritar en linje mellan nuvarande partikel och testpartikeln endast om avståndet är mindre än 70 px
        if(dist(testEllipse.xPos,testEllipse.yPos,this.xPos,this.yPos) < 100) {
          
          //line(testEllipse.xPos,testEllipse.yPos,this.xPos,this.yPos); // Ritar linjen
          if (vertexCount > 1) {} else {
            vertex(testEllipse.xPos,testEllipse.yPos);
            vertexCount++;
          }
          //this.c = testEllipse.c; // Partikeln får samma färg som testpartikeln
        }
      }
    }
    vertex(this.xPos,this.yPos);
    if(vertexCount <= 1) {
      noStroke();
      noFill();
    } else {
      //stroke(this.c,30); // Ändrar färg på linjen
      noStroke();
      fill(this.c,100);
    }
    endShape();
  }
}