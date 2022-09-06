import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class TimeZones {
  Iterable<String> getLocations() {
    tz.initializeTimeZones();

    var locations = tz.timeZoneDatabase.locations;
    var locationList = locations.keys;

    return locationList;
  }
}
