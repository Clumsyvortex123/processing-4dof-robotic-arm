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
int j = 70;
int k = 180;
int l = 0;
float thumb;
boolean baseinc,basedec,stalkup,stalkdown,midup,middown,gopen,gclose;

void setup() 
{

  arduino = new Arduino(this, Arduino.list()[0], 57600);
  arduino.pinMode(13, Arduino.SERVO);
  arduino.pinMode(8, Arduino.SERVO);
  arduino.pinMode(5, Arduino.SERVO);
  arduino.pinMode(2, Arduino.SERVO);
}

public void pick(){
  i =148;
  j=114;
  k=35;
}

public void drop(){
  i = 19;
  j=114;
  k=163;
}

void draw(){
   i=88;
  j=70;
  k=180;
  arduino.servoWrite(13, (int)i);
  arduino.servoWrite(8, (int)j);
  arduino.servoWrite(5, (int)k);
  arduino.servoWrite(2, (int)l);
  delay(50);
  pick();
  delay(1000);
  arduino.servoWrite(13, (int)i);
  arduino.servoWrite(8, (int)j);
  arduino.servoWrite(5, (int)k);
  arduino.servoWrite(2, (int)l);
  l = 180;
  arduino.servoWrite(2, (int)l);
  delay(1000);
  l=70;
  arduino.servoWrite(2, (int)l);
  delay(500);
  i=88;
  j=114;
  k=115;
  arduino.servoWrite(13, (int)i);
  arduino.servoWrite(8, (int)j);
  arduino.servoWrite(5, (int)k);
  arduino.servoWrite(2, (int)l);
  delay(50);
  drop();
  delay(1000);
  arduino.servoWrite(13, (int)i);
  arduino.servoWrite(8, (int)j);
  arduino.servoWrite(5, (int)k);
  arduino.servoWrite(2, (int)l);
  delay(1000);
  l = 180;
  arduino.servoWrite(2, (int)l);
  delay(1000);
  l=70;
  arduino.servoWrite(2, (int)l);
  delay(50);
  i=88;
  j=70;
  k=180;
  arduino.servoWrite(13, (int)i);
  arduino.servoWrite(8, (int)j);
  arduino.servoWrite(5, (int)k);
  arduino.servoWrite(2, (int)l);
  delay(500);
  println("i %d",i);
  println("j %d",j);
  println("k %d",k);
  println("l %d",l); 
  
}
