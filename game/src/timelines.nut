///////////////
// TIMELINES //
///////////////

::Timeline <- class extends Actor {
  timer = 0;
  line = 0;

  function step(){
    if(line != 0){
      line(timer);
    };

    timer++;
  };

  function destructor(){
    print("Timeline ended: " + timer.tostring());
	};
};

::newTimeline <- function(timeline){
  local c = newActor(Timeline, 0, 0);
  actor[c].line = timeline;
};

::tlTest <- function(timer){
  switch(timer){
    case 30:
      newActor(TestBall, 24, 24);
      break;
    case 60:
      newActor(TestBall, 64, 64);
      newActor(TestBall, 128, 64);
      break;
    case 120:
      newActor(TestBall, 32, 32);
      newActor(TestBall, 32, 96);
      deleteActor(this.id);
      break;
  };
};

::tlSplashScreen <- function(timer){
  switch(timer){ //TODO: Make splash images
    case 0:

      break;
    case 90:

      break;
    case 180:

      break;
  };
};
