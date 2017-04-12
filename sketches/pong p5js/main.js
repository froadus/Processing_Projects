var theball;
var handles;
var gameover = false;
var AI = true;
var PLAYER = false;

function setup() {
  createCanvas(windowWidth,windowHeight);
  theball = new Ball(10,-10,25,10,5);
  handles = [
    new Handle("top", AI, 230,50,50),
    new Handle("bottom", PLAYER,200,255,255)
  ];
}

function draw() {
  background(0);
  
  if (!gameover) {
    theball.move();
    theball.show();
    
    for (var i = 0; i < handles.length; i++) {
      handles[i].move();
      handles[i].show();
    }
  } else {
    fill(255);
    textAlign(CENTER,CENTER);
    textSize(200);
    text("GAME OVER!", windowWidth/2, windowHeight/2);
  }
  console.log(theball.xSpeed);
}

function windowResized() {
  resizeCanvas(windowWidth, windowHeight);
}

function Handle(placement, theplayer, r, g, b) {
  this.height = 20;
  this.width = 200;
  this.ai = theplayer;
  this.r = r;
  this.g = g;
  this.b = b;
  this.aiError = random(50000);
  if (placement == "top") {
    this.x = windowWidth/2;
    this.y = 0;
    this.top = true;
  } else if (placement == "bottom") {
    this.x = windowWidth/2;
    this.y = windowHeight - this.height;
    this.top = false;
  } else {
    console.log("Placement of new Handle is invalid.");
  }
}

Handle.prototype.show = function() {
  noStroke();
  fill(this.r,this.g,this.b);
  rect(this.x - this.width/2, this.y, this.width, this.height);
}

Handle.prototype.move = function() {
  if (this.ai) {
    this.x = theball.xPos + map(noise(this.aiError),0,1,-200,200);
    this.aiError += 0.007;
  } else {
    this.x = mouseX;
  }
}

function Ball(speedX, speedY, maxXSpeed, maxYSpeed, inc) {
  this.xPos = windowWidth/2;
  this.yPos = windowHeight/2;
  this.xSpeed = speedX;
  this.ySpeed = speedY;
  this.d = 50; // Diameter
  this.maxXSpeed = maxXSpeed;
  this.maxYSpeed = maxYSpeed;
  this.inc = inc;
}

Ball.prototype.move = function() {
  if (this.xPos + this.d/2 > windowWidth) {
    this.xSpeed = -this.xSpeed;
  }
  if (this.xPos - this.d/2 < 0) {
    this.xSpeed = -this.xSpeed;
  }
  if (this.yPos + this.d/2 > windowHeight) {
    gameOver();
  }
  if (this.yPos - this.d/2 < 0) {
    gameOver();
  }
  this.xPos += this.xSpeed;
  this.yPos += this.ySpeed;
  
  for (var i = 0; i < handles.length; i++) {
    other = handles[i];
    var aX;
    var aY;
    if (Math.abs(this.xSpeed) >= this.maxXSpeed) {
      aX = 1;
    } else {
      aX = 1 + this.inc / 100;
    }
    if (Math.abs(this.ySpeed) >= this.maxYSpeed) {
      aY = 1;
    } else {
      aY = 1 + this.inc / 100;
    }
    if (other.top) {
      if (this.yPos - this.d/2 < other.y + other.height 
          && this.xPos > other.x - other.width/2 
          && this.xPos < other.x + other.width/2) {
        this.ySpeed = -this.ySpeed*aY;
        this.xSpeed = this.xSpeed*aX;
      }
    } else {
      if (this.yPos + this.d/2 > other.y 
          && this.xPos > other.x - other.width/2 
          && this.xPos < other.x + other.width/2) {
        this.ySpeed = -this.ySpeed*aX;
        this.xSpeed = this.xSpeed*aY;
      }
    }
  }
}

Ball.prototype.show = function() {
  noStroke();
  fill(255,140,100,120);
  ellipse(this.xPos,this.yPos,this.d,this.d);
}

function gameOver() {
  gameover = true;
}