int xDim = 1000;
int yDim = 1000;
int request = xDim/20 + 1;
float mult = 0;
float time = 0;
float inc = 0.05;
float r,g,b,a = 255.0;

void settings() {
   size(xDim,yDim); //Since I'm using variables this needs to be putting in settings() for some reason
}
void setup() {
settings
    coloring();
}

void scale(float startX, float startY, int request) {
       if (request  == 0 ) { //This allows for the function to stop without running forever
         return;
       }
       
       beginShape();
       vertex(startX, startY);
       vertex(startX + 20 * mult, startY + 20 * mult);
       vertex(startX + 30 * mult, startY - 50 * mult);
       vertex(startX, startY - 50 * mult);
       vertex(startX, startY);
       endShape();
       
       request--;
       scale(startX + 20, startY, request); //Call the next shape in the line
}

void draw() {
  
  mult = sin(time) + 1; //This allows for the "breathing"
  time+= inc;
  
  
  if (mult < 0.1) {
    coloring();
  }
  
  
  background(255);
  for (int i = yDim/50; i > 0; i--) {
      fill(r,g,b,a);
      scale(0, i * 50, request);
  }
  
}

void mousePressed() {
    coloring();
}



void coloring () {
   r = lerp(0.0, 255.0, (float)Math.random());
   g = lerp(0.0, 255.0, (float)Math.random());
   b = lerp(0.0, 255.0, (float)Math.random());
}
