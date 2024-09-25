import 'package:hotel_booking/features/hotels/domain/entities/duration_range_class.dart';

class DurationRangeClassModel extends DurationRangeClass {
  DurationRangeClassModel({
    required super.max,
    required super.min,
  });

  factory DurationRangeClassModel.fromJson(Map<String, dynamic> json) => DurationRangeClassModel(
        max: json["max"],
        min: json["min"],
    );
}
