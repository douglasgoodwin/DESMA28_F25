// ----------------------------------------------
// DESMA28: INTERACTIVITY
// Prof. Goodwin
// ----------------------------------------------
// NAME: [Your Full Name]
// DATE: [MM/DD/YY]
// WEEK: W00 | Orientation: Hello, p5.js
// ----------------------------------------------

let x, y;       // position
let dx, dy;     // velocity
let r = 20;     // radius of ball

function setup() {
  let cnv = createCanvas(800, 400);
  cnv.parent('canvas-container');
  
  // initialize position and velocity
  x = 100;
  y = 100;
  dx = 3;
  dy = 2;
}

function draw() {
  background(250);

  // update position
  x += dx;
  y += dy;

  // bounce off edges
  if (x - r < 0 || x + r > width) {
    dx *= -1;
  }
  if (y - r < 0 || y + r > height) {
    dy *= -1;
  }

  // draw ball
  circle(x, y, r * 2);

  // draw text feedback
  fill(0);
  textSize(16);
  text(`x: ${x}`, 10, 20);
  text(`y: ${y}`, 10, 40);
  text(`dx: ${dx}`, 10, 60);
  text(`dy: ${dy}`, 10, 80);

  // also log to console
  console.log(`x=${x}, y=${y}, dx=${dx}, dy=${dy}`);
}