#!/usr/bin/env bash
set -euo pipefail

COURSE_TITLE="DESMA 28 · Interactivity"
COURSE_CODE="DESMA 28"
INSTRUCTOR="Prof. Goodwin"

CSS_PATH="css/style.css"
if [ ! -f "$CSS_PATH" ]; then
  echo "⚠️ No css/style.css found. Please create one."
fi

WEEK_DIRS=$(find . -maxdepth 1 -type d -name "W[0-9][0-9]" | sort)
LINKS=""
for DIR in $WEEK_DIRS; do
  WEEK=$(basename "$DIR")
  THEME=$(grep -m1 '<h1>' "$DIR/index.html" | sed -E 's/<[^>]+>//g' | sed -E 's/^W[0-9][0-9][[:space:]]·[[:space:]]?//')
  [ -z "$THEME" ] && THEME="Untitled"
  LINKS="$LINKS        <li><a href=\"$WEEK/index.html\">$WEEK · $THEME</a></li>\n"
done

cat > index.html <<HTML
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>${COURSE_TITLE} · Index</title>
  <link rel="stylesheet" href="${CSS_PATH}" />
</head>
<body>
  <header class="site-header">
    <div class="wrap">
      <a class="brand" href="#">
        <span class="dma-bubble">Design Media Arts</span>
        <span class="brand-text">${COURSE_TITLE}</span>
      </a>
      <nav class="meta">
        <span>${COURSE_CODE}</span> · <span>${INSTRUCTOR}</span>
      </nav>
    </div>
  </header>
  <main class="wrap">
    <article class="card">
      <header><h1>Weekly Templates</h1></header>
      <ul class="weeks">
$(printf "%b" "$LINKS")
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

echo "✔ Built root index.html using css/style.css."