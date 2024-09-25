import 'package:hotel_booking/features/hotels/domain/entities/rating_info.dart';

class RatingInfoModel extends RatingInfo {
  RatingInfoModel({
    required super.recommendationRate,
    required super.reviewsCount,
    required super.score,
    required super.scoreDescription,
  });

  factory RatingInfoModel.fromJson(Map<String, dynamic> json) => RatingInfoModel(
        recommendationRate: json["recommendation-rate"],
        reviewsCount: json["reviews-count"],
        score: json["score"]?.toDouble(),
        scoreDescription: json["score-description"],
      );
}
