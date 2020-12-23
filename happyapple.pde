/////////WINDOW SETTING////////
int p_win_x = 480;
int p_win_y = 480;

////////BOX SETTING//////////
PImage box;
int s_box_x = 100;
int s_box_y = 90;

int p_box_y = (int) p_win_y - s_box_y + 10;
int p_box_x = (int) p_win_x / 2 - (s_box_x/2);

int box_speed = 5;
int box_max = p_win_x - (s_box_x);
int box_min = 0;

////////BALL SETTING/////////
Ball[] balls = null;
int ball_cnt = 1;


////////POINT SETTING////////
int current_point = 0;


class Ball {
  float s_apple_x = 30;
  float s_apple_y = 30;
  float p_apple_x = 0;
  float p_apple_y = 0;
  float limit_y = p_box_y;
  float volume = 1;
  float speed = 0;
  float acc = 0.4;

  Ball(){
    this.init();
  }
  void init(){
    this.p_apple_y = s_apple_x/2;
    this.p_apple_x = random(s_apple_x/2,p_win_x-(s_apple_x/2));
    this.speed = 0;
  }
  void move(){
    p_apple_y += speed;
    speed = speed + volume*acc;
    this.show();
  }
  void show(){
    fill(255,0,0);
    ellipse(p_apple_x,p_apple_y,s_apple_x,s_apple_y);
  }
  boolean is_bottom(){
     return p_apple_y > limit_y;
  }
  boolean is_inbound(){
    return this.is_bottom() && p_box_x< p_apple_x && p_apple_x < p_box_x+(s_box_x);
  }
}


void setup(){
  size(480,480);
  smooth();
  ///SET BOX
  box = loadImage("basket.png");
  
  ///SET BALLS
  balls = new Ball[ball_cnt];
  for(int i = 0 ; i < ball_cnt; i++){
    balls[i] = new Ball();
  }
  
}

void kbdPress(){
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
}

void draw(){
  background (255);
  kbdPress();
  for(int i = 0 ; i < ball_cnt; i++){
    balls[i].move();
    if(balls[i].is_bottom()){
      if(balls[i].is_inbound()){
        current_point++;
      }else{
        current_point--;
      }
      balls[i].init();
    }
  }  
  image(box, p_box_x, p_box_y, s_box_x, s_box_y);
  textSize(32);
  fill(0, 102, 153);
  text("POINT:"+current_point, 10, 30); 
}
