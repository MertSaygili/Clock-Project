import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class TimeZones {
  TimeZones() {
    tz.initializeTimeZones();
  }

  Iterable<String> getLocations() {
    var locations = tz.timeZoneDatabase.locations;
    var locationList = locations.keys;

    return locationList;
  }

  String getTimeOfLocation(var location) {
    var locationName = tz.getLocation(location);
    var time = tz.TZDateTime.now(locationName).toString();

    return getTimeProperly(time);
  }

  String getLocation(var location) {
    return tz.getLocation(location).toString();
  }

  String getTimeProperly(String oldTime) {
    var tempTime = oldTime.split(' ')[1];
    var newTime = tempTime.split('.')[0];
    return newTime;
  }
}
