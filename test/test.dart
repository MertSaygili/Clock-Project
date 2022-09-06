// ignore_for_file: avoid_print
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

void main() {
  tz.initializeTimeZones();
  var locations = tz.timeZoneDatabase.locations;
  for (int i = 0; i < locations.length; i++) {
    var location = tz.getLocation(locations.keys.elementAt(i));
    var timeNow = tz.TZDateTime.now(location);

    print('${location} ${timeNow}');
  }
}
