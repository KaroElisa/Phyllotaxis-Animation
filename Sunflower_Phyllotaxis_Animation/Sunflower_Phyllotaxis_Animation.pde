//Based on this Awesome Tutorial by Daniel Schiffman
//https://thecodingtrain.com/CodingChallenges/030-phyllotaxis.html
//https://www.youtube.com/watch?v=KWoJgHFYWxY


//SETTING VARIABLE DECLARATIONS

float x;
float y;
float x2;
float y2;
float x3;
float y3;
float x4;
float y4;

float rad = 2;

float n = 0;
float n2 = 0;
float n3 = 90;
float n4 = 0;

float angle;

//scaling factor for radius
float c = 1.5;
float c2 = 15;
float c3 = 19;
float c4 = 1;

float r = 1;
float r2 = 200;
float r3 = 200;
float r4 = 10;

//COLOR CONTROLS
float alpha = 0;
float hue = 10;
float hue2 = 70;
float darkness3 = 40;
float darkness = 20;



void setup(){
  size(800, 800);
  colorMode(HSB);
  background(0);
  frameRate(60);
  
}

void draw(){
  
  //PHYLLOTAXIS MATHEMATICS
  
  angle = n * 2.3998277;
  r = c * sqrt(n/2);
  r2 = c2 * sqrt(n2/2);
  r3 = c3 * sqrt(n3);
  r4 = c4 * sqrt(n4);
  
  //polar to cartesian
  x = r * cos(angle) + width/2;
  y = r * sin(angle) + height/2;
  
  x2 = r2 * cos(n2 * 2.3998277) + width/2;
  y2 = r2 * sin(n2 * 2.3998277) + height/2;
  
  x3 = r3 * cos(n3 * 2.3998277) + width/2;
  y3 = r3 * sin(n3 * 2.3998277) + height/2;
  
  x4 = r4 * cos(n4 * 2.3998277) + width/2;
  y4 = r4 * sin(n4 * 2.3998277) + height/2;
  
  
  // EXPERIMENTAL FILL: This fills half of the spiral in black and half in white
  
  //if(n%2 == 0){
  //fill(255, 255, 0);
  //}else if (n%2 == 1){
  //fill(n%255, 255, 255);
  //}


  // IF STATEMENT LIMITS SIZE OF SUNFLOWER
     if(n<750){
  
     //HUE, SATURATION, BRIGHTNESS
  
       noStroke();
       fill(hue2, 200, darkness, 230);
       ellipse(x, y, rad, rad);
  
       fill(hue, 255, 255, alpha);
       ellipse(x2, y2, rad, rad);
  
       n++;
       n2++;
       
       //CHANGES COLOR AS YOU GO FURTHER OUT
       rad+= 0.02;
       c+=0.01;
       alpha+=10;
       hue+=0.05;
       hue2-=0.09;
       darkness+=0.01;
       
  //COLOR RESET SO IT DOESN'T GO BEYOND A CERTAIN POINT
  if (hue>45){
    hue = 45;
  }
  
  if (hue2<30){
    hue2 = 30;
  }
  
}else{

  //WHEN CIRCLE IS FINISHED, DRAW STEM
  float stem = 1;
  float expo = 2;
  
  for(float i = 700; i<850; i+=10){
    for(float j = 370; j<440; j+=10){
    
     fill(100, 200, 100);
     ellipse(j, i, stem, stem); 
     
    }
         stem++;
         expo*=1.2;
    }
}

  // SKY
  fill(140, 255, darkness3);
  ellipse(x3, y3, rad, rad);
  
  n3++;
  darkness3+=4;
}
