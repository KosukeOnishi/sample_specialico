import 'package:specialico/index.dart';

part 'current_position_repository.g.dart';

@Riverpod(keepAlive: true)
class CurrentPositionRepository extends _$CurrentPositionRepository {
  @override
  Position? build() {
    return null;
  }

  void registerPosition(Position? position) {
    if (position != null && state != null) {
      final distance =
          DistanceCalculator.calculateDistanceOfTwo(position, state!);
      // 3mの移動があったときのみpositionを更新する
      if (distance >= 3) state = position;
    } else {
      state = position;
    }
  }
}
