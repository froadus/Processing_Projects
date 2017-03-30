ArrayList<Particle> ell = new ArrayList<Particle>();
void setup() {
  size(600,600);
  //fullScreen();
  frameRate(60);
  
  //Koordinater för bound
  PVector bound[] = new PVector[21];
  bound[0] = new PVector(169,213);
  bound[1] = new PVector(169,243);
  bound[2] = new PVector(184,249);
  bound[3] = new PVector(196,249);
  bound[4] = new PVector(216,253);
  bound[5] = new PVector(223,253);
  bound[6] = new PVector(223,498);
  bound[7] = new PVector(204,499);
  bound[8] = new PVector(189,503);
  bound[9] = new PVector(169,508);
  bound[10] = new PVector(170,536);
  bound[11] = new PVector(333,537);
  bound[12] = new PVector(333,506);
  bound[13] = new PVector(318,504);
  bound[14] = new PVector(305,501);
  bound[15] = new PVector(292,501);
  bound[16] = new PVector(281,499);
  bound[17] = new PVector(279,212);
  bound[18] = new PVector(244,213);
  bound[19] = new PVector(212,213);
  bound[20] = new PVector(183,213);

  PVector bound2[] = new PVector[75];
  bound2[0] = new PVector(286,136);
  bound2[1] = new PVector(286,65);
  bound2[2] = new PVector(311,58);
  bound2[3] = new PVector(341,54);
  bound2[4] = new PVector(362,52);
  bound2[5] = new PVector(387,55);
  bound2[6] = new PVector(400,58);
  bound2[7] = new PVector(410,63);
  bound2[8] = new PVector(420,67);
  bound2[9] = new PVector(430,75);
  bound2[10] = new PVector(441,84);
  bound2[11] = new PVector(445,94);
  bound2[12] = new PVector(454,108);
  bound2[13] = new PVector(455,125);
  bound2[14] = new PVector(453,148);
  bound2[15] = new PVector(449,162);
  bound2[16] = new PVector(440,181);
  bound2[17] = new PVector(430,195);
  bound2[18] = new PVector(420,205);
  bound2[19] = new PVector(408,213);
  bound2[20] = new PVector(393,219);
  bound2[21] = new PVector(405,223);
  bound2[22] = new PVector(420,231);
  bound2[23] = new PVector(432,239);
  bound2[24] = new PVector(442,247);
  bound2[25] = new PVector(450,259);
  bound2[26] = new PVector(458,275);
  bound2[27] = new PVector(462,290);
  bound2[28] = new PVector(462,311);
  bound2[29] = new PVector(459,326);
  bound2[30] = new PVector(454,344);
  bound2[31] = new PVector(444,362);
  bound2[32] = new PVector(435,374);
  bound2[33] = new PVector(420,388);
  bound2[34] = new PVector(402,397);
  bound2[35] = new PVector(381,406);
  bound2[36] = new PVector(358,412);
  bound2[37] = new PVector(337,415);
  bound2[38] = new PVector(324,415);
  bound2[39] = new PVector(323,376);
  bound2[40] = new PVector(336,376);
  bound2[41] = new PVector(350,374);
  bound2[42] = new PVector(363,371);
  bound2[43] = new PVector(376,365);
  bound2[44] = new PVector(389,360);
  bound2[45] = new PVector(402,347);
  bound2[46] = new PVector(411,328);
  bound2[47] = new PVector(412,312);
  bound2[48] = new PVector(412,296);
  bound2[49] = new PVector(408,283);
  bound2[50] = new PVector(401,272);
  bound2[51] = new PVector(389,261);
  bound2[52] = new PVector(376,254);
  bound2[53] = new PVector(358,249);
  bound2[54] = new PVector(342,246);
  bound2[55] = new PVector(321,245);
  bound2[56] = new PVector(321,211);
  bound2[57] = new PVector(335,208);
  bound2[58] = new PVector(360,201);
  bound2[59] = new PVector(375,194);
  bound2[60] = new PVector(389,181);
  bound2[61] = new PVector(399,167);
  bound2[62] = new PVector(406,153);
  bound2[63] = new PVector(407,136);
  bound2[64] = new PVector(406,125);
  bound2[65] = new PVector(399,112);
  bound2[66] = new PVector(388,99);
  bound2[67] = new PVector(376,93);
  bound2[68] = new PVector(362,90);
  bound2[69] = new PVector(348,90);
  bound2[70] = new PVector(334,92);
  bound2[71] = new PVector(321,96);
  bound2[72] = new PVector(319,111);
  bound2[73] = new PVector(317,129);
  bound2[74] = new PVector(313,138);
  
  
  //Skapar partiklarna
  int iterations = 0;
  int j = 0;
  while (j < 350 || iterations > 20000) {
    float x = random(width);
    float y = random(height);
    PVector pos = new PVector(x,y);
    if (pixelInPoly(bound, pos) || pixelInPoly(bound2, pos)) {
      ell.add(new Particle(x,y));
      j++;
    }
    iterations++;
  }
  
  for (int i = 0; i < ell.size(); i++) { //Beräkna partiklar som ligger nära varandra
    Particle ellipse = ell.get(i);
    ellipse.calcNear();
  }
}

