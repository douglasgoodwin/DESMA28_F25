#!/usr/bin/env bash
set -euo pipefail

COURSE_TITLE="DESMA 28 · Interactivity"
INSTRUCTOR="Prof. Goodwin"
COURSE_CODE="DESMA 28"
P5_VERSION="1.9.0"

weeks=(01 02 03 04 05 06 07 08 09 10 11)
themes=(
  "Switch Archive (Observation Week)"
  "The Humble Switch · p5.js Basics"
  "If/Else Power · Decisions & Branching"
  "Tools for Others · Functions"
  "Loops & Labor · Repetition"
  "Arrays & Representation"
  "Abstraction & Power · Classes"
  "Collective Interfaces · Multi-Button"
  "Beyond the Binary · Sliders & Sensors"
  "Speculative Interactions"
  "Final Workshop & Showcase"
)

mkdir -p css
if [ ! -f css/style.css ]; then
  echo "⚠️ No css/style.css found. Please create one (shared for all pages)."
fi

# Root index
cat > index.html <<HTML
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>${COURSE_TITLE} · Index</title>
  <link rel="stylesheet" href="css/style.css" />
</head>
<body>
  <header class="site-header">
    <div class="wrap">
      <a class="brand" href="#"><span class="dma-bubble">Design Media Arts</span>
      <span class="brand-text">${COURSE_TITLE}</span></a>
    </div>
  </header>
  <main class="wrap">
    <article class="card">
      <header class="card-header">
        <h1>Weekly Templates</h1>
      </header>
      <ul>
HTML

for i in "${!weeks[@]}"; do
  echo "        <li><a href=\"W${weeks[$i]}/index.html\">W${weeks[$i]} · ${themes[$i]}</a></li>" >> index.html
done

cat >> index.html <<'HTML'
      </ul>
    </article>
  </main>
  <footer class="site-footer">
    <div class="wrap small">&copy; <span id="year"></span> DESMA 28 · Interactivity</div>
  </footer>
  <script>document.getElementById('year').textContent=new Date().getFullYear();</script>
</body>
</html>
HTML

# Per-week pages
for i in "${!weeks[@]}"; do
  w="${weeks[$i]}"
  theme="${themes[$i]}"

  mkdir -p "W${w}"
  cat > "W${w}/index.html" <<HTML
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>${COURSE_TITLE} · W${w}</title>
  <link rel="stylesheet" href="../css/style.css" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/${P5_VERSION}/p5.min.js" defer></script>
  <script src="sketch.js" defer></script>
</head>
<body>
  <header class="site-header">
    <div class="wrap">
      <a class="brand" href="../index.html">
        <span class="dma-bubble">Design Media Arts</span>
        <span class="brand-text">${COURSE_TITLE} · W${w}</span>
      </a>
    </div>
  </header>
  <main class="wrap">
    <article class="card">
      <header class="card-header">
        <h1>W${w} · ${theme}</h1>
        <p class="idblock"><strong>Name:</strong> <span class="fill">[Your Name]</span></p>
      </header>
      <section>
        <h3>Instructions</h3>
        <p>Edit <code>sketch.js</code> to complete this week’s exercise.</p>
      </section>
      <section>
        <h3>p5.js Sketch</h3>
        <div id="canvas-container">Your sketch will load here.</div>
      </section>
    </article>
  </main>
  <footer class="site-footer">
    <div class="wrap small">&copy; <span id="year"></span> DESMA 28 · Interactivity</div>
  </footer>
  <script>document.getElementById('year').textContent=new Date().getFullYear();</script>
</body>
</html>
HTML
done

echo "✔ Created weekly pages + root index (all using css/style.css)."