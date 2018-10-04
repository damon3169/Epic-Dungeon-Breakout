class Timer
{
 float Time;
 
 Timer(float set)//Constructor when you create a new Timer
 {
   Time = set;
 }
 float getTime()//return the current time
 {
 return(Time); 
}
 void setTimer(float set)//set the Timer to whatever you put as you temp varable 
 {
  Time = set;
 }
 void countUp()// update the timer by counting up. this need to be called within void draw() to work
 {
 Time += 1/frameRate;
 }
 void countDown()
 {
   println(Time);
   Time -= 1/frameRate;
    if(Time<0){
   println("game over");
    }
 }
 
}
