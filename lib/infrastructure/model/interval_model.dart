// ignore_for_file: public_member_api_docs, sort_constructors_first
class IntervalModel {
  int hour, min, sec;
  bool breaktog;
  IntervalModel(
      {required this.min,
      required this.sec,
      required this.hour,
      required this.breaktog});
  IntervalModel.fromJson(Map<String, dynamic> json)
      : min = json['min'],
        hour = json['hour'],
        sec = json['sec'],
        breaktog = json['break'];

  Map<String, dynamic> toJson() =>
      {'min': min, 'hour': hour, 'sec': sec, 'break': breaktog};

  int getTotalSceconds() {
    return (hour * 3600) + (min * 60) + (sec);
  }
}
