import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/course.dart';

final courseProvider = FutureProvider.autoDispose<List<Course>>((ref) async {
  final courseController = CourseController();
  final courses = await courseController.getCourses();

  return courses;
});

class CourseController {
  final supabase = Supabase.instance.client;

  Future<List<Course>> getCourses() async {
    final response = await supabase.from('course').select();

    final courses = response
        .map((course) => Course.fromJson(course))
        .toList()
        .cast<Course>();

    debugPrint("courses: ${courses.length}");

    return courses;
  }
}
