String minutesToHour (int minutes) {
  var hour = minutes / 60;
  var min = ((hour % 1) * 60).toInt();

  if (min == 0) {
    return '${hour.truncate()}h';
  } else if(hour < 1) {
    return '${min}m';
  } else {
    return '${hour.truncate()}:${min.truncate()}h';
  } 
}