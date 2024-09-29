import 'package:hotel_booking/features/hotels/data/models/agent_model.dart';
import 'package:hotel_booking/features/hotels/data/models/scarcity_element_model.dart';
import 'package:hotel_booking/features/hotels/domain/entities/meta.dart';

class MetaModel extends Meta {
  final AgentModel agentModel;
  final List<ScarcityElementModel> scarcityElementsModel;
  MetaModel({
    required this.agentModel,
    required super.count,
    required this.scarcityElementsModel,
  }) : super(agent: agentModel, scarcityElements: scarcityElementsModel);

  factory MetaModel.fromDomin(Meta meta) => MetaModel(
        agentModel: AgentModel.fromDomain(meta.agent),
        count: meta.count,
        scarcityElementsModel: List<ScarcityElementModel>.from(meta.scarcityElements.map((x) => ScarcityElementModel.fromDomain(x))),
      );

  factory MetaModel.fromJson(Map<String, dynamic> json) => MetaModel(
        agentModel: AgentModel.fromJson(json["agent"]),
        count: json["count"],
        scarcityElementsModel: List<ScarcityElementModel>.from(json["scarcity-elements"].map((x) => ScarcityElementModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "agent": agentModel.toJson(),
        "count": count,
        "scarcity-elements": List<dynamic>.from(scarcityElementsModel.map((x) => x.toJson())),
      };
}
