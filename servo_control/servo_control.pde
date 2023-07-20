import processing.serial.*;
import net.java.games.input.*;
import org.gamecontrolplus.*;
import org.gamecontrolplus.gui.*;
import cc.arduino.*;
import org.firmata.*;


ControlDevice cont;
ControlIO control;
Arduino arduino;
int i = 88 ;
int j =114;
int k = 115;
int l = 0;
float thumb;
boolean baseinc,basedec,stalkup,stalkdown,midup,middown,gopen,gclose;

void setup() 
{
  size(360, 200);
  control = ControlIO.getInstance(this);
  cont = control.getMatchedDevice("xbsf");

  if (cont == null) {
    println("not today chump"); // write better exit statements than me
    System.exit(-1);
  }
 
  arduino = new Arduino(this, Arduino.list()[0], 57600);
  arduino.pinMode(13, Arduino.SERVO);
  arduino.pinMode(8, Arduino.SERVO);
  arduino.pinMode(5, Arduino.SERVO);
  arduino.pinMode(2, Arduino.SERVO);
}

public void baseinc()
{
  baseinc = cont.getButton("baseinc").pressed();
  if (baseinc==true)
  {
    i = i + 3;
  }

}

public void basedec()
{
  basedec = cont.getButton("basedec").pressed();
  if (basedec==true)
  {
    i = abs(i - 3);
  }

}

public void stalkup()
{
  stalkup = cont.getButton("sup").pressed();
  if (stalkup==true)
  {
    j = j + 1;
  }

}

public void stalkdown()
{
  stalkdown = cont.getButton("sdown").pressed();
  if (stalkdown==true)
  {
    j = abs(j - 3);
  }
}

public void midup()
{
  midup = cont.getButton("mup").pressed();
  if (midup==true)
  {
    k = k + 1;
  }
}

public void middown()
{
  middown = cont.getButton("mdown").pressed();
  if (middown==true)
  {
    k = abs(k - 3);
  }
}   
public void gopen()
{
  gopen = cont.getButton("gripop").pressed();
  if (gopen==true)
  {
    l = l + 3;
  }
}
public void gclose()
{
  gclose = cont.getButton("gripclose").pressed();
  if (gclose==true)
  {
    l = abs(l - 3);
  }

}
void draw() 
{
  baseinc();
  basedec();
  stalkup();
  stalkdown();
  midup();
  middown();
  gopen();
  gclose();
  background(thumb,100,255);
  arduino.servoWrite(13, (int)i);
  arduino.servoWrite(8, (int)j);
  arduino.servoWrite(5, (int)k);
  arduino.servoWrite(2, (int)l);
  println("i %d",i);
  println("j %d",j);
  println("k %d",k);
  println("l %d",l);

}
