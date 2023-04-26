class Lesson {
  final String id;
  final String title;
  final String courseId;
  final List<LessonChild> lessons;
  bool showDetail;

  Lesson({
    required this.title,
    required this.courseId,
    required this.id,
    required this.lessons,
    required this.showDetail,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['id'],
      title: json['title'],
      courseId: json['course_id'],
      lessons: json['lesson_child']
          .map<LessonChild>((lesson) => LessonChild.fromJson(lesson))
          .toList()
          .cast<LessonChild>(),
      showDetail: false,
    );
  }
}

class LessonChild {
  final String id;
  final String title;
  final String content;
  bool? isCompleted;
  final String lessonId;
  final DateTime? createdAt;

  LessonChild({
    required this.id,
    required this.title,
    required this.content,
    required this.isCompleted,
    required this.lessonId,
    this.createdAt,
  });

  factory LessonChild.fromJson(Map<String, dynamic> json) {
    return LessonChild(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      isCompleted: json['is_completed'] ?? false,
      lessonId: json['lesson_parent_id'],
      createdAt: DateTime.tryParse(json['created_at']),
    );
  }
}
