import 'package:intl/intl.dart';
import 'package:logging/logging.dart';
import 'package:flutter/foundation.dart' show kDebugMode;

String formatEventStartTime(DateTime startTime) {
  String timezoneAbbreviation = startTime.timeZoneName;
  return DateFormat('EEEE, MMMM d ' '\'at\'' ' h:mma ').format(startTime) +
      timezoneAbbreviation;
}

final Logger logger = Logger('MyLogger');

void setupLogger() {
  logger.level = Level.ALL; // Set the logging level
  logger.onRecord.listen((record) {
    if (kDebugMode) {
      print('${record.level.name}: ${record.time}: ${record.message}');
    }
  });
}
