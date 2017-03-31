boolean AND1;
boolean AND2;
boolean AND3;
boolean XOR1;
boolean XOR2;
boolean XOR3;
boolean OR;
PImage bg;
int[] input = new int[] {0,1,1,1};

boolean checkBorder(PVector center, int w) {
  if (mouseX > center.x-w/2) {
    if (mouseX < center.x+w/2) {
      if (mouseY < center.y+w/2) {
        if (mouseY > center.y-w/2) {
          return true;
        }
      }
    }
  } 
  return false;
}

void setup() {
  size(800,800);
  bg = loadImage("background.png");
}
void draw() {
  background(bg);
  fill(255);
  stroke(0);
  int[] a = raknare(input[0],input[1],input[2],input[3]);
  rectMode(CENTER);
  rect(271,33,50,50);
  rect(350,33,50,50);
  rect(493,33,50,50);
  rect(571,33,50,50);
  
  rect(336,764,50,50);
  rect(409,764,50,50);
  rect(477,764,50,50);
  fill(0);
  textAlign(CENTER,CENTER);
  textSize(35);
  text(input[0],271,33);
  text(input[1],350,33);
  text(input[2],493,33);
  text(input[3],571,33);
  
  text(a[0],336,764);
  text(a[1],409,764);
  text(a[2],477,764);
  
  color c1 = color(255,0);
  color c2 = color(30,100,200,200);
  int r = 60;
  int r2 = 20;
  noStroke();
  if (AND1) {fill(c2);} else {fill(c1);}
    beginShape();
    vertex(74,192);
    vertex(74,228);
    vertex(75,236);
    vertex(79,240);
    vertex(83,244);
    vertex(87,246);
    vertex(93,250);
    vertex(98,248);
    vertex(105,248);
    vertex(110,246);
    vertex(115,242);
    vertex(119,238);
    vertex(120,234);
    vertex(124,229);
    vertex(123,192);
    vertex(73,191);
    endShape();
 //AND1
  if (XOR1) {fill(c2);} else {fill(c1);}
    beginShape();
    vertex(267,185);
    vertex(266,207);
    vertex(268,214);
    vertex(270,218);
    vertex(273,228);
    vertex(276,236);
    vertex(278,240);
    vertex(282,242);
    vertex(289,245);
    vertex(295,246);
    vertex(299,244);
    vertex(305,241);
    vertex(309,234);
    vertex(312,229);
    vertex(314,220);
    vertex(317,212);
    vertex(318,206);
    vertex(318,197);
    vertex(317,184);
    vertex(312,187);
    vertex(309,190);
    vertex(304,191);
    vertex(299,194);
    vertex(295,195);
    vertex(287,194);
    vertex(281,193);
    vertex(276,189);
    vertex(272,187);
    vertex(265,184);
    endShape();
 //XOR1
  if (AND3) {fill(c2);} else {fill(c1);}
    beginShape();
    vertex(529,192);
    vertex(528,219);
    vertex(529,231);
    vertex(533,238);
    vertex(535,240);
    vertex(539,243);
    vertex(543,246);
    vertex(548,248);
    vertex(553,249);
    vertex(561,247);
    vertex(564,246);
    vertex(569,244);
    vertex(571,239);
    vertex(575,233);
    vertex(579,228);
    vertex(578,192);
    vertex(529,192);
    endShape();
 // AND3
  if (XOR3) {fill(c2);} else {fill(c1);}
    beginShape();
    vertex(663,186);
    vertex(663,202);
    vertex(664,211);
    vertex(666,221);
    vertex(668,225);
    vertex(669,230);
    vertex(672,234);
    vertex(676,237);
    vertex(679,243);
    vertex(681,244);
    vertex(686,246);
    vertex(691,246);
    vertex(697,245);
    vertex(701,240);
    vertex(705,236);
    vertex(709,228);
    vertex(710,223);
    vertex(711,218);
    vertex(714,212);
    vertex(714,206);
    vertex(714,197);
    vertex(714,185);
    vertex(708,189);
    vertex(706,190);
    vertex(701,191);
    vertex(696,193);
    vertex(689,194);
    vertex(684,194);
    vertex(680,195);
    vertex(677,194);
    vertex(671,191);
    vertex(668,189);
    vertex(664,185);
    endShape();
 // XOR3
  if (AND2) {fill(c2);} else {fill(c1);}
    beginShape();
    vertex(149,345);
    vertex(149,379);
    vertex(152,384);
    vertex(153,389);
    vertex(157,395);
    vertex(164,398);
    vertex(169,399);
    vertex(174,400);
    vertex(180,400);
    vertex(187,396);
    vertex(192,392);
    vertex(198,387);
    vertex(198,380);
    vertex(199,344);
    vertex(150,345);
    endShape();
 //AND2
  if (XOR2) {fill(c2);} else {fill(c1);}
    beginShape();
    vertex(284,347);
    vertex(283,361);
    vertex(285,375);
    vertex(286,384);
    vertex(289,393);
    vertex(291,397);
    vertex(295,402);
    vertex(299,405);
    vertex(306,408);
    vertex(313,409);
    vertex(318,406);
    vertex(323,399);
    vertex(327,393);
    vertex(330,385);
    vertex(335,376);
    vertex(334,348);
    vertex(326,352);
    vertex(317,355);
    vertex(308,356);
    vertex(300,356);
    vertex(292,352);
    vertex(287,348);
    vertex(284,346);
    endShape();
 //XOR2
  if (OR) {fill(c2);} else {fill(c1);}
    beginShape();
    vertex(90,526);
    vertex(90,544);
    vertex(92,558);
    vertex(95,565);
    vertex(99,575);
    vertex(103,582);
    vertex(112,587);
    vertex(121,586);
    vertex(129,581);
    vertex(132,574);
    vertex(136,567);
    vertex(141,555);
    vertex(139,524);
    vertex(136,528);
    vertex(134,529);
    vertex(126,534);
    vertex(117,534);
    vertex(104,533);
    vertex(98,530);
    vertex(93,528);
    vertex(90,525);
    endShape();
  //OR
  
  if (OR) {fill(c2);} else {fill(c1);}
  ellipse(343,721,r2,r2);
  if (XOR2) {fill(c2);} else {fill(c1);}
  ellipse(410,721,r2,r2);
  if (XOR3) {fill(c2);} else {fill(c1);}
  ellipse(477,721,r2,r2);
  
  if (input[0] == 1) {fill(c2);} else {fill(c1);}
  ellipse(275,76,10,10);
  if (input[1] == 1) {fill(c2);} else {fill(c1);}
  ellipse(351,76,10,10);
  if (input[2] == 1) {fill(c2);} else {fill(c1);}
  ellipse(495,76,10,10);
  if (input[3] == 1) {fill(c2);} else {fill(c1);}
  ellipse(570,76,10,10);
}
void mousePressed() {
  if (mouseButton == LEFT) {
    println("vertex(" + mouseX + "," + mouseY + ");");
  } else if (mouseButton == CENTER) {
    println("endShape();");
  } else {
    println("beginShape();");
  }

  int[] squares = new int[] {271,350,493,571};
  for (int i = 0; i < squares.length; i++) {
    boolean c = checkBorder(new PVector(squares[i],33),50);
    if (c) {
      if (input[i] == 0) {
        input[i] = 1;
      } else {
        input[i] = 0;
      }
    }
  }
  

}

