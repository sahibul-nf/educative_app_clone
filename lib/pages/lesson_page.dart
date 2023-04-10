import 'package:educative_app_clone/controllers/lesson_controller.dart';
import 'package:educative_app_clone/models/course.dart';
import 'package:educative_app_clone/pages/course_finish_page.dart';
import 'package:educative_app_clone/themes/colors.dart';
import 'package:educative_app_clone/themes/typography.dart';
import 'package:educative_app_clone/widgets/lesson_loading.dart';
import 'package:educative_app_clone/widgets/markdown_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class LessonPage extends ConsumerStatefulWidget {
  const LessonPage({super.key, required this.course});
  final Course course;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LessonPageState();
}

class _LessonPageState extends ConsumerState<LessonPage> {
  late PageController _pageController;

  void nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void previousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    final allLessonState = ref.watch(lessonChildProvider(widget.course.id));

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              foregroundColor: MyColors.black,
              backgroundColor: Colors.white,
              centerTitle: false,
              pinned: true,
              title: Text(
                widget.course.title,
                style: MyTypography.titleSmall,
                overflow: TextOverflow.ellipsis,
              ),
              actions: [
                allLessonState.when(
                  data: (lessons) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Center(
                        child: Text(
                          '$currentPage / ${lessons.length}',
                          style: MyTypography.bodySmall,
                        ),
                      ),
                    );
                  },
                  loading: () {
                    return UnconstrainedBox(
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          width: 50,
                          height: 20,
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    );
                  },
                  error: (error, stack) {
                    return const SizedBox();
                  },
                ),
              ],
            ),
          ];
        },
        body: allLessonState.when(
          data: (lessons) {
            return PageView.builder(
              controller: _pageController,
              itemCount: lessons.length,
              onPageChanged: (value) {
                setState(() {
                  currentPage = value + 1;
                });
              },
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                // final lesson = [
                //   'assets/lessons/setting-up-supabase.md',
                //   'assets/lessons/introduction.md',
                //   'assets/lessons/install-flutter-and-setup-vscode.md'
                // ];
                return FutureBuilder(
                  // future: rootBundle.loadString(lesson[index]),
                  future: NetworkAssetBundle(Uri.parse(lessons[index].content))
                      .loadString(''),
                  builder: (context, snapshot) {
                    bool isLastPage = index == lessons.length - 1;

                    if (snapshot.hasData) {
                      return SingleChildScrollView(
                        controller: ScrollController(),
                        padding: const EdgeInsets.only(
                          bottom: 40,
                          left: 20,
                          right: 20,
                          top: 30,
                        ),
                        child: Column(
                          children: [
                            MarkdownBody(
                              softLineBreak: true,
                              fitContent: true,
                              shrinkWrap: true,
                              selectable: true,
                              data: snapshot.data.toString(),
                              styleSheet: markdownStyleSheet(context),
                              builders: markdownBuilders(context),
                              inlineSyntaxes: markdownInlineSyntaxes,
                              imageBuilder: (uri, title, alt) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.only(bottom: 10, top: 5),
                                  child: GestureDetector(
                                    onTap: () {
                                      debugPrint(
                                          'Link tapped: $uri, $title, $alt');
                                      launchUrl(Uri.parse(alt!));
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.network(
                                        uri.toString(),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              onTapLink: (text, href, title) {
                                debugPrint('Link tapped: $text, $href, $title');
                                launchUrl(Uri.parse(href!));
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 40),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      if (index == 0) const Spacer(),
                                      if (index != 0)
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            OutlinedButton(
                                              onPressed: () {
                                                previousPage();
                                              },
                                              onHover: (value) {},
                                              style: OutlinedButton.styleFrom(
                                                foregroundColor:
                                                    MyColors.primary,
                                                side: const BorderSide(
                                                  color: Colors.grey,
                                                  width: 1,
                                                ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Icon(
                                                    Icons.arrow_back_rounded,
                                                    size: 20,
                                                    color: MyColors.black,
                                                  ),
                                                  const SizedBox(width: 5),
                                                  Text(
                                                    'Back',
                                                    style: MyTypography.body,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              child: Text(
                                                lessons[index - 1].title,
                                                style: MyTypography.bodySmall,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          OutlinedButton(
                                            onPressed: () {
                                              if (isLastPage) {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const CourseFinishPage(),
                                                  ),
                                                );
                                              } else {
                                                nextPage();
                                              }
                                            },
                                            onHover: (value) {},
                                            style: OutlinedButton.styleFrom(
                                              foregroundColor: MyColors.primary,
                                              side: BorderSide(
                                                color: MyColors.primary,
                                                width: 1,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  isLastPage
                                                      ? 'Finished'
                                                      : 'Next',
                                                  style: MyTypography.body
                                                      .copyWith(
                                                    color: MyColors.primary,
                                                  ),
                                                ),
                                                if (!isLastPage)
                                                  const SizedBox(width: 5),
                                                if (!isLastPage)
                                                  Icon(
                                                    Icons.arrow_forward_rounded,
                                                    size: 20,
                                                    color: MyColors.primary,
                                                  ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            child: Text(
                                              isLastPage
                                                  ? ''
                                                  : lessons[index + 1].title,
                                              style: MyTypography.bodySmall,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  CheckboxListTile(
                                    onChanged: (v) {
                                      setState(() {
                                        lessons[index].isCompleted = v;
                                      });
                                    },
                                    value: lessons[index].isCompleted,
                                    tileColor: Colors.grey[100],
                                    activeColor:
                                        MyColors.primary.withOpacity(0.8),
                                    dense: true,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    checkboxShape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    title: Text(
                                      'Mark as complete',
                                      style: MyTypography.body,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    return const LessonLoading();
                  },
                );
              },
            );
          },
          loading: () => const LessonLoading(),
          error: (error, stack) => Center(
            child: Text(error.toString()),
          ),
        ),
      ),
    );
  }
}
