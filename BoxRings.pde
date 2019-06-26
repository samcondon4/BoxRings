class boxRing{
    Box[] boxArray;
    float[] thetaArray;
    int boxes;
    float x, y, w, h, r;
    color clr;

    boxRing(int boxes_, float x_, float y_, float w_, float h_, float radius, color clr_, float al){
        boxArray = new Box[boxes_];
        thetaArray = new float[boxes_];
        boxes = boxes_;
        x = x_; //set x position of center of ring
        y = y_; //set y position of center of ring
        w = w_; //set width of boxes within ring
        h = h_; //set height of boxes within ring
        r = radius; //set radius of ring
        clr = clr_; //set color of the boxes

        float theta; //Angle of single box relative to center of the ring
        //Preserve original coordinate system and translate to new coordinate system at 
        pushMatrix();
        translate(x_,y_);
        for(int i = 0; i < boxes; i++){
            theta = al/r;
            thetaArray[i] = theta;
            boxArray[i] = new Box(r*cos(theta),r*sin(theta),w,h,clr);
            al += ((2*PI)/boxes)*r;
        }
        popMatrix();
    }

    void display(){
      for(int i = 0; i < boxArray.length; i++){
         noFill();
         stroke(clr);
         pushMatrix();
         translate(x,y);
         translate(boxArray[i].x,boxArray[i].y);
         rotate(thetaArray[i]);
         rect(0,0,boxArray[i].w,boxArray[i].h);
         popMatrix();
      }
    }

class Box{

    float x;
    float y;
    float w, h;
    color clr;

    Box(float x_, float y_, float w_, float h_, color clr_){
        x = x_;
        y = y_;
        w = w_;
        h = h_;
        clr = clr_;
    }

    void display(){
      stroke(clr);
      rect(x,y,w,h);
    }
    void fillBox(color fill) {
      fill(fill);
    }
  }
}

boxRing ring;
float r;
float al;
int boxes;
int R, G, B;
color clr;

void setup(){
  fullScreen();
  r = 1000;
  al = 5;
  boxes = 10;
  R = 255;
  G = 255;
  B = 255;
  clr = color(R,G,B);
  background(0);
}

void draw() {
  noFill();
  //background(0);
  if(r > 0){
    ring = new boxRing(boxes,width/2,height/2, 40, 40, r, clr, al);
    if(R > 0){
      R -= 2;
    }
    else if(G > 0){
       G -= 1;
    }
    else if(B > 0){
      B -= 1;
    }
    clr = color(R,G,B);
    r -= 10;
    al += al*0.1;
    ring.display();
  }
  //if(r < -500){noLoop();}  
}
