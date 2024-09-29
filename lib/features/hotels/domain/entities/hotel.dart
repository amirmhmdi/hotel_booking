import 'package:equatable/equatable.dart';
import 'package:hotel_booking/features/hotels/domain/entities/analytics.dart';
import 'package:hotel_booking/features/hotels/domain/entities/best_offer.dart';
import 'package:hotel_booking/features/hotels/domain/entities/enum_values.dart';
import 'package:hotel_booking/features/hotels/domain/entities/image_urls.dart';
import 'package:hotel_booking/features/hotels/domain/entities/rating_info.dart';

class Hotel extends Equatable {
  Analytics analytics;
  List<dynamic> badges;
  BestOffer bestOffer;
  int category;
  CategoryType categoryType;
  String destination;
  String hotelId;
  List<ImageUrls> images;
  double latitude;
  double longitude;
  String name;
  RatingInfo ratingInfo;

  Hotel({
    required this.analytics,
    required this.badges,
    required this.bestOffer,
    required this.category,
    required this.categoryType,
    required this.destination,
    required this.hotelId,
    required this.images,
    required this.latitude,
    required this.longitude,
    required this.name,
    required this.ratingInfo,
  });

  @override
  List<Object> get props => [hotelId];
}

enum CategoryType { DOTS }

final categoryTypeValues = EnumValues({"dots": CategoryType.DOTS});
