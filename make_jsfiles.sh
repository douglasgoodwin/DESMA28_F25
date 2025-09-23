#!/usr/bin/env bash
set -euo pipefail

# Week titles indexed 0..10 (W00..W10)
titles=(
  "Orientation: Hello, p5.js"                  # W00
  "Hello, Button!"                              # W01
  "Toggle & Latch Buttons"                      # W02
  "Conditionals & Symmetry"                     # W03
  "Multi-Switch Light (Distributed State)"      # W04
  "Sliders & Continuous Control"                # W05
  "Spatial Interaction (Mouse, Position, Range)"# W06
  "State Machines & Memory"                     # W07
  "Sensors & Remote Input"                      # W08
  "Representation & Visualization"              # W09
  "Final Project Showcase"                      # W10
)

for n in $(seq 0 10); do
  code=$(printf "W%02d" "$n")
  title="${titles[$n]}"
  dir="$code"
  mkdir -p "$dir"

  cat > "$dir/sketch.js" <<EOF
// ----------------------------------------------
// DESMA28: INTERACTIVITY
// Prof. Goodwin
// ----------------------------------------------
// NAME: [Your Full Name]
// DATE: [MM/DD/YY]
// WEEK: $code | $title
// ----------------------------------------------

function setup() {
  let cnv = createCanvas(800, 400);
  cnv.parent('canvas-container');
}

function draw() {
  background(250);
}
EOF

done

echo "Created W00..W10 with titled sketch.js files."
