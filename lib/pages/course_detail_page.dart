import 'package:educative_app_clone/controllers/lesson_controller.dart';
import 'package:educative_app_clone/models/course.dart';
import 'package:educative_app_clone/models/lesson.dart';
import 'package:educative_app_clone/pages/lesson_page.dart';
import 'package:educative_app_clone/themes/colors.dart';
import 'package:educative_app_clone/themes/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:readmore/readmore.dart';
import 'package:shimmer/shimmer.dart';

class CourseDetailPage extends ConsumerStatefulWidget {
  final Course course;

  const CourseDetailPage({super.key, required this.course});

  @override
  ConsumerState<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends ConsumerState<CourseDetailPage> {
  bool isExpand = false;

  @override
  Widget build(BuildContext context) {
    final lessonState = ref.watch(lessonProvider(widget.course.id));

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Stack(
                  children: [
                    Opacity(
                      opacity: 0.5,
                      child: Image.network(
                        widget.course.imageUrl,
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.8),
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black,
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 40,
                  left: 10,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width * 0.1,
                  right: MediaQuery.of(context).size.width * 0.1,
                  bottom: MediaQuery.of(context).size.width * 0.1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      widget.course.imageUrl,
                      width: MediaQuery.of(context).size.width * 0.8,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.course.title,
                    style: MyTypography.title,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        direction: Axis.horizontal,
                        spacing: 20,
                        runSpacing: 10,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              color: MyColors.primary.withOpacity(0.1),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              child: Text(
                                widget.course.level,
                                style: MyTypography.bodySmall.copyWith(
                                  color: MyColors.primary,
                                ),
                              ),
                            ),
                          ),
                          lessonState.when(
                            data: (lessons) => buildLessonDuration(
                              Icons.library_books_outlined,
                              "${lessons.length.toString()} Lessons",
                            ),
                            loading: () => const SizedBox.shrink(),
                            error: (error, stack) => const SizedBox.shrink(),
                          ),
                          buildLessonDuration(
                            Icons.av_timer,
                            widget.course.duration,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Course Overview',
                    style: MyTypography.titleSmall,
                  ),
                  const SizedBox(height: 10),
                  ReadMoreText(
                    widget.course.description,
                    style: MyTypography.body,
                    trimMode: TrimMode.Length,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Show less',
                    colorClickableText: MyColors.primary,
                    trimLength: 180,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Course Contents',
                    style: MyTypography.titleSmall,
                  ),
                  const SizedBox(height: 10),
                  buildCourseContents(lessonState),
                  const SizedBox(height: 30),
                  Text(
                    'Course Author',
                    style: MyTypography.titleSmall,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          widget.course.authorAvatarUrl,
                          width: 50,
                          height: 50,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.course.authorName,
                            style: MyTypography.body,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            widget.course.authorJob,
                            style: MyTypography.bodySmall.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    widget.course.price,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: MyColors.primary,
                        ),
                  ),
                  const Text(' / month'),
                ],
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    lessonState.whenData((value) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LessonPage(
                            course: widget.course,
                          ),
                        ),
                      );
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    minimumSize: const Size(double.infinity, 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: MyColors.primary,
                  ),
                  child: const Text('Start Learning'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildLessonDuration(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 22, color: MyColors.black),
        const SizedBox(width: 5),
        Text(
          text,
          style: MyTypography.bodySmall,
        ),
      ],
    );
  }

  buildCourseContents(AsyncValue<List<Lesson>> lessonState) {
    return lessonState.when(
      data: (lessons) {
        return ExpansionPanelList(
          elevation: 0,
          expandedHeaderPadding: EdgeInsets.zero,
          expansionCallback: (panelIndex, isExpanded) {
            setState(() {
              lessons[panelIndex].showDetail = !isExpanded;
            });
          },
          children: lessons.map<ExpansionPanel>((Lesson lesson) {
            return ExpansionPanel(
              isExpanded: lesson.showDetail,
              canTapOnHeader: true,
              backgroundColor: Colors.transparent,
              headerBuilder: (context, isExpanded) {
                int index = lessons.indexOf(lesson) + 1;

                return ClipRRect(
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        color: MyColors.primary.withOpacity(0.1),
                        height: 25,
                        width: 25,
                        alignment: Alignment.center,
                        child: Text(
                          index.toString(),
                          style: MyTypography.bodySmall.copyWith(
                            color: MyColors.primary,
                          ),
                        ),
                      ),
                    ),
                    minLeadingWidth: 0,
                    title: Text(
                      lesson.title,
                      style: MyTypography.body,
                    ),
                  ),
                );
              },
              body: ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: lesson.lessons.length,
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemBuilder: (context, index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 16,
                        width: 16,
                        margin: const EdgeInsets.only(top: 1),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          lesson.lessons[index].title,
                          style: MyTypography.body,
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          }).toList(),
        );
      },
      loading: () => Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          height: 30,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      error: (error, stackTrace) => const Center(
        child: Text('Error'),
      ),
    );
  }
}
