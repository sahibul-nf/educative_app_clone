import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/lesson.dart';

final lessonProvider = FutureProvider.autoDispose.family<List<Lesson>, String>(
  (ref, courseId) async {
    final lessonController = LessonController();
    final lessons = await lessonController.getLessonsByCourseId(courseId);

    return lessons;
  },
);

final lessonChildProvider =
    FutureProvider.autoDispose.family<List<LessonChild>, String>(
  (ref, lessonId) async {
    final lessonController = LessonController();
    final lessonChild =
        await lessonController.getLessonChildByLessonId(lessonId);

    return lessonChild;
  },
);

final completeLessonChildProvider =
    FutureProvider.autoDispose.family<void, LessonChild>(
  (ref, lessonChild) async {
    final lessonController = LessonController();
    await lessonController.completeLessonChild(lessonChild.id,
        isComplete: lessonChild.isCompleted!);
  },
);

class LessonController {
  final supabase = Supabase.instance.client;

  Future<List<Lesson>> getLessonsByCourseId(String courseId) async {
    final response = await supabase
        .from('lesson')
        .select('*, lesson_child!inner(*)')
        .eq('course_id', courseId);

    // debugPrint("response: $response");

    final lessons = response
        .map((lesson) => Lesson.fromJson(lesson))
        .toList()
        .cast<Lesson>();

    debugPrint("lessons: ${lessons.length}");

    return lessons;
  }

  // get all lesson child by course id
  Future<List<LessonChild>> getLessonChildByLessonId(String courseId) async {
    final response = await supabase
        .from('lesson')
        .select('*, lesson_child!inner(*)')
        .eq('course_id', courseId)
        .order('created_at', ascending: true);

    // debugPrint("response: $response");

    final lessons = response
        .map((lesson) => Lesson.fromJson(lesson))
        .toList()
        .cast<Lesson>();

    final lessonChilds = <LessonChild>[];

    for (var lesson in lessons) {
      lessonChilds.addAll(lesson.lessons);
    }

    debugPrint("lessonChild: ${lessonChilds.length}");

    return lessonChilds;
  }

  // complete lesson child
  Future<void> completeLessonChild(String lessonChildId,
      {required bool isComplete}) async {
    final response = await supabase
        .from('lesson_child')
        .update({'is_completed': isComplete}).eq('id', lessonChildId);

    debugPrint("response: $response");
  }
}
