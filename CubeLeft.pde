void left(){
  if(closestFace == 2){
    stroke(255,192,203);
  }else{
    stroke(0);
  }
  
  translate(-300,0,0);
  //THIS STUFF IS DIFFERENT FROM THE OTHER FACES I SCREWED UP
  translate(0,-100,100);//topleft
  fillIn(Rubbish.cube[2][0][2]);
  box(1,100,100);
  
  translate(0,0,-100);//topcenter
  fillIn(Rubbish.cube[2][0][1]);
  box(1,100,100);
  
  translate(0,0,-100);//topright
  fillIn(Rubbish.cube[2][0][0]);
  box(1,100,100);
  
  translate(0,100,200);//middleleft
  fillIn(Rubbish.cube[2][1][2]);
  box(1,100,100);
  
  translate(0,0,-100);//middlecenter
  fillIn(Rubbish.cube[2][1][1]);
  box(1,100,100);
  leftZ = modelZ(0,0,-100);
  textSize(100);
  fill(0);
  rotateY(-PI/2);
  text("L",-30,40,1);
  textSize(12);
  rotateY(PI/2);
  
  translate(0,0,-100);//middleright
  fillIn(Rubbish.cube[2][1][0]);
  box(1,100,100);
  
  translate(0,100,200);//lowerleft
  fillIn(Rubbish.cube[2][2][2]);
  box(1,100,100);
  
  translate(0,0,-100);//lowercenter
  fillIn(Rubbish.cube[2][2][1]);
  box(1,100,100);
  
  translate(0,0,-100);//lowerright
  fillIn(Rubbish.cube[2][2][0]);
  box(1,100,100);
  
  translate(0,-100,100);//reset
}