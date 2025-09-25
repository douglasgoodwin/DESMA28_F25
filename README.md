# DESMA 28 · Interactivity


## Syllabus

| **Course**            | DESMA 28: Interactivity |
| --------------------- | ----------------------- |
| **Professor**         | Douglas Goodwin         |
| **Department**        | UCLA Design Media Arts  |
| **Term**              | F2025                   |
| **Required Readings** |                         |

This course is an introduction to coding within the visual arts, with a focus on interactivity. Writing code involves learning a different way of thinking and making. We will consider interactions with other people and the environment as the starting point for understanding our interactions with code. We’ll consider the roles of race, gender, sexuality, disability, and class within an increasingly software-driven world, and strategies of response as artists and designers. Can we understand software as inherently social?
The ideas and skills taught in this course set a foundation that will serve as a platform for future learning within the BA program and beyond. The class is taught as a series of workshops and discussions with demonstrations and time to work. 

This course asks a few questions:

+ How has software affected the visual arts?
+ What is the potential of software within the visual arts?
+ As a designer or artist, why would I want (or need) to write software?
+ What are the power relationships, inequities, and biases embedded within software and technology?



For this foundation we will focus on five sets of ideas:

+ Instructions and Statements
+ Variables and Response
+ Questions and Conditionals
+ Tools and Interactions
+ Functions and Parameters

---

# Weekly exercise template

This repo is your working template for all weekly exercises and projects in the course. Each week has its own folder (`W01`, `W02`, …) with:

- `index.html` → weekly instructions and canvas container  
- `sketch.js` → p5.js code you will edit  
- Shared `css/style.css` for design/branding  

The **root index** (`index.html`) links to all weekly templates.

---

## Project Structure

```text
css/
style.css        ← shared stylesheet
index.html         ← root index linking all weeks
W01/
index.html       ← weekly page (edit name/date, instructions included)
sketch.js        ← starter p5.js sketch
W02/
…
…
scripts/
make_indexes.sh  ← generate weekly pages
make_jsfiles.sh  ← generate sketch.js files
main_index.sh    ← rebuild root index
server.js          ← optional Node server with cache disabled
README.md          ← you are here
```


## Running Locally

You need a local web server (browsers block p5.js if loaded directly from `file://`).

### Option 1 · Python (comes with macOS/Linux)
```bash
cd DESMA28_F25
python3 -m http.server 8000
```

Now open http://localhost:8000.

### Option 2 · Node.js with live-server (recommended)

live-server reloads the browser when you save and disables caching.
	1.	Install once:

`npm install -g live-server`

	2.	Run in your project folder:

`live-server --port=8000 --no-browser --watch=.`

	3.	Open: http://localhost:8000


### Option 3 · VS Code (Live Server extension)
	•	Install the Live Server extension by Ritwick Dey.
	•	Right-click index.html → Open with Live Server.
	•	Opens at http://127.0.0.1:5500 by default.


## Workflow for Students

Each week:
	1.	Go to the right folder (W01, W02, etc.)
	2.	Open sketch.js in VS Code
	3.	Edit and test locally using live-server or Python
	4.	Document your notes inside index.html or with comments in code
	5.	Commit and push to GitHub (see below)
	6.	Submit your work (Canvas or GitHub link depending on assignment)

## Basic Git Workflow

```
# First Time
git clone https://github.com/YOUR-USERNAME/DESMA28_F25.git
cd DESMA28_F25
```

### Each Week

```text
# Get the latest version
git checkout main
git pull origin main

# Make a branch for your exercise
git checkout -b week01-exercise

# Edit your files
# (W01/sketch.js, W01/index.html)

# Stage & commit
git add W01/sketch.js W01/index.html
git commit -m "Finished Exercise 1: Background Button"

# Push your branch
git push origin week01-exercise
```



### Quick Git Reference
	•	git status → what changed
	•	git add <file> → stage a file
	•	git commit -m "Message" → save a snapshot
	•	git push origin <branch> → upload your work
	•	git pull origin main → update from class repo


### Checklist Before Submitting
	•	My code runs without errors
	•	I replaced [Your Name] in the weekly header
	•	I committed with a clear message (not just stuff)
	•	I pushed to GitHub and can see my files online
	•	I submitted the correct link in Canvas

### Resources
	•	p5.js tutorials
	•	Creative Coding (Allison Parrish)
	•	Aesthetic Programming (Soon & Cox)



**2025 Prof. Goodwin · DESMA 28: Interactivity**

