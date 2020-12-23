int p_win_x = 480;
int p_win_y = 480;

int s_box_x = 100;
int s_box_y = 90;

int p_box_y = (int) p_win_y - s_box_y + 10;
int p_box_x = (int) p_win_x / 2 - (s_box_x/2);

PImage box;

int box_speed = 5;



void setup(){
  size(480,480);
  smooth();
  box = loadImage("basket.png");
  
}

void draw(){
  if(keyPressed){
    if(key == 'A'||key=='a'){
    p_box_x -= box_speed;
    }
    if(key == 'D'||key=='d'){
      p_box_x += box_speed;
    }
  }
  image(box, p_box_x, p_box_y, s_box_x, s_box_y);
}

void keyPressed(){
  
}
