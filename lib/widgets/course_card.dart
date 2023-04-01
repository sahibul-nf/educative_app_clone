import 'package:educative_app_clone/colors.dart';
import 'package:educative_app_clone/models/course.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CourseCard extends ConsumerStatefulWidget {
  const CourseCard(
    this.course, {
    super.key,
    required this.onPressed,
  });
  final Course course;
  final VoidCallback onPressed;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CourseCardState();
}

class _CourseCardState extends ConsumerState<CourseCard> {
  bool onHover = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.network(
                widget.course.imageUrl,
                height: MediaQuery.of(context).size.height * 0.2,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.course.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          widget.course.authorImageUrl,
                          height: 30,
                          width: 30,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'by ',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        widget.course.instructor,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildLevelIndicatorStep(
                                context, widget.course.level),
                            const SizedBox(height: 10),
                            Text(
                              widget.course.level,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                      OutlinedButton(
                        onPressed: widget.onPressed,
                        onHover: (value) {
                          setState(() {
                            onHover = value;
                          });
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: MyColors.primary,
                          side: BorderSide(
                            color: onHover ? MyColors.black : Colors.grey,
                            width: 1,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Preview',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(width: 5),
                            Icon(
                              Icons.arrow_forward_rounded,
                              size: 20,
                              color: MyColors.primary,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildLevelIndicatorStep(BuildContext context, String level) {
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
