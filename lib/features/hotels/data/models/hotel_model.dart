import 'package:hotel_booking/features/hotels/data/models/analytics_model.dart';
import 'package:hotel_booking/features/hotels/data/models/best_offer_model.dart';
import 'package:hotel_booking/features/hotels/data/models/image_urls_model.dart';
import 'package:hotel_booking/features/hotels/data/models/rating_info_model.dart';
import 'package:hotel_booking/features/hotels/domain/entities/hotel.dart';

class HotelModel extends Hotel {
  HotelModel({
    required super.analytics,
    required super.badges,
    required super.bestOffer,
    required super.category,
    required super.categoryType,
    required super.destination,
    required super.hotelId,
    required super.images,
    required super.latitude,
    required super.longitude,
    required super.name,
    required super.ratingInfo,
  });

  factory HotelModel.fromJson(Map<String, dynamic> json) => HotelModel(
        analytics: AnalyticsModel.fromJson(json["analytics"]),
        badges: List<dynamic>.from(json["badges"].map((x) => x)),
        bestOffer: BestOfferModel.fromJson(json["best-offer"]),
        category: json["category"],
        categoryType: categoryTypeValues.map[json["category-type"]]!,
        destination: json["destination"],
        hotelId: json["hotel-id"],
        images: List<ImageUrlsModel>.from(json["images"].map((x) => ImageUrlsModel.fromJson(x))),
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        name: json["name"],
        ratingInfo: RatingInfoModel.fromJson(json["rating-info"]),
      );
}