void draw() {
  background(10);
  for (int i = 0; i < ell.size(); i++) {
    Particle ellipse = ell.get(i);
    ellipse.move();
    ellipse.makeLine();
    ellipse.show();
  }
  println(frameRate);
  //saveFrame();
}

class Particle {
  public float xCenter; // Rotationspunkt x
  public float yCenter; // Rotationspunkt y
  
  public float xPos;
  public float yPos;
  
  public float rot; // Rotation
  public float rotSpeed; // Hastighet och rotation
  
  public color c;
  
  public ArrayList<Particle> near;
  
  public Particle(float x, float y) {
    this.xCenter = x;
    this.yCenter = y;
    
    this.rot = 0;
    
    this.rotSpeed = random(-1,1);
    
    this.near = new ArrayList<Particle>();
    
    this.move();
    this.newColor();
  }
  
  void calcNear() { // En funktion som optimiserar så att varje partikel endast kollar på närliggande partiklar
    for (int i = 0; i < ell.size(); i++) {
      Particle testEllipse = ell.get(i);
      if (testEllipse != this) {
        if (dist(testEllipse.xCenter,testEllipse.yCenter,this.xCenter,this.yCenter) <= 200) {
          near.add(testEllipse);
        }
      }
    }
  }
  void move() {
    this.xPos = this.xCenter + cos(this.rot) * 15;
    this.yPos = this.yCenter + sin(this.rot) * 15;
    this.rot += 0.06 * this.rotSpeed;
  }
  
  void show() {
    fill(this.c,80);
    noStroke();
    ellipse(this.xPos,this.yPos,4,4);
  }
  
  void makeLine() {
    //println(near.size());
    //println(ell.size());
    for (int i = 0; i < near.size(); i++) {
      Particle testEllipse = near.get(i);
      if (testEllipse != this) {
        if(dist(testEllipse.xPos,testEllipse.yPos,this.xPos,this.yPos) < 20) {
          stroke(this.c,100);
          line(testEllipse.xPos,testEllipse.yPos,this.xPos,this.yPos);
          //this.c = testEllipse.c;
        }
      }
    }
  }
  
  void newColor() {
    float r = random(1);
    if (r < 0.33) {
      this.c = color(random(255),255,0);
    } else if (r >= 0.33 && r < 0.66) {
      this.c = color(0,random(255),255);
    } else {
      this.c = color(255,0,random(255));
    }
  }
}

// Kod kopierad från https://forum.processing.org/one/topic/how-do-i-find-if-a-point-is-inside-a-complex-polygon.html
// Används för att kolla ifall en punkt är i en polygon
boolean pixelInPoly(PVector[] verts, PVector pos) {
  int i, j;
  boolean c=false;
  int sides = verts.length;
  for (i=0,j=sides-1;i<sides;j=i++) {
    if (( ((verts[i].y <= pos.y) && (pos.y < verts[j].y)) || ((verts[j].y <= pos.y) && (pos.y < verts[i].y))) &&
          (pos.x < (verts[j].x - verts[i].x) * (pos.y - verts[i].y) / (verts[j].y - verts[i].y) + verts[i].x)) {
      c = !c;
    }
  }
  return c;
}