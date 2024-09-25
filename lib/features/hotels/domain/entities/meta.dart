import 'package:hotel_booking/features/hotels/domain/entities/agent.dart';
import 'package:hotel_booking/features/hotels/domain/entities/scarcity_element.dart';

class Meta {
  Agent agent;
  int count;
  List<ScarcityElement> scarcityElements;

  Meta({
    required this.agent,
    required this.count,
    required this.scarcityElements,
  });
}
