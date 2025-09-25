#!/usr/bin/env bash
set -euo pipefail

COURSE_TITLE="DESMA 28 · Interactivity"
COURSE_CODE="DESMA 28"
INSTRUCTOR="Prof. Goodwin"
CSS_PATH="css/style.css"

# Warn if CSS missing (still writes the page)
if [ ! -f "$CSS_PATH" ]; then
  echo "⚠️  Warning: $CSS_PATH not found. The page will render unstyled."
fi

# Find Wxx dirs, sorted
WEEK_DIRS=$(find . -maxdepth 1 -type d -name "W[0-9][0-9]" | sort)

# Build list items
LINKS=""
for DIR in $WEEK_DIRS; do
  WEEK=$(basename "$DIR")   # e.g., W03

  TITLE="Untitled Exercise"
  if [ -f "$DIR/index.html" ]; then
    # Extract first <h1> line and strip tags
    H1_RAW=$(grep -m1 '<h1>' "$DIR/index.html" || true)
    if [ -n "$H1_RAW" ]; then
      TITLE=$(printf "%s" "$H1_RAW" | sed -E 's/<[^>]+>//g' | sed -E 's/^[[:space:]]+|[[:space:]]+$//g')
      # If the title already starts with Wxx, keep it; else prefix for clarity
      if ! printf "%s" "$TITLE" | grep -qE '^W[0-9]{2}\b'; then
        TITLE="$WEEK — $TITLE"
      fi
    else
      TITLE="$WEEK — Untitled Exercise"
    fi
  else
    TITLE="$WEEK — (no index.html)"
  fi

  LINKS="${LINKS}        <li><a href=\"${WEEK}/index.html\">${TITLE}</a></li>\n"
done

# Write root index.html
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
      <header class="card-header">
        <h1>Weekly Templates</h1>
      </header>
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

echo "Built root index.html with $(echo "$WEEK_DIRS" | wc -w) week link(s)."