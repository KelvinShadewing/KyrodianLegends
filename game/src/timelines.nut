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
};

::newTimeline <- function(timeline){
  local c = newActor(Timeline, 0, 0);
  actor[c].line = timeline;
};


