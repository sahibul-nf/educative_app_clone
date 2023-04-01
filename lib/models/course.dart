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
  final Map<String, List<String>> courseContent;

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
    required this.authorImageUrl,
  });
}

final List<Course> courses = [
  Course(
    title: 'Flutter Development',
    instructor: 'John Doe',
    authorImageUrl: 'https://i.pravatar.cc/150?img=1',
    imageUrl:
        'https://www.educative.io/cdn-cgi/image/format=auto,width=950,quality=75/v2api/collection/10370001/6069685319630848/image/6492564120141824',
    description:
        'Learn how to build beautiful and responsive mobile apps using Flutter, a modern and powerful framework for mobile app development.',
    level: 'Advanced',
    duration: '9 hours',
    takeawaySkills: [
      'Build beautiful and responsive mobile apps',
      'Learn how to use Flutter widgets',
      'Learn how to use Flutter state management',
      'Learn how to use Flutter navigation',
    ],
    price: 'Free',
    courseContent: {
      'Introduction': [
        'What is Flutter?',
        'Why Flutter?',
        'Flutter vs React Native',
        'Flutter vs Native',
      ],
      'Flutter Basics': [
        'Flutter Setup',
        'Flutter Widgets',
        'Flutter State Management',
        'Flutter Navigation',
      ],
      'Flutter Advanced': [
        'Flutter Animations',
        'Flutter Testing',
        'Flutter Deployment',
      ],
    },
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
    price: 'Free',
    courseContent: {
      'Introduction': [
        'What is Web Development?',
        'Why Web Development?',
        'Web Development vs Mobile Development',
      ],
      'Web Development Basics': [
        'HTML',
        'CSS',
        'JavaScript',
        'React',
      ],
      'Web Development Advanced': [
        'React Hooks',
        'React Testing',
        'React Deployment',
      ],
    },
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
    price: 'Free',
    courseContent: {
      'Introduction': [
        'What is Mobile App Design?',
        'Why Mobile App Design?',
        'Mobile App Design vs Web Design',
      ],
      'Mobile App Design Basics': [
        'Sketch',
        'Figma',
        'Adobe XD',
      ],
      'Mobile App Design Advanced': [
        'Designing for iOS',
        'Designing for Android',
        'Designing for Web',
      ],
    },
  ),
];
