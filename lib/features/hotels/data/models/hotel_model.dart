import 'package:hotel_booking/features/hotels/data/models/analytics_model.dart';
import 'package:hotel_booking/features/hotels/data/models/best_offer_model.dart';
import 'package:hotel_booking/features/hotels/data/models/image_urls_model.dart';
import 'package:hotel_booking/features/hotels/data/models/rating_info_model.dart';
import 'package:hotel_booking/features/hotels/domain/entities/hotel.dart';

class HotelModel extends Hotel {
  final AnalyticsModel analyticsModel;
  final BestOfferModel bestOfferModel;
  final List<ImageUrlsModel> imagesModel;
  final RatingInfoModel ratingInfoModel;
  HotelModel({
    required this.analyticsModel,
    required super.badges,
    required this.bestOfferModel,
    required super.category,
    required super.categoryType,
    required super.destination,
    required super.hotelId,
    required this.imagesModel,
    required super.latitude,
    required super.longitude,
    required super.name,
    required this.ratingInfoModel,
  }) : super(
          analytics: analyticsModel,
          bestOffer: bestOfferModel,
          images: imagesModel,
          ratingInfo: ratingInfoModel,
        );

  factory HotelModel.fromDomain(Hotel hotel) => HotelModel(
        analyticsModel: AnalyticsModel.fromDomain(hotel.analytics),
        badges: hotel.badges,
        bestOfferModel: BestOfferModel.fromDomain(hotel.bestOffer),
        category: hotel.category,
        categoryType: hotel.categoryType,
        destination: hotel.destination,
        hotelId: hotel.hotelId,
        imagesModel: List<ImageUrlsModel>.from(hotel.images.map((x) => ImageUrlsModel.fromDomain(x))),
        latitude: hotel.latitude,
        longitude: hotel.longitude,
        name: hotel.name,
        ratingInfoModel: RatingInfoModel.fromDomain(hotel.ratingInfo),
      );

  factory HotelModel.fromJson(Map<String, dynamic> json) => HotelModel(
        analyticsModel: AnalyticsModel.fromJson(json["analytics"]),
        badges: List<dynamic>.from(json["badges"].map((x) => x)),
        bestOfferModel: BestOfferModel.fromJson(json["best-offer"]),
        category: json["category"],
        categoryType: categoryTypeValues.map[json["category-type"]]!,
        destination: json["destination"],
        hotelId: json["hotel-id"],
        imagesModel: List<ImageUrlsModel>.from(json["images"].map((x) => ImageUrlsModel.fromJson(x))),
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        name: json["name"],
        ratingInfoModel: RatingInfoModel.fromJson(json["rating-info"]),
      );

  Map<String, dynamic> toJson() => {
        "analytics": analyticsModel.toJson(),
        "badges": List<dynamic>.from(badges.map((x) => x)),
        "best-offer": bestOfferModel.toJson(),
        "category": category,
        "category-type": categoryTypeValues.reverse[categoryType],
        "destination": destination,
        "hotel-id": hotelId,
        "images": List<dynamic>.from(imagesModel.map((x) => x.toJson())),
        "latitude": latitude,
        "longitude": longitude,
        "name": name,
        "rating-info": ratingInfoModel.toJson(),
      };
}
