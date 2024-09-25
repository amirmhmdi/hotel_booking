import 'package:hotel_booking/features/hotels/domain/entities/image_urls.dart';

class Agent {
  String availability;
  ImageUrls image;
  String name;
  String telephone;
  String text;
  String vita;

  Agent({
    required this.availability,
    required this.image,
    required this.name,
    required this.telephone,
    required this.text,
    required this.vita,
  });
}
