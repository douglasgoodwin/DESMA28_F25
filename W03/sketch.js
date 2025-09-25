// ----------------------------------------------
// DESMA28: INTERACTIVITY
// Prof. Goodwin
// ----------------------------------------------
// NAME: YOUR NAME
// DATE: 09/24/25
// W03 | Template
// ----------------------------------------------

/*
  HOW TO USE THIS FILE
  - Put your variables up top.
  - Use setup() to create your canvas and any once-only config.
  - Use draw() to render each frame and read input.
  - Utilities (like hit testing) are at the bottom for you to reuse.
*/

let bgCol = 220;

// Example button data (customize or delete if not needed this week)
let btn = { x: 40, y: 40, w: 160, h: 48, label: "Click me", isOn: false };

function setup() {
  // Create canvas and attach it to the page container
  let cnv = createCanvas(800, 400);
  cnv.parent('canvas-container');

  // Smoother edges for shapes/text (optional)
  textFont('monospace');
  textSize(16);
}

function draw() {
  background(bgCol);

  // Example button render + hover feedback
  const hovering = hit(mouseX, mouseY, btn.x, btn.y, btn.w, btn.h);
  drawButton(btn.x, btn.y, btn.w, btn.h, btn.label, hovering, btn.isOn);

  // Optional: show state text
  noStroke();
  fill(30);
  text("State: " + (btn.isOn ? "ON" : "OFF"), btn.x, btn.y + btn.h + 24);
}

function mousePressed() {
  // Toggle example button on click
  if (hit(mouseX, mouseY, btn.x, btn.y, btn.w, btn.h)) {
    btn.isOn = !btn.isOn;
    // Change background as feedback
    bgCol = btn.isOn ? color(255, 230, 230) : 220;
  }
}

// ---------- Helpers ----------

function drawButton(x, y, w, h, label, hovering=false, active=false) {
  push();
  stroke(0);
  strokeWeight(2);
  fill(active ? 255 : (hovering ? 240 : 250));
  rect(x, y, w, h, 10);
  noStroke();
  fill(0);
  textAlign(CENTER, CENTER);
  text(label, x + w/2, y + h/2);
  pop();
}

function hit(px, py, x, y, w, h) {
  // Return true if point (px,py) is inside rect at (x,y,w,h)
  return px >= x && px <= x + w && py >= y && py <= y + h;
}
