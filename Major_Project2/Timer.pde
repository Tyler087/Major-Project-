class Timer {
  // data
  int startTime, timeToWait, endTime;

  // constructor
  Timer(int _timeToWait) {
    timeToWait = _timeToWait;
  }

  // behaviour
  void begin() {
    startTime = millis();
    endTime = startTime + timeToWait;
    timeToWait -=40;
    if(timeToWait < 800){
      timeToWait = 800;
    }
  }

  boolean isFinished() {
    if (millis() >= endTime) {
      return true;
    } else {
      return false;
    }
  }

  void setWaitTime(int _timeToWait) {
    timeToWait = _timeToWait;
  }
}