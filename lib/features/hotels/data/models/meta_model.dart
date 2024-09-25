import 'package:hotel_booking/features/hotels/data/models/agent_model.dart';
import 'package:hotel_booking/features/hotels/data/models/scarcity_element_model.dart';
import 'package:hotel_booking/features/hotels/domain/entities/meta.dart';

class MetaModel extends Meta {
  MetaModel({
    required super.agent,
    required super.count,
    required super.scarcityElements,
  });

  factory MetaModel.fromJson(Map<String, dynamic> json) => MetaModel(
        agent: AgentModel.fromJson(json["agent"]),
        count: json["count"],
        scarcityElements: List<ScarcityElementModel>.from(json["scarcity-elements"].map((x) => ScarcityElementModel.fromJson(x))),
      );
}
