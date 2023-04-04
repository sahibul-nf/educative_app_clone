class Course {
  final String title;
  final String instructor;
  final String authorImageUrl;
  final String imageUrl;
  final String description;
  final String level;
  final String duration;
  final List<String> takeawaySkills;
  final String price;
  final List<CourseContent> courseContent;
  final List<Lesson> lessons;

  Course({
    required this.title,
    required this.instructor,
    required this.imageUrl,
    required this.description,
    required this.level,
    required this.duration,
    required this.takeawaySkills,
    required this.price,
    required this.courseContent,
    required this.lessons,
    required this.authorImageUrl,
  });
}

final List<Course> courses = [
  Course(
    title: 'Build educative.io clone with Flutter and Supabase',
    instructor: 'Sahibul',
    authorImageUrl: 'https://i.pravatar.cc/150?img',
    imageUrl:
        'https://www.educative.io/cdn-cgi/image/format=auto,width=950,quality=75/v2api/collection/10370001/6069685319630848/image/6492564120141824',
    description:
        'Learn how to build beautiful and responsive mobile apps using Flutter, a modern and powerful framework for mobile app development.',
    level: 'Advanced',
    duration: '9 hours',
    takeawaySkills: [
      'Build beautiful and responsive mobile apps',
      'Learn how to use Flutter',
      'Learn how to use Dart',
      'Learn how to use Supabase',
    ],
    price: '\$0.00',
    courseContent: [
      CourseContent(
        index: 1,
        title: 'Introduction',
        showDetail: false,
        lessons: [
          Lesson(
            title: 'Overview',
            file: 'assets/lessons/install-flutter-and-setup-vscode.md',
          ),
          Lesson(
            title: 'Introduction',
            file: 'assets/lessons/introduction.md',
          ),
          Lesson(
            title: 'Build the UI',
            file: 'assets/lessons/install-flutter-and-setup-vscode.md',
          ),
        ],
      ),
      CourseContent(
        index: 2,
        title: 'Setting up the project',
        showDetail: false,
        lessons: [
          Lesson(
            title: 'Install Flutter and Setup VSCode',
            file: 'assets/lessons/install-flutter-and-setup-vscode.md',
          ),
          Lesson(title: 'Flutter State Management', file: ''),
          Lesson(title: 'Flutter Navigation', file: ''),
        ],
      ),
      CourseContent(
        index: 3,
        title: 'Building the UI',
        showDetail: false,
        lessons: [
          Lesson(title: 'Flutter Animations', file: ''),
          Lesson(title: 'Flutter Testing', file: ''),
          Lesson(title: 'Flutter Deployment', file: ''),
        ],
      ),
      CourseContent(
        index: 4,
        title: 'Implementing the functionality',
        showDetail: false,
        lessons: [
          Lesson(title: 'Flutter Animations', file: ''),
          Lesson(title: 'Flutter Testing', file: ''),
          Lesson(title: 'Flutter Deployment', file: ''),
        ],
      ),
      CourseContent(
        index: 5,
        title: 'Conclusion',
        showDetail: false,
        lessons: [
          Lesson(title: 'Flutter Animations', file: ''),
          Lesson(title: 'Flutter Testing', file: ''),
          Lesson(title: 'Flutter Deployment', file: ''),
        ],
      ),
    ],
    lessons: [
      Lesson(
          title: 'Overview',
          file: 'assets/lessons/introduction.md'),
      Lesson(
          title: 'Install Flutter and Setup VSCode',
          file: 'assets/lessons/install-flutter-and-setup-vscode.md'),
      Lesson(title: 'Flutter Navigation', file: ''),
      Lesson(title: 'Flutter Animations', file: ''),
      Lesson(title: 'Flutter Testing', file: ''),
      Lesson(title: 'Flutter Deployment', file: ''),
    ],
  ),
  Course(
    title: 'Web Development',
    instructor: 'Jane Smith',
    authorImageUrl: 'https://i.pravatar.cc/150?img=2',
    imageUrl:
        'https://www.educative.io/v2api/collection/10370001/5551624074297344/image/5668113229021184',
    description:
        'Learn how to build modern and responsive websites using HTML, CSS, and JavaScript, and popular web development frameworks like React and Angular.',
    level: 'Intermediate',
    duration: '12 hours',
    takeawaySkills: [
      'Build modern and responsive websites',
      'Learn how to use HTML and CSS',
      'Learn how to use JavaScript',
      'Learn how to use React',
    ],
    price: '\$0.00',
    courseContent: [
      CourseContent(
        index: 1,
        title: 'Introduction',
        showDetail: false,
        lessons: [
          Lesson(title: 'What is Web Development?', file: ''),
          Lesson(title: 'Why Web Development?', file: ''),
          Lesson(title: 'Web Development vs Mobile App Development', file: ''),
        ],
      ),
      CourseContent(
        index: 2,
        title: 'Web Development Basics',
        showDetail: false,
        lessons: [
          Lesson(title: 'HTML', file: ''),
          Lesson(title: 'CSS', file: ''),
          Lesson(title: 'JavaScript', file: ''),
        ],
      ),
      CourseContent(
        index: 3,
        title: 'Web Development Advanced',
        showDetail: false,
        lessons: [
          Lesson(title: 'React', file: ''),
          Lesson(title: 'Angular', file: ''),
          Lesson(title: 'Vue', file: ''),
        ],
      ),
    ],
    lessons: [
      Lesson(title: 'What is Web Development?', file: ''),
      Lesson(title: 'Why Web Development?', file: ''),
      Lesson(title: 'Web Development vs Mobile App Development', file: ''),
      Lesson(title: 'HTML', file: ''),
      Lesson(title: 'CSS', file: ''),
      Lesson(title: 'JavaScript', file: ''),
      Lesson(title: 'React', file: ''),
      Lesson(title: 'Angular', file: ''),
      Lesson(title: 'Vue', file: ''),
    ],
  ),
  Course(
    title: 'Mobile App Design',
    instructor: 'Bob Johnson',
    authorImageUrl: 'https://i.pravatar.cc/150?img=3',
    imageUrl:
        'https://www.educative.io/v2api/collection/10370001/6205771374133248/image/4589857022672896',
    description:
        'Learn how to design beautiful and user-friendly mobile apps using Sketch, Figma, and other popular design tools.',
    level: 'Beginner',
    duration: '6 hours',
    takeawaySkills: [
      'Design beautiful and user-friendly mobile apps',
      'Learn how to use Sketch',
      'Learn how to use Figma',
      'Learn how to use Adobe XD',
    ],
    price: '\$0.00',
    courseContent: [
      CourseContent(
        index: 1,
        title: 'Introduction',
        showDetail: false,
        lessons: [
          Lesson(title: 'What is Mobile App Design?', file: ''),
          Lesson(title: 'Why Mobile App Design?', file: ''),
          Lesson(title: 'Mobile App Design vs Web Design', file: ''),
        ],
      ),
      CourseContent(
        index: 2,
        title: 'Mobile App Design Basics',
        showDetail: false,
        lessons: [
          Lesson(title: 'Sketch', file: ''),
          Lesson(title: 'Figma', file: ''),
          Lesson(title: 'Adobe XD', file: ''),
        ],
      ),
      CourseContent(
        index: 3,
        title: 'Mobile App Design Advanced',
        showDetail: false,
        lessons: [
          Lesson(title: 'Prototyping', file: ''),
          Lesson(title: 'Animation', file: ''),
          Lesson(title: 'User Testing', file: ''),
        ],
      ),
    ],
    lessons: [
      Lesson(title: 'What is Mobile App Design?', file: ''),
      Lesson(title: 'Why Mobile App Design?', file: ''),
      Lesson(title: 'Mobile App Design vs Web Design', file: ''),
      Lesson(title: 'Sketch', file: ''),
      Lesson(title: 'Figma', file: ''),
      Lesson(title: 'Adobe XD', file: ''),
      Lesson(title: 'Prototyping', file: ''),
      Lesson(title: 'Animation', file: ''),
      Lesson(title: 'User Testing', file: ''),
    ],
  ),
];

class CourseContent {
  final int index;
  final String title;
  final List<Lesson> lessons;
  bool showDetail;

  CourseContent({
    required this.index,
    required this.title,
    required this.lessons,
    required this.showDetail,
  });
}

class Lesson {
  final String title;
  final String file;

  Lesson({required this.title, required this.file});
}
