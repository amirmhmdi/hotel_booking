import 'package:hotel_booking/features/hotels/data/models/image_urls_model.dart';
import 'package:hotel_booking/features/hotels/domain/entities/agent.dart';

class AgentModel extends Agent {
  final ImageUrlsModel imageUrlsModel;
  AgentModel({
    required super.availability,
    required this.imageUrlsModel,
    required super.name,
    required super.telephone,
    required super.text,
    required super.vita,
  }) : super(
          image: imageUrlsModel,
        );

  factory AgentModel.fromDomain(Agent agent) => AgentModel(
        availability: agent.availability,
        imageUrlsModel: ImageUrlsModel.fromDomain(agent.image),
        name: agent.name,
        telephone: agent.telephone,
        text: agent.text,
        vita: agent.vita,
      );

  factory AgentModel.fromJson(Map<String, dynamic> json) => AgentModel(
        availability: json["availability"],
        imageUrlsModel: ImageUrlsModel.fromJson(json["image"]),
        name: json["name"],
        telephone: json["telephone"],
        text: json["text"],
        vita: json["vita"],
      );

  Map<String, dynamic> toJson() => {
        "availability": availability,
        "image": imageUrlsModel.toJson(),
        "name": name,
        "telephone": telephone,
        "text": text,
        "vita": vita,
      };
}
