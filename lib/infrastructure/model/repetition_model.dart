import 'package:drift/drift.dart';
import 'package:habbit_app/infrastructure/model/task_reminder_model.dart';

import 'category_model.dart';

class RecurringRepetitionModel extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get type => text().named('type')();
  TextColumn get daysWeek => text().named('days_week')();
  TextColumn get daysMonth => text().named('days_month')();
  TextColumn get timePeriod => text().named('time_period')();
  TextColumn get repeat => text().named('repeat')();
  DateTimeColumn get specificDay => dateTime().named('specific_day')();
}
