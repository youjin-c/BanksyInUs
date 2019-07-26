float area =0.2; 
float ori = 0.01;

void comparison() {
  if (eyeLeftHeight != 0.0&& plugged) {
    //println("comparing");
    //reportFrame();
    videoFrame++;
    if (videoFrame<f) {//frameCount
      TableRow row = referTable.getRow(videoFrame); //sync to the referTable it was frameCount
      NKframe = row.getInt("frameCount");
      NKBrowL = row.getFloat("LBrowH");
      NKBrowR = row.getFloat("RBrowH");
      NKEyeL = row.getFloat("LEyeH");
      NKEyeR = row.getFloat("REyeH");
      NKNose = row.getFloat("nose");
      NKMouthH = row.getFloat("MouseH");
      NKMouthW = row.getFloat("MouseW");
      NKOriX = row.getFloat("OriX");
      NKOriY = row.getFloat("OriY");
      NKOriZ = row.getFloat("OriZ");
      
    }
    //scoring();
    if (endOfClip) { //frameCount >=90 //endOfClip
      //scoring();
      frameCount =0;
      videoFrame = 0;
      // score = 0;
      //println("show the SCORE HERE");
      // endOfClip = false;
    } else {
      scoring();
    }
  } else {
    frameCount =0;
    videoFrame=0;
    //score = 0;
  }
}

void scoring() {
  /*println("FRAME : " + NKframe+ "  CSV : "+NKOriZ +
    "  left : "+poseOrt_z*-1 + "  SCORE : "+score);*/ //"  right : "+rightEyebrowHeight +
  if (NKBrowL-area <rightEyebrowHeight && NKBrowL+area >rightEyebrowHeight) {
    score++;
  }
  if (NKBrowR-area<leftEyebrowHeight && NKBrowR+area >leftEyebrowHeight) {
    score++;
  }
  if (NKEyeL-area< eyeRightHeight && NKEyeL+area> eyeRightHeight) {
    score++;
  }
  if (NKEyeR-area< eyeLeftHeight && NKEyeR+area >eyeLeftHeight ) {
    score++;
  }
  if (NKNose-area< nostrilHeight && NKNose+area >nostrilHeight) {
    score++;
  }
  if (NKMouthH-area< mouthHeight && NKMouthH+area> mouthHeight) {
    score++;
  }
  if (NKMouthW-area< mouthWidth && NKMouthW+area> mouthWidth) {
    score++;
  }
  if (NKOriX-ori<poseOrt_x && NKOriX+ori>poseOrt_x) {
    score++;
  }
  if (NKOriY-ori<poseOrt_y && NKOriY+ori>poseOrt_y) {
    score++;
  }
  if (NKOriZ-ori<poseOrt_z*-1 && NKOriZ+ori>poseOrt_z*-1) {
    score++;
  }
  //score=round((score*100)/max);
  displayScore();
}
int scoreP;

void displayScore(){
  scoreP=round(score*100)/max;
if (scoreP <= 9) {
    scoreString = "You are such a mundane person.";
  } else if (scoreP>=10 && scoreP<=39) {
    scoreString = "Your acting is ok but still too boring.";
  } else if ( scoreP>=40 & scoreP <=59) {
    scoreString = "You are kidda fancy person.";
  } else if ( scoreP>=60 & scoreP <=79) {
    scoreString = "Wow!! May be you can be a star one day.";
  } else if ( scoreP>=80 & scoreP <=99 ) {
    scoreString = "OH YEAH, BABY!! Ready for a spotlight?!";
  } else if (scoreP>=100){
    scoreString = "No wonder who is the next celebrity of the year";
  }
 }

void loadReferTable() {
  //referTable = loadTable("NikkiVideoData.csv","header");
  //println(referTable.getRowCount() + "total rows in table");
  for (TableRow row : referTable.rows()) {
    NKframe = row.getInt("frameCount");
    NKBrowL = row.getFloat("LBrowH");
    NKBrowR = row.getFloat("RBrowH");
    NKEyeL = row.getFloat("LEyeH");
    NKEyeR = row.getFloat("REyeH");
    NKNose = row.getFloat("nose");
    NKMouthH = row.getFloat("MouseH");
    NKMouthW = row.getFloat("MouseW");
    NKOriX = row.getFloat("OriX");
    NKOriY = row.getFloat("OriY");
    NKOriZ = row.getFloat("OriZ");
    println("DATA FROM THE CSV : "+NKOriZ);
  }
}

void saveReferTable() {
  infoTable = new Table();
  infoTable.addColumn("frameCount");
  infoTable.addColumn("LBrowH");
  infoTable.addColumn("RBrowH");
  infoTable.addColumn("LEyeH");
  infoTable.addColumn("REyeH");
  infoTable.addColumn("nose");
  infoTable.addColumn("MouseH");
  infoTable.addColumn("MouseW");
  infoTable.addColumn("OriX");
  infoTable.addColumn("OriY");
  infoTable.addColumn("OriZ");
  //saveTable(infoTable, "table.csv");
  //////////////////these were at setup()///////////////////////// 
  TableRow newRow = infoTable.addRow();
  newRow.setInt("frameCount", frameCount);//infoTable.lastRowIndex());
  newRow.setFloat("LBrowH", Math.round(leftEyebrowHeight*100)/100.0);
  newRow.setFloat("RBrowH", Math.round(rightEyebrowHeight*100)/100.0);
  newRow.setFloat("LEyeH", Math.round(eyeLeftHeight*100)/100.0);
  newRow.setFloat("REyeH", Math.round(eyeRightHeight*100)/100.0);
  newRow.setFloat("nose", Math.round(nostrilHeight*100)/100.0);  
  newRow.setFloat("MouseH", Math.round(mouthHeight*100)/100.0);
  newRow.setFloat("MouseW", Math.round(mouthWidth*100)/100.0);
  newRow.setFloat("OriX", Math.round(poseOrt_x*100)/100.0);
  newRow.setFloat("OriY", Math.round(poseOrt_y*1000)/1000.0);
  newRow.setFloat("OriZ", Math.round(poseOrt_z*100)/100.0);
}