import 'package:flutter/material.dart';

import 'colors.dart';

class BD extends BoxDecoration {
  /// 달력에서 defaultCircle
  const BD.defaultCircle(Color color)
      : super(
          color: color,
          shape: BoxShape.circle,
        );

  const BD.marker(Color color) : super(color: color, shape: BoxShape.circle);

  /// 달력에서 defaultCircle
  BD.todayCircle(Color color)
      : super(
          color: colorWhite,
          shape: BoxShape.circle,
          border: Border.all(color: colorBlack),
        );
}
