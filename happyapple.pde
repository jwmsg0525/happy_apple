int p_win_x = 480;
int p_win_y = 480;

int s_box_x = 100;
int s_box_y = 90;

int p_box_y = (int) p_win_y - s_box_y + 10;
int p_box_x = (int) p_win_x / 2 - (s_box_x/2);
int box_speed = 5;
int box_max = p_win_x - (s_box_x);
int box_min = 0;

int s_apple_x = 30;
int s_apple_y = 30;

int p_apple_x =  (int) random(box_min,box_max);
int p_apple_y =  s_apple_y/2;

int def_gravity = 0;
float gravity = def_gravity;
float acc = 0.1;

PImage box;



int current_point = 0;


void setup(){
  size(480,480);
  smooth();
  box = loadImage("basket.png");
  
}

void draw(){
  background (255);
  if(keyPressed){
    if(key == CODED){
      if (keyCode == LEFT){
        if(p_box_x > box_min)
          p_box_x -= box_speed;
      }else if (keyCode == RIGHT){
        if(p_box_x < box_max)
          p_box_x += box_speed;
      }    
    }
  }
  if(p_apple_y < p_box_y + s_apple_y){
    p_apple_y += gravity;
    gravity += acc;
  }else{
    if(p_box_x < p_apple_x && p_apple_x < (p_box_x + (s_box_x/2)) ){
      current_point += 1;
    } else {
      current_point -= 1;
    }
    p_apple_y = s_apple_y/2;
    gravity = def_gravity;
    p_apple_x = (int) random(box_min,box_max);
  }
  fill(255,0,0);
  ellipse(p_apple_x,p_apple_y,s_apple_x,s_apple_y);
  image(box, p_box_x, p_box_y, s_box_x, s_box_y);
}