int[] raknare(int ia1, int ia2, int ib1, int ib2) {
        int[] error = new int[] {0,0,0};
        //Konvertering
        boolean inputa1;
        boolean inputa2;
        boolean inputb1;
        boolean inputb2;
        if (ia1 == 1) {inputa1 = true;} else if (ia1 == 0) {inputa1 = false;} else {return error;}
        if (ia2 == 1) {inputa2 = true;} else if (ia2 == 0) {inputa2 = false;} else {return error;}
        if (ib1 == 1) {inputb1 = true;} else if (ib1 == 0) {inputb1 = false;} else {return error;}
        if (ib2 == 1) {inputb2 = true;} else if (ib2 == 0) {inputb2 = false;} else {return error;}

        int a1;
        int a2;
        int a3;

        // Kalkylation
        

        if (inputa1 && inputb1) {AND1 = true;} else {AND1 = false;} //AND1
        if (inputa1 ^ inputb1) {XOR1 = true;} else {XOR1 = false;} //XOR1
        if (inputa2 && inputb2) {AND3 = true;} else {AND3 = false;} //AND3
        if (inputa2 ^ inputb2) {XOR3 = true;} else {XOR3 = false;} //XOR3

        if (XOR1 && AND3) {AND2 = true;} else {AND2 = false;} //AND2
        if (XOR1 ^ AND3) {XOR2 = true;} else {XOR2 = false;} //XOR2

        if (AND1 || AND2) {OR = true;} else {OR = false;} //OR

        //Konvertering
        if (OR) {a1 = 1;} else {a1 = 0;}
        if (XOR2) {a2 = 1;} else {a2 = 0;}
        if (XOR3) {a3 = 1;} else {a3 = 0;}

        //Svar
        return new int[] {a1,a2,a3};
    }