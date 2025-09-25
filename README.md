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

## What's here

Students will work through **10 weeks of exercises**, beginning with simple buttons and moving toward immersive, sensor-driven, and multi-user interactive projects.



---

Each week (`W00` through `W10`) has its own directory with:

- `index.html` → project page and assignment notes
- `style.css` → shared styling (in `/css`)
- `sketch.js` → starter p5.js code



---

## Running the Project Locally

These files are written for the **browser**, so you’ll need to run a simple local webserver.  
Below are three common approaches, depending on your setup:

---

Great idea — students often need a **simple Git workflow** written down. Here’s a **student-friendly Git section** you can add to your README or a separate GIT_GUIDE.md. It’s streamlined to the basics: clone, edit, commit, push.



```
## Working with Git (Basics)

We use Git to keep track of your code and submit work. Here’s the workflow:

### 1. Clone the repository (first time only)
This copies the course repo to your computer.
```bash
git clone https://github.com/YOUR-ORG/DESMA28.git
cd DESMA28
```



### **2. Create a new branch (optional but recommended)**

Keeps your changes separate until you’re ready to merge.

```
git checkout -b my-week01-exercise
```



### **3. Edit your files**

- Open W01/sketch.js (or the week’s folder) in VS Code.
- Run a local server (live-server or Python).
- Save and test your changes in the browser.

### **4. Check which files changed**

```
git status
```

### **5. Stage your changes**

This marks files to be saved in the next commit.

```
git add W01/sketch.js
```

Or stage everything:

```
git add .
```



### **6. Commit your changes**

Write a short message about what you did.

```
git commit -m "Finished Exercise 1: Background button"
```



### **7. Push to GitHub**

Send your commits to the remote repo.

```
git push origin my-week01-exercise
```



### **8. Pull latest updates (important!)**

Before starting new work, always pull updates from the main repo.

```
git checkout main
git pull origin main
```

### **Quick Commands Reference**

- git status → What changed?
- git add <file> → Stage a file for commit
- git commit -m "Message" → Save a snapshot
- git push origin <branch> → Upload your work
- git pull origin main → Get the latest updates

### **Common Tips**

- **Commit often**: small, meaningful commits are easier to manage than one giant one.
- **Write clear messages**: e.g., Added toggle button, not just stuff.
- **Don’t edit other people’s folders**: keep to your own weekly work.
- **If you break something**: you can always go back with git checkout.



## **Git + Canvas**

If the class uses GitHub:

- Push your work regularly.
- Submit the **link to your branch or folder** in Canvas.

If not:

- Zip your folder and upload. Git is still useful locally for version control.

