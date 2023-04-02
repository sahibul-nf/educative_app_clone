import 'package:educative_app_clone/models/course.dart';
import 'package:educative_app_clone/pages/lesson_page.dart';
import 'package:educative_app_clone/themes/colors.dart';
import 'package:educative_app_clone/themes/typography.dart';
import 'package:flutter/material.dart';

class CourseDetailPage extends StatefulWidget {
  final Course course;

  const CourseDetailPage({super.key, required this.course});

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage> {
  bool isExpand = false;

  @override
  Widget build(BuildContext context) {
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
                          buildDetailCourse(
                            Icons.library_books_outlined,
                            "${widget.course.courseContent.length.toString()} Lessons",
                          ),
                          buildDetailCourse(
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
                  Text(
                    widget.course.description,
                    style: MyTypography.body,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Course Contents',
                    style: MyTypography.titleSmall,
                  ),
                  const SizedBox(height: 10),
                  ExpansionPanelList(
                    elevation: 0,
                    expandedHeaderPadding: EdgeInsets.zero,
                    expansionCallback: (panelIndex, isExpanded) {
                      setState(() {
                        widget.course.courseContent[panelIndex].showDetail =
                            !isExpanded;
                      });
                    },
                    children: widget.course.courseContent
                        .map<ExpansionPanel>((CourseContent lesson) {
                      return ExpansionPanel(
                        isExpanded: lesson.showDetail,
                        canTapOnHeader: true,
                        backgroundColor: Colors.transparent,
                        headerBuilder: (context, isExpanded) {
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
                                    lesson.index.toString(),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LessonPage(widget.course),
                      ),
                    );
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

  buildDetailCourse(IconData icon, String text) {
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
}
