import '../models/course.dart';
import '../models/lesson.dart';

final List<Course> courses = [
  Course(
    id: 'c1',
    title: 'Introduction to Python Programming',
    authorName: 'John Doe',
    authorAvatarUrl: '<https://via.placeholder.com/150>',
    authorJob: 'Senior Software Engineer',
    imageUrl: '<https://via.placeholder.com/350x200>',
    description: 'Learn the basics of Python programming language.',
    level: 'Beginner',
    duration: '2 weeks',
    price: 'Free',
    status: null,
  ),
  Course(
    id: 'c2',
    title: 'Django Web Development',
    authorName: 'Jane Smith',
    authorAvatarUrl: '<https://via.placeholder.com/150>',
    authorJob: 'Software Engineer',
    imageUrl: '<https://via.placeholder.com/350x200>',
    description: 'Learn how to build web applications using Django.',
    level: 'Intermediate',
    duration: '4 weeks',
    price: 'Paid',
    status: null,
  ),
  Course(
    id: 'c3',
    title: 'Machine Learning with Python',
    authorName: 'Bob Johnson',
    authorAvatarUrl: '<https://via.placeholder.com/150>',
    authorJob: 'Data Scientist',
    imageUrl: '<https://via.placeholder.com/350x200>',
    description: 'Learn how to build machine learning models using Python.',
    level: 'Advanced',
    duration: '6 weeks',
    price: 'Paid',
    status: 'New',
  ),
];

// List of dummy lessons
final List<Lesson> lessons = [
  Lesson(
    title: 'Introduction',
    id: '',
    courseId: '',
    lessons: [
      LessonChild(
        id: '',
        title: 'Overview',
        content: '',
        isCompleted: false,
        lessonId: '',
        createdAt: DateTime.now(),
      ),
    ],
    showDetail: false,
  ),
  Lesson(
    title: 'Setting Up the Project',
    id: '',
    courseId: '',
    lessons: [
      LessonChild(
        id: '',
        title: 'Setting Up the Database',
        content: '',
        isCompleted: false,
        lessonId: '',
        createdAt: DateTime.now(),
      ),
    ],
    showDetail: false,
  ),
  Lesson(
    title: 'Building the Backend',
    id: '',
    courseId: '',
    lessons: [
      LessonChild(
        id: '',
        title: 'Building the API',
        content: '',
        isCompleted: false,
        lessonId: '',
        createdAt: DateTime.now(),
      ),
    ],
    showDetail: false,
  ),
  Lesson(
    title: 'Building the Frontend',
    id: '',
    courseId: '',
    lessons: [
      LessonChild(
        id: '',
        title: 'Building the UI',
        content: '',
        isCompleted: false,
        lessonId: '',
        createdAt: DateTime.now(),
      ),
    ],
    showDetail: false,
  ),
];
