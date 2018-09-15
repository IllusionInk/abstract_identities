//Studio Entry Generative Art Code

//import pdf library and specific motifs.
import processing.pdf.*;
PShape motif1;
PShape motif2;
Table table;

void setup(){
size(500,700);
smooth();
motif1 = loadShape("loc.svg"); // import shape svg
motif2 = loadShape("workexp.svg"); // import shape svg
table = loadTable("kids.csv","header"); // read the datafile
}

void draw(){
  viz();
  exit();
}

//function for plotting the viz.
void viz(){
  
  //reading data from the csv file. Accessing data by row and using row. operations 
  //to store this local variables.
  for(int i = 0; i< table.getRowCount(); i = i+1){
  TableRow row = table.getRow(i);
  int age = row.getInt("Age");
  String kid_name = row.getString("Name");
  String gender = row.getString("Gender");
  
  //Mapping birthplace
  float lat = row.getFloat("Lat");
  float lon = row.getFloat("Long");
  float posx = map(lon,68.826,96.128,100,400);
  float posy =map(lat,8.09,35.55,400,100);
  
  //Generating start and end points for birthdate
  int srtang = row.getInt("Date");
  int enang = row.getInt ("Month");
  
  float s = radians(srtang*6);
  float e = radians(enang*30);
  
  float we = row.getFloat("WorkEx");
  int n = ceil(we);
  
  //Getting values for hobbies indoor v/s outdoor
  int hobin = row.getInt("hobin");
  int hobout = row.getInt("hobout");
  
  String firstname = row.getString("Firstname");
  String surname = row.getString("Surname");
  
  
  //Separate files for each kid
  beginRecord(PDF, kid_name + "_art.pdf");
  colorMode(HSB,360,100,100);
  background(240,0,100);
  
  // Marking the base, age and gender
  if (gender.equals("Male")){
  fill(59,57,88);
  } else if (gender.equals("Female")){
  fill(190,63,80);
  }
  noStroke(); 
  //Gender + Age
  int r = age*12;
  int rh = r/2;
  ellipse(250,250,r,r);
  
  //guides
  stroke(#888888);
  line(250,100,250,400);
  line(100,250,400,250);
  
  //Birthtown
  shape(motif1, posx,posy,116,73);
  
  //Date_Of_Birth
  noFill();
  strokeCap(ROUND);
  strokeWeight(6);
  if (enang <= 3){
  arc(250,250,400,400,s-HALF_PI, 3*PI/2+e);
  }else{
  arc(250,250, 400,400,s-HALF_PI,e-HALF_PI);
}
  
  //WorkExp
  for(int j=0; j<=n-1; j=j+1){
    motif2.disableStyle();
    noStroke();
    fill(341,56,72-j*10);
    shape(motif2,300+j*20,300+j*20,90,90);
  }
  
  //Hobbies
  pushMatrix();
  translate(250,250);
  //in-hobby
  for(int k=0; k <= hobin -1; k=k+1){
  noStroke();
  fill(210,28,55);
  ellipse((rh/1.414)-20*(k+1),-((rh/1.414)-20*(k+1)),20,20);
  }
  //out-hobby
  for(int k=0; k <= hobout-1; k=k+1){
  noStroke();
  fill(211,27,40);
  ellipse((rh/1.414)+20*(k+1),-((rh/1.414)+20*(k+1)),20,20);
  }
  popMatrix();
  
  //Name_AlphaNumeral Codes
  String na = str(int(char(firstname.charAt(0)-64)));
  String nb = str(int(char(surname.charAt(0)-64)));
  
  //String nc = "Information Design || 2018 ";
  fill(344,11,13);
  text(na+nb,50,600,60,60);
  endRecord();
  }
}
