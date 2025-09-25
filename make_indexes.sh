#!/usr/bin/env bash
set -euo pipefail

# ----------------------------------------------
# Exercise titles and prompts
# Index must match the week number (00 = W00, 01 = W01, …)
# ----------------------------------------------
TITLES=(
  "W00: Switch Safari"
  "W01: Hello, Button!"
  "W02: States & Toggles"
  "W03: Multiple Buttons"
  "W04: Spatial Input"
  "W05: Conditional Interactions"
  "W06: Alternative Switches"
  "W07: Sensors & Remote State"
  "W08: Hybrid Interfaces"
  "W09: Critical Reflection"
  "W10: Capstone Prep"
)

PROMPTS=(
  "Document as many real-world switches as you can find. Photograph, describe, and classify them."
  "Create a button in p5.js that changes background color when pressed."
  "Extend the button so it toggles persistent state (on/off)."
  "Design an interface with two or more buttons that interact."
  "Use mouseX and mouseY to control a visual element continuously."
  "Make the sketch respond differently based on button combinations."
  "Propose and code a new kind of digital switch."
  "Simulate or use external data (keys, sliders, sensors)."
  "Combine buttons and continuous input in one sketch."
  "Design an interaction that comments on bias, access, or inequity."
  "Prototype your ‘Alternative to the Button’ final project."
)

COURSE_TITLE="DESMA 28 · Interactivity"
COURSE_CODE="DESMA 28"
INSTRUCTOR="Prof. Goodwin"
P5_VERSION="1.9.0"

# Find Wxx folders
WEEK_DIRS=$(find . -maxdepth 1 -type d -name "W[0-9][0-9]" | sort)

count=0
for DIR in $WEEK_DIRS; do
  WEEK="$(basename "$DIR")"          # e.g., W07
  WEEK_NUM="${WEEK#W}"               # e.g., 07
  INDEX="$DIR/index.html"

  idx=$((10#$WEEK_NUM))
  arr_len=${#TITLES[@]}

  if [ "$idx" -ge 0 ] && [ "$idx" -lt "$arr_len" ]; then
    TITLE="${TITLES[$idx]}"
    PROMPT="${PROMPTS[$idx]}"
  else
    TITLE="W${WEEK_NUM}: Exercise TBD"
    PROMPT="Instructions will be provided in class."
  fi

  cat > "$INDEX" <<EOF
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>${COURSE_TITLE} · ${WEEK}</title>
    <link rel="stylesheet" href="../css/style.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/${P5_VERSION}/p5.min.js" defer></script>
    <script src="sketch.js" defer></script>
  </head>
  <body>
    <header class="site-header">
      <div class="wrap">
        <a class="brand" href="../index.html">
          <span class="dma-bubble">Design Media Arts</span>
          <span class="brand-text">${COURSE_TITLE} · ${WEEK}</span>
        </a>
        <nav class="meta">
          <span>${COURSE_CODE}</span>
          <span>${INSTRUCTOR}</span>
        </nav>
      </div>
    </header>

    <main class="wrap">
      <article class="card">
        <header class="card-header">
          <h1>${TITLE}</h1>
          <p class="idblock">
            <strong>Name:</strong> <span class="fill">[Your Full Name]</span> ·
            <strong>Date:</strong> <span class="fill">[MM/DD/YY]</span>
          </p>
        </header>

        <section class="intro">
          <h3>Instructions</h3>
          <p>${PROMPT}</p>
        </section>

        <section class="notes">
          <h3>Notes</h3>
          <p>This is the default sketch--a momentary button.</p>
        </section>

        <section>
          <h3>p5.js Sketch</h3>
          <div id="canvas-container">Your sketch will load here.</div>
        </section>
      </article>
    </main>

    <footer class="site-footer">
      <div class="wrap small">
        <p><span id="year"></span> DESMA 28 · Interactivity</p>
      </div>
    </footer>
    <script>document.getElementById('year').textContent=new Date().getFullYear();</script>
  </body>
</html>
EOF

  echo "✔ Generated $INDEX → ${TITLE}"
  count=$((count + 1))
done

echo "Done. Generated $count index.html file(s)."