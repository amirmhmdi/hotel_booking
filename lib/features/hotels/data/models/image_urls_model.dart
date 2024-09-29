import 'package:hotel_booking/features/hotels/domain/entities/image_urls.dart';

class ImageUrlsModel extends ImageUrls {
  ImageUrlsModel({
    required super.large,
    required super.small,
  });

  factory ImageUrlsModel.fromDomain(ImageUrls imageUrls) => ImageUrlsModel(
        large: imageUrls.large,
        small: imageUrls.small,
      );

  factory ImageUrlsModel.fromJson(Map<String, dynamic> json) => ImageUrlsModel(
        large: json["large"],
        small: json["small"],
      );

  Map<String, dynamic> toJson() => {
        "large": large,
        "small": small,
      };
}
