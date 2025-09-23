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
  
  x = width / 2;
  y = height / 2;
  dx = 3;       // horizontal speed
  dy = 2;       // vertical speed
}


function draw() {
  background(255);

  // Update position
  x += dx;
  y += dy;

  // Check for collisions with edges
  if (x - r < 0 || x + r > width) {
    dx *= -1;   // reverse horizontal velocity
  }
  if (y - r < 0 || y + r > height) {
    dy *= -1;   // reverse vertical velocity
  }

  // Draw the ball
  noFill()
  stroke(0);
  strokeWeight(2);
  circle(x, y, r * 2);
}