void drawUI() {
  background(255);
  switch(MENU) {
  case 'H' :
    home();
    break;
  case 'C' :
    //println("videoframe : " + videoFrame + "  Mtime : "+round(myMovie.time()*10)/10.0 + "  MDuration : "+ floor(myMovie.duration()*10)/10.0);
    if (myMovie.available()) {
      myMovie.read();
    }
    imageMode(CENTER);
    image(myMovie, width/2, height/2);  
    image(Btn01, width/2-140, height-40, 50, 50);
    image(Btn02, width/2-70, height-40, 50, 50);
    image(Btn03, width/2, height-40, 50, 50);
    image(Btn04, width/2+70, height-40, 50, 50);
    image(Btn05, width/2+140, height-40, 50, 50);
    image(num0c,width/2,height/2);
    if (round(myMovie.time()*10)/10.0>=floor(myMovie.duration()*10)/10.0) {
      println("Exit charSel");
      Btn03=loadImage("Btn-03.png");
      myMovie.stop();
      play=true;
      myMovie = new Movie(this, clipAddress);
      myMovie.speed(1);
      myMovie.play();
      MENU = 'G';
    }
    break;
  case 'G' :
    //image(layout,0,0);////////LAYOUT FOR WHOLE GAME STAGE
     if (cam.available() ==true) { 
      cam.read();
    }     
    if (myMovie.available()) {
      myMovie.read();
    }
    imageMode(CORNER);
    image(myMovie, 0, 200, width/2, height/2);
    pushMatrix(); 
    translate(canvas.width, 0);
    scale(-1, 1); 
    canvas.beginDraw();
    canvas.image(cam, 0, 0, canvas.width, canvas.height);
    canvas.endDraw();
    image(canvas, -canvas.width, 200);
    popMatrix();
    scoreBoard(); 
    //image(Btn01, 10, 10, 50, 50);
    //image(light, width/2+20, 570, 50, 50);
    gameSet();
    break;
  case 'E': //EFFECT
    showRoom();
    // if(userFlag){
    //   saveUserTable();
    //   userFlag = false;
    //   println("savingtheTable");
    // }
    break;
  case 'X': //CONFIRM : SHOWING THE BIG PHOTO and send the email
    confirm();
  break;  
  case 'Y': //AGREEMENT : get agreement and print the photo out.
    homeCanvas.beginDraw();
    homeCanvas.background(255);
    // printCanvas.textAlign(CENTER);
    homeCanvas.image(title_print,0,0);
    homeCanvas.image(userPhoto,516, 190);
    homeCanvas.image(btnYes,0, 0);
    homeCanvas.image(btnNo,0, 0);
    homeCanvas.endDraw();
    image(homeCanvas, 0, 0);  
  break;  

  case 'Z': //END : Thank you and going back to home
    saveUserTable();
    homeCanvas.beginDraw();
    homeCanvas.background(255);
    homeCanvas.image(title_end,0,0);
    homeCanvas.endDraw();
    image(homeCanvas, 0, 0);
    // MENU = 'H';
    // GAME = 'T';
    timerGame=millis()-reset;
    countTime=10000;
    if (millis()>=reset+countTime) {
      reset = millis();
    }
    MENU = 'H';
    GAME = 'T';
    break;
  }
}
int timerGame;
int reset=0;
int countTime=3000;
int counting;

void gameSet() {
  //image(layout,0,0);
  switch (GAME) {
  case 'I':
    image(num0b,0,0);
    timerGame=millis()-reset;
    countTime=2000;
      if (millis()>=reset+countTime) {
        reset = millis();
        videoFrame = 0;
        myMovie.volume(0); 
        myMovie.play();
        GAME = 'T';
      }
  break;
    
  case 'T': //tutorial: show video once! and 3, 2, 1
    myMovie.play();
    if (round(myMovie.time()*10)/10.0 >= floor(myMovie.duration()*10)/10.0) {// WHEN CLIP ends 
      GAME = 'W';
      endOfClip = true;
      println("gameEnds");
      myMovie.stop();
      myMovie.jump(0);
      waittime = true;      
      println("first: "+timerGame);
      reset=millis();
    }
    break;
  case 'W':
      image(layout,0,0);
      timerGame=millis()-reset;
      countTime=7000;
      counting = ((countTime-timerGame)/1000);   
      if (millis()>=reset+countTime) {
        reset = millis();
        videoFrame = 0;
        myMovie.volume(0); 
        myMovie.play();
        GAME = 'P';
      } 
      if (counting == 3) {
        image(num3, 0, 0);
        image(num0d,0,0);
      } else if (counting == 2) {
        image(num2, 0, 0);
        image(num0d,0,0);
      } else if (counting == 1) {
        image(num1, 0, 0);
        image(num0d,0,0);
      } else if (counting > 3) {
        image(num0, 0, 0);
      }
     break;
  case 'P': //Play : clip plays again and player have to mimic the clip
    image(layout,0,0);
    textSize(24);
    fill(0);
    //if(!userFlag){loadUserTable();println("loadingtheTable"); userFlag=true;}
    text("Facial Famous Points: "+scoreP, width/2, 100);
    // if (waittime) { 
    // }
    if (round(myMovie.time()*10)/10.0 >= floor(myMovie.duration()*10)/10.0) {// WHEN CLIP ends 
      endOfClip = true;
      ///////////////FORMER PHOTO SAVING LINES///////////////////////
      // PImage postcard = get (800, 200, 500, 400);//720, 200, 720, 430
      // postcard.filter(THRESHOLD);
      // postcard.save("usrphotos/"+userCount+".jpeg");//WARN : keep saving.
      //text("Do you like the postcard?", width/2, 100);
      image(rBtn, 20, 650, 50, 50);//showing the reset btn
      image(btnOkay, 730,680,70,70);//when you click okay btn
      //image(loopBtn, 80, 650, 50, 50);
      // waittime=true;
      //MENU = 'E';
      // light = loadImage("greenLight.png");
    }else{
      endOfClip = false;
    }
    break;
  }
}

