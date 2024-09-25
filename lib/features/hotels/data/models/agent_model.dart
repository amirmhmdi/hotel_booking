import 'package:hotel_booking/features/hotels/data/models/image_urls_model.dart';
import 'package:hotel_booking/features/hotels/domain/entities/agent.dart';

class AgentModel extends Agent {
  AgentModel({
    required super.availability,
    required super.image,
    required super.name,
    required super.telephone,
    required super.text,
    required super.vita,
  });

  factory AgentModel.fromJson(Map<String, dynamic> json) => AgentModel(
        availability: json["availability"],
        image: ImageUrlsModel.fromJson(json["image"]),
        name: json["name"],
        telephone: json["telephone"],
        text: json["text"],
        vita: json["vita"],
      );
}
