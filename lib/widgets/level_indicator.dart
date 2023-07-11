import 'package:flutter/material.dart';

import '../themes/colors.dart';

class LevelIndicator extends StatelessWidget {
  const LevelIndicator({super.key, required this.level});
  final String level;

  @override
  Widget build(BuildContext context) {
    int step = 0;
    switch (level) {
      case 'Beginner':
        step = 1;
        break;
      case 'Intermediate':
        step = 2;
        break;
      case 'Advanced':
        step = 3;
        break;
    }

    return SizedBox(
      height: 8,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          Color? color = MyColors.primary;
          if (step < index + 1) {
            color = Colors.grey[300];
          }
          return Container(
            height: 8,
            width: 8,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(5),
            ),
          );
        },
        separatorBuilder: (context, index) {
          Color? color = MyColors.primary;
          if (step < index + 1 || step == index + 1) {
            color = Colors.grey[300];
          }

          return UnconstrainedBox(
            child: Container(
              width: 5,
              height: 2,
              color: color,
            ),
          );
        },
      ),
    );
  }
}
