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

### 1. Run with Python (cross-platform)

From the root of this repository, **open a terminal** and run:

```bash
# Do you have Python?
python -V

# Python 3 (most common)
python3 -m http.server 8000

# If you only have Python 2:
python -m SimpleHTTPServer 8000
```

**Then click here**: **http://localhost:8000**

Magic!

```text
# Stop the server by typing <ctrl + c> in the terminal window.
```



### **2. Run with Node.js**

If you have **Node.js** installed:

```bash
# Install http-server once (globally)
npm install -g http-server

# Then run inside this directory
http-server -p 8000
```

**Then visit: http://localhost:8000**

Stop with **Ctrl + C**.



### **3. Run with VS Code**

Yes! VS Code can run a local server if you install the **Live Server** extension:

1. Open this folder in VS Code.
2. Install the [Live Server extension](https://marketplace.visualstudio.com/items?itemName=ritwickdey.LiveServer).
3. Right-click on index.html → **Open with Live Server**.
4. It will launch a browser window, usually at http://127.0.0.1:5500.

​	

---

## Links

- Project Index: http://localhost:8000
- p5.js Documentation: https://p5js.org/reference/
- UCLA DMA: https://www.design.ucla.edu/



# Weekly Exercises

## Index of Assignments

- [W00 and Orientation & Setup](http://localhost:8000/W00/index.html)
- [W01 and Introduction: What Is a Button?](http://localhost:8000/W01/index.html)
- [W02 and Momentary vs. Latching (Persistence)](http://localhost:8000/W02/index.html)
- [W03 and Normally Open / Normally Closed (Safety Logic)](http://localhost:8000/W03/index.html)
- [W04 and Two-Switch Light (Distributed State)](http://localhost:8000/W04/index.html)
- [W05 and Spatial Input (Where Matters)](http://localhost:8000/W05/index.html)
- [W06 and Continuous Input (How Much Matters)](http://localhost:8000/W06/index.html)
- [W07 and Combining Discrete + Continuous](http://localhost:8000/W07/index.html)
- [W08 and Sensors as Buttons (Environment as Input)](http://localhost:8000/W08/index.html)
- [W09 and Remote/Shared State (Multi-user)](http://localhost:8000/W09/index.html)
- [W10 and Integration, Presentation, Reflection](http://localhost:8000/W10/index.html)