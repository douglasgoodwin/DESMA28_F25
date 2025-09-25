#!/usr/bin/env bash
set -euo pipefail

# Generate/overwrite sketch.js in every Wxx folder present.
# Works on macOS/Linux; no brace expansion required.

# Template chunks (kept readable)
HEADER_TOP='// ----------------------------------------------
// DESMA28: INTERACTIVITY
// Prof. Goodwin
// ----------------------------------------------
// NAME: [Your Full Name]
// DATE: [MM/DD/YY]'
HEADER_BOTTOM='// ----------------------------------------------'

# Find Wxx folders (W00..W99), sorted
WEEK_DIRS=$(find . -maxdepth 1 -type d -name "W[0-9][0-9]" | sort)

if [ -z "$WEEK_DIRS" ]; then
  echo "No Wxx folders found. Create some (e.g., W01) and re-run."
  exit 1
fi

count=0
for DIR in $WEEK_DIRS; do
  WEEK=$(basename "$DIR")         # e.g., W01
  WEEK_NUM="${WEEK#W}"            # e.g., 01
  FILE="$DIR/sketch.js"

  cat > "$FILE" <<EOF
${HEADER_TOP}
// ${WEEK} | Exercise
${HEADER_BOTTOM}

let buttonX, buttonY;    // button center
let buttonW = 150;       // button width
let buttonH = 60;        // button height
let buttonPressed = false;

function setup() {
  let cnv = createCanvas(900, 400);
  cnv.parent('canvas-container');

  // center the button relative to the canvas size
  buttonX = width / 2;
  buttonY = height / 2;

  // Optional: set up text look
  textFont('monospace');
  textSize(18);
}

function draw() {
  background(240);

  // draw button rectangle from its center
  rectMode(CENTER);
  stroke(0);
  strokeWeight(2);

  // white when off, red-ish when on
  if (buttonPressed) {
    fill(200, 0, 0);
  } else {
    fill(255);
  }

  rect(buttonX, buttonY, buttonW, buttonH, 10);

  // button label
  noStroke();
  fill(0);
  textAlign(CENTER, CENTER);
  text("Press Me", buttonX, buttonY);
}

function mousePressed() {
  if (
    mouseX > buttonX - buttonW/2 &&
    mouseX < buttonX + buttonW/2 &&
    mouseY > buttonY - buttonH/2 &&
    mouseY < buttonY + buttonH/2
  ) {
    buttonPressed = true; // turn on only while pressed
  }
}

function mouseReleased() {
  buttonPressed = false; // reset when mouse is released
}

EOF

  echo "Updated $FILE"
  count=$((count + 1))
done

echo "Done. Regenerated $count sketch.js file(s)."