void scoreBoard() {
  textFont(subTitle);
  textSize(20);
  fill(#009AEA);
  text(celebName, width/4, height-190);
  text("Prospective Celeb", width-(width/4), height-190);
  textSize(24);
  fill(0);
  text(scoreString, width/2, height-100);
}
void showRoom(){
  
  homeCanvas.beginDraw();
  homeCanvas.background(255);
  homeCanvas.textAlign(CENTER);
  homeCanvas.noFill();
  fill(0);

  homeCanvas.image(bgd6, 0, 0); //800*1200
  homeCanvas.image(bgd0, 200, 150,240,360); 
  homeCanvas.image(bgd1, 570, 150,240,360);
  homeCanvas.image(bgd2, 930, 150,240,360);
  homeCanvas.image(bgd3, 200, 480,240,360); 
  homeCanvas.image(bgd4, 570, 480,240,360);
  homeCanvas.image(bgd5, 930, 480,240,360);
  homeCanvas.blend(postcard, 0, 0, 720, 430, 279, 307, 85, 57, MULTIPLY);
  homeCanvas.blend(postcard, 0, 0, 720, 430, 600, 275, 170, 100, MULTIPLY);
  homeCanvas.blend(postcard, 0, 0, 720, 430, 993, 302, 115, 65, MULTIPLY);
  homeCanvas.blend(postcard, 0, 0, 720, 430, 230, 585, 170, 100, MULTIPLY);
  homeCanvas.blend(postcard, 0, 0, 720, 430, 630, 647, 120, 70, MULTIPLY);
  homeCanvas.blend(postcard, 0, 0, 720, 430, 952, 635, 170, 100, MULTIPLY);
  homeCanvas.endDraw();
  image(homeCanvas, 0, 0);
  
}
void confirm(){//CONFIRM : SHOWING THE BIG PHOTO + E-MAIL SENT
  homeCanvas.beginDraw();
  homeCanvas.background(255);
  homeCanvas.textAlign(CENTER);
  homeCanvas.noFill();
  fill(0);
  //blended image loading according to the user choice
  homeCanvas.image(bgd6,0,0);
  switch(userPost){
    case 0:
    homeCanvas.image(bgd0, 516, 190,400,600);
    homeCanvas.blend(postcard, 0, 0, 720, 430, 655, 473, 130, 75, MULTIPLY);
    break;
    case 1:
    homeCanvas.image(bgd1, 516, 190,400,600);
    homeCanvas.blend(postcard, 0, 0, 720, 430, 580, 400, 260, 170, MULTIPLY);
    break;
    case 2:
    homeCanvas.image(bgd2, 516, 190,400,600);
    homeCanvas.blend(postcard, 0, 0, 720, 430, 630, 440, 180, 110, MULTIPLY);
    break;
    case 3:
    homeCanvas.image(bgd3, 516, 190,400,600);
    homeCanvas.blend(postcard, 0, 0, 720, 430, 610, 390, 220, 140, MULTIPLY);
    break;
    case 4:
    homeCanvas.image(bgd4, 516, 190,400,600);
    homeCanvas.blend(postcard, 0, 0, 720, 430, 617, 463, 200, 120, MULTIPLY);
    break;
    case 5:
    homeCanvas.image(bgd5, 516, 190,400,600);
    homeCanvas.blend(postcard, 0, 0, 720, 430, 563, 453, 260, 160, MULTIPLY);
    break;
  }
  homeCanvas.stroke(0);
  homeCanvas.fill(0);
  homeCanvas.textSize(32);
  //homeCanvas.text("send it to your e-mail address",width/2,height/2);
  homeCanvas.text(text1,600,200);
  homeCanvas.endDraw();
  image(homeCanvas, 0, 0);
}
void emailPrint(){
  homeCanvas.beginDraw();
  homeCanvas.background(255);
  // printCanvas.textAlign(CENTER);
  homeCanvas.stroke(0);
  homeCanvas.fill(0);
  homeCanvas.textSize(50);
  homeCanvas.text("send it to your e-mail address",width/2,height/2);
  homeCanvas.text(text1,600,200);
  homeCanvas.endDraw();
  image(homeCanvas, 0, 0);
}