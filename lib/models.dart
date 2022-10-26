enum RecordTimeOfDay {
  morning('morning'),
  noon('noon'),
  afternoon('afternoon'),
  evening('evening'),
  night('night');

  final String value;

  const RecordTimeOfDay(this.value);

  static RecordTimeOfDay getByTime(DateTime time) {
    if (time.hour >= 7 && time.hour < 11) {
      return RecordTimeOfDay.morning;
    } else if (time.hour >= 11 && time.hour < 14) {
      return RecordTimeOfDay.noon;
    } else if (time.hour >= 14 && time.hour < 18) {
      return RecordTimeOfDay.afternoon;
    } else if (time.hour >= 18 && time.hour < 0) {
      return RecordTimeOfDay.evening;
    }
    return RecordTimeOfDay.night;
  }

  static RecordTimeOfDay? getByValue(String todValue) {
    for (RecordTimeOfDay tod in RecordTimeOfDay.values) {
      if (tod.value == todValue) {
        return tod;
      }
    }
    return null;
  }
}
