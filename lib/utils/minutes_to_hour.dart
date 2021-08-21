String minutesToHour (int minutes) {
  var hour = minutes / 60;
  var min = ((hour % 1) * 60).toInt();

  if (min == 0) {
    return '${hour.truncate()} hrs';
  } else if(hour < 1) {
    return '${min} mins';
  } else {
    return '${hour.truncate()}:${min.truncate()} hrs';
  } 
}