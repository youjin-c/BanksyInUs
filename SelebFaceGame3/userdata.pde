int userCount, userPost;
JSONObject json;
boolean userFlag = false;
String userAgree;

void jsonLoad(){
  json = loadJSONObject("user.json");
  userCount = json.getInt("id")+1;
  //println("new user conunt"+userCount);
  //json = new JSONObject();
  json.getInt("id", userCount);
  json.getString("sel", userSel);
  json.getInt("postcard",userPost);
  json.getString("agreement",userAgree);
  saveJSONObject(json, "user.json");
}
void jsonSave(){
  json.setInt("id", userCount);
  json.setString("sel", userSel);
  json.setInt("postcard",userPost);
  json.setString("email",email);
  json.setString("agreement",userAgree);
  saveJSONObject(json, "user.json");
}

void saveUserTable() {
  userTable = new Table();
  userTable.addColumn("id"); // # of users
  userTable.addColumn("sel");
  userTable.addColumn("postcard");
  userTable.addColumn("email");
  userTable.addColumn("agreement");
  TableRow newRow = userTable.addRow();
  newRow.setInt("id", userCount);//infoTable.lastRowIndex());
  newRow.setString("sel", userSel);
  newRow.setInt("postcard",userPost);
  newRow.setString("email",email);
  newRow.setString("agreement",userAgree);
  saveTable(userTable, "csv/userTable.csv");
}

void loadUserTable() {
  userTable = loadTable("csv/userTable.csv","header");
  //println(userTable.getRowCount() + " users");
  //userCount = userTable.getRowCount();

  // for (TableRow row : referTable.rows()) {
  //   userCount = row.getInt("count");
  //   choice    = row.getInt("choice");
  //   email     = row.getString("email");
  //   println("DATA FROM THE CSV : "+userCount);
  // }
}