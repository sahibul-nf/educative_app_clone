import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CourseListLoading extends StatelessWidget {
  const CourseListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: 20,
          left: 24,
          right: 24,
          bottom: 30,
        ),
        child: Column(
          children: [
            for (var i = 0; i < 2; i++)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // image placeholder
                  Container(
                    width: double.infinity,
                    height: 200.0,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  for (var i = 0; i < 2; i++)
                    Container(
                      width: double.infinity,
                      height: 16.0,
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  Container(
                    width: 100.0,
                    height: 16.0,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
