class Timer
{
 float Time;
 boolean timerEnd = false;
 
 Timer(float set)
 {
   Time = set;
 }
 float getTime()
 {
 return(Time); 
}
 void setTimer(float set) 
 {
  Time = set;
 }
 void countUp()
 {
 Time += 1/frameRate;
 }
 void countDown()
 {
   println(Time);
   Time -= 1/frameRate;
    if(Time<0){
       timerEnd = true;
    }
 }
 
}
