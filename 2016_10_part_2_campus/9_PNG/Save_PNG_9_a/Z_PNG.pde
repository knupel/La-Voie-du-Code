boolean record_PNG ;

void save_PNG() {
  if(record_PNG) saveFrame("impression/PNG-######.png");
  record_PNG = false ;
}

void event_PNG() {
  record_PNG = true;
}