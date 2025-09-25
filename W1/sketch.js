// ----------------------------------------------
// DESMA28: INTERACTIVITY
// Prof. Goodwin
// ----------------------------------------------
// NAME: [Your Full Name]
// DATE: [MM/DD/YY]
// W1 | Exercise
// ----------------------------------------------

let buttonX, buttonY;    // button center
let buttonW = 150;       // button width
let buttonH = 60;        // button height
let buttonPressed = false;

function setup() {
  let cnv = createCanvas(900, 400);
  cnv.parent('canvas-container');

  // center the button
  buttonX = width / 2;
  buttonY = height / 2;
}

function draw() {
  background(240);

  // draw button rectangle
  rectMode(CENTER);
  stroke(0);
  fill(buttonPressed ? color(200, 0, 0) : color(255));
  rect(buttonX, buttonY, buttonW, buttonH, 10);

  // button label
  fill(0);
  noStroke();
  textAlign(CENTER, CENTER);
  textSize(18);
  text("Press Me", buttonX, buttonY);
}

function mousePressed() {
  // check if mouse is inside button bounds
  if (
    mouseX > buttonX - buttonW/2 &&
    mouseX < buttonX + buttonW/2 &&
    mouseY > buttonY - buttonH/2 &&
    mouseY < buttonY + buttonH/2
  ) {
    buttonPressed = !buttonPressed; // toggle state
  }
}
