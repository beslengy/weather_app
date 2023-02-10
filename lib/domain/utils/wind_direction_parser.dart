import 'dart:math' as math;

enum WindDirection {
  north(directionDegrees: 0),
  northeast(directionDegrees: 45),
  east(directionDegrees: 90),
  southeast(directionDegrees: 135),
  south(directionDegrees: 180),
  southwest(directionDegrees: 225),
  west(directionDegrees: 270),
  northwest(directionDegrees: 315);

  final int directionDegrees;

  const WindDirection({required this.directionDegrees});

  static WindDirection? findByDegrees(int degrees) {
    var map = <int, WindDirection>{};

    for (WindDirection entity in WindDirection.values) {
      int delta;
      if (entity == north) {
        delta = math.min((0 - degrees).abs(), (360 - degrees).abs());
      } else {
        delta = (entity.directionDegrees - degrees).abs();
      }
      map[delta] = entity;
    }

    return map[(map.keys.toList()).reduce(math.min)];
  }
}
