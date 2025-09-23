#!/usr/bin/env bash
set -euo pipefail

# Theme list aligned with weeks
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

cat > index.html <<EOF
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>DESMA 28 · Interactivity · Weekly Index</title>
  <link rel="stylesheet" href="css/style.css" />
</head>
<body>
  <header class="site-header">
    <div class="wrap">
      <a class="brand" href="#">
        <span class="dma-bubble">Design Media Arts</span>
        <span class="brand-text">Weekly Index</span>
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
        <h1>Weekly Exercises</h1>
        <h2>Index of Assignments</h2>
      </header>
      <section class="intro">
        <ul>
EOF

for n in $(seq 0 10); do
  code=$(printf "W%02d" "$n")
  theme="${themes[$n]}"
  echo "          <li><a href=\"$code/index.html\">$code and $theme</a></li>" >> index.html
done

cat >> index.html <<EOF
        </ul>
      </section>
    </article>
  </main>

  <footer class="site-footer">
    <div class="wrap small">
      <p><span id="year"></span> DESMA 28 · Interactivity</p>
    </div>
  </footer>

  <script>
    document.getElementById('year').textContent = new Date().getFullYear();
  </script>
</body>
</html>
EOF

echo "Created master index.html with links to W00..W10"
