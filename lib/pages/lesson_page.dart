import 'package:educative_app_clone/models/course.dart';
import 'package:educative_app_clone/themes/colors.dart';
import 'package:educative_app_clone/themes/typography.dart';
import 'package:educative_app_clone/widgets/markdown_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class LessonPage extends ConsumerStatefulWidget {
  const LessonPage(this.course, {super.key});
  final Course course;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LessonPageState();
}

class _LessonPageState extends ConsumerState<LessonPage> {
  final PageController _pageController = PageController();

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
  }

  @override
  Widget build(BuildContext context) {
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
                IconButton(
                  padding: const EdgeInsets.only(right: 10),
                  icon: const Icon(Icons.search),
                  color: Colors.grey,
                  onPressed: () {},
                ),
              ],
            ),
          ];
        },
        body: PageView.builder(
          controller: _pageController,
          itemCount: widget.course.lessons.length,
          onPageChanged: (value) {
            print(value);
          },
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return FutureBuilder(
              future: rootBundle.loadString(widget.course.lessons[index].file),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
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
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: GestureDetector(
                                onTap: () {
                                  debugPrint('Link tapped: $uri, $title, $alt');
                                  launchUrl(Uri.parse(alt!));
                                },
                                child: Image.network(
                                  uri.toString(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                          onTapLink: (text, href, title) {
                            debugPrint('Link tapped: $text, $href, $title');
                            launchUrl(Uri.parse(href!));
                          },
                        ),
                        // continue button
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              OutlinedButton(
                                onPressed: () {},
                                onHover: (value) {},
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: MyColors.primary,
                                  side: const BorderSide(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
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
                              OutlinedButton(
                                onPressed: () {
                                  if (index ==
                                      widget.course.lessons.length - 1) {
                                    // go to course page
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
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Next',
                                      style: MyTypography.body.copyWith(
                                        color: MyColors.primary,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    Icon(
                                      Icons.arrow_forward_rounded,
                                      size: 20,
                                      color: MyColors.primary,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
