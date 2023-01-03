import 'package:habbit_app/infrastructure/model/habbit_model.dart';
import 'package:habbit_app/infrastructure/model/repetition_model.dart';

class HabitData {
  final HabbitModel habit;
  final RecurringRepetitionModel repetitionModel;

  HabitData({required this.habit, required this.repetitionModel});
}