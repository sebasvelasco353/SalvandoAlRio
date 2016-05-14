class Timer {
   long startTime ;   // time in msecs that timer started
   long timeSoFar ;   // use to hold total time of run so far, useful in 
                      // conjunction with pause and continueRunning
   boolean running ;
   int x, y ;   // location of timer output
   
   public Timer(int inX, int inY) {
     x = inX ;
     y = inY ;
     running = false ;
     timeSoFar = 0 ;
   }
   
   public int currentTime() {
     if ( running )
       return (  (int)   ( (millis() - startTime) / 1000.0) ) ;
     else
       return ( (int) (timeSoFar / 1000.0) ) ;
   }
   void start()
   {
     running = true ;
     startTime = millis();
   }

  public void restart()
   // reset the timer to zero and restart, identical to start
   {
     start() ;
   }
   
   public void pause()
   {
     if (running)
     {
       timeSoFar =   millis() - startTime  ;
       running = false ;
     }
     // else do nothing, pause already called
   }
   
  public void continueRunning()
   // called after stop to restart the timer running
   // no effect if already running
   {
     if (!running)
     {  
       startTime = millis() - timeSoFar ;
       running = true ;
     }
   }
   
   public void DisplayTime()
   {
    int theTime ;
    String output = "";
    theTime = currentTime() ;
    output = output + theTime ;
    //println("output = " + output) ;
    fill(150,0,200) ;
    text(output,x,y) ;
   }
}