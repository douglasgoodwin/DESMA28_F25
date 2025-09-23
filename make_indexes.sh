#!/usr/bin/env bash
set -euo pipefail

# Week titles (W00..W10)
titles=(
  "Orientation: Hello, p5.js"                   # W00
  "Hello, Button!"                               # W01
  "Toggle & Latch Buttons"                       # W02
  "Conditionals & Symmetry"                      # W03
  "Multi-Switch Light (Distributed State)"       # W04
  "Sliders & Continuous Control"                 # W05
  "Spatial Interaction (Mouse, Position, Range)" # W06
  "Discrete + Continuous (Instrument)"           # W07
  "Sensors as Buttons"                           # W08
  "Remote/Shared State"                          # W09
  "Capstone: Button + Beyond"                    # W10
)

# Theme
themes=(
  "Orientation & Setup"                                # W00
  "Introduction: What Is a Button?"                    # W01
  "Momentary vs. Latching (Persistence)"               # W02
  "Normally Open / Normally Closed (Safety Logic)"     # W03
  "Two-Switch Light (Distributed State)"               # W04
  "Spatial Input (Where Matters)"                      # W05
  "Continuous Input (How Much Matters)"                # W06
  "Combining Discrete + Continuous"                    # W07
  "Sensors as Buttons (Environment as Input)"          # W08
  "Remote/Shared State (Multi-user)"                   # W09
  "Integration, Presentation, Reflection"              # W10
)

# Coding Focus
coding=(
  "Tooling, file structure, basic p5 template"                                  # W00
  "p5.js <pre>setup(), draw();</pre> event basics <pre>mousePressed(), keyPressed()</pre>)"                   # W01
  "Variables and booleans; toggle logic; time-held detection"                   # W02
  "Inversion, NOT-state; fail-safe thinking; conditional branches"              # W03
  "Multi-button interfaces; XOR/parity; arrays of switches"                     # W04
  "<pre>mouseX, mouseY,</pre> press+drag, <pre>map(), constrain()</pre>"                               # W05
  "Custom sliders; ranges; easing/lerp; parameters"                             # W06
  "Functions & parameters; modular controls; combining inputs"                  # W07
  "Mic/cam input; thresholds; smoothing"                                        # W08
  "Shared variables; basic reconciliation/locking patterns (conceptual)"        # W09
  "Integration, documentation, accessibility passes"                            # W10
)

# Lab/Project
labs=(
  "Get p5 running; draw a circle; commit project structure"                              # W00
  "Hello Button: on-screen button toggles state"                                         # W01
  "Momentary bell vs. latch switch; optional long-press to latch"                        # W02
  "NC Emergency Stop: animation runs by default; press/hold to stop; hold-to-reset"      # W03
  "Two-Switch Light: implement XOR; optional 3-way parity (odd = on)"                    # W04
  "Press+drag drawing tool; thickness or opacity based on speed/dwell"                   # W05
  "Build a slider component controlling speed/hue; combine with a toggle"                # W06
  "Make a small instrument: buttons (on/off) + sliders (range)"                          # W07
  "Clap/mic-triggered visuals or webcam-motion toggle; add consent/status UI"            # W08
  "Collaborative toggle: one press changes everyone’s state (simulate shared state)"      # W09
  "Capstone: public-ready interactive artwork + written reflection"                      # W10
)

# Critical Question
questions=(
  "What makes code-driven work different from using presets? What counts as interactivity here?"  # W00
  "What makes a system interactive vs. just reactive?"                                            # W01
  "How does persistence change agency or meaning?"                                                # W02
  "Who decides what counts as \"safe\" to stop or allow?"                                         # W03
  "With distributed control, who really owns the outcome?"                                        # W04
  "How does location change meaning and access?"                                                  # W05
  "Who benefits from fine-grained control? Who gets only on/off?"                                 # W06
  "How do systems balance binary choice with nuance?"                                             # W07
  "What new power dynamics arise when systems watch or listen?"                                   # W08
  "What happens when state is shared across users?"                                               # W09
  "What values and politics did you encode in your system?"                                       # W10
)

for n in $(seq 0 10); do
  code=$(printf "W%02d" "$n")
  dir="$code"
  title="${titles[$n]}"
  theme="${themes[$n]}"
  cf="${coding[$n]}"
  lab="${labs[$n]}"
  q="${questions[$n]}"

  mkdir -p "$dir"

  cat > "$dir/index.html" <<EOF
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>DESMA 28 · Interactivity</title>

        <link rel="stylesheet" href="../css/style.css" />

        <!-- p5.js -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/1.9.0/p5.min.js" defer></script>
        <script src="sketch.js" defer></script>
    </head>
    <body>
        <header class="site-header">
            <div class="wrap">
                <a class="brand" href="#">
                    <span class="dma-bubble">Design Media Arts</span>
                    <span class="brand-text">Interactivity $code</span>
                </a>
                <nav class="meta">
                    <span>DESMA 28</span>
                    <span>Prof. Goodwin</span>
                </nav>
            </div>
        </header>

        <main class="wrap">
            <article class="card">
                <header class="card-header">
                    <h1>$code · $title</h1>
                    <h2>Minimal Interactivity with p5.js</h2>
                    <p class="idblock">
                        <strong>Name:</strong> <span class="fill">[Your Full Name]</span> ·
                        <strong>Date:</strong> <span class="fill">[MM/DD/YY]</span>
                    </p>
                </header>
                
                <div id="canvas-container"></div>

                <section class="intro">
                    <p><strong>Theme:</strong> $theme</p>
                    <p><strong>Coding Focus:</strong> $cf</p>
                    <p><strong>Lab/Project:</strong> $lab</p>
                    <p><strong>Critical Question:</strong> $q</p>
                </section>

                <section class="notes">
                    <h3>Notes</h3>
                    <p># # #</p>
                </section>
            </article>
        </main>

        <footer class="site-footer">
            <div class="wrap small">
                <p><span id="year"></span> DESMA 28 · Interactivity</p>
            </div>
        </footer>

    </body>
</html>
EOF
done

echo "Created index.html files with Theme, Coding Focus, Lab/Project, and Critical Question for W00..W10."