//public float info[5];//eye brow(left/right),eyes(left/right),nose,mouth(width/height),roatation)
Boolean plugged;
public void eyebrowLeftReceived(float h) {
  //println("eyebrow right: " + h);//miror view
  leftEyebrowHeight = h;
}

public void eyebrowRightReceived(float h) {
  //println("eyebrow left: " + h);//mirror view
  rightEyebrowHeight = h;
}

public void eyeLeftReceived(float h) {
  //println("eye right: " + h);
  eyeLeftHeight = h;
}

public void eyeRightReceived(float h) {
  //println("eye left: " + h);
  eyeRightHeight = h;
}
public void poseScale(float s) {
  //println("scale: " + s);
  poseScale = s;
  poseScale=round(poseScale);
}

public void posePosition(float x, float y) {
  //println("pose position\tX: " + x + " Y: " + y );
  posePosition = new PVector(x, y);
  posePos_x=x;
  posePos_y=y;
}

public void poseOrientation(float x, float y, float z) {
  //println("pose orientation\tX: " + x + " Y: " + y + " Z: " + z);
  poseOrt_x=x;
  poseOrt_y=y;
  poseOrt_z=z;
  // println("poseOrt_y :"+poseOrt_y);
}
public void mouthHeightReceived(float h) {
 //println("mouth height: " + h);
  mouthHeight = h;
}
public void mouthWidthReceived(float w) {
  //println("mouth Width: " + w);
  mouthWidth = w;
}

public void nostrilsReceived(float h) {
  //println("nostrils: " + h);
  nostrilHeight = h;

}

void oscEvent(OscMessage theOscMessage) {
  plugged = theOscMessage.isPlugged();
  if (theOscMessage.isPlugged()==false) {
    //println("UNPLUGGED: " + theOscMessage);
    //println("FC when Osc on: "+frameCount);
  }
}