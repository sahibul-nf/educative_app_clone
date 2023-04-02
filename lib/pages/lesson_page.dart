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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // create sliver app bar
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
          // create sliver list
          SliverList(
            delegate: SliverChildListDelegate(
              [
                FutureBuilder(
                  future: rootBundle.loadString(
                      widget.course.courseContent.first.lessons.first.file),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          bottom: 40,
                          left: 20,
                          right: 20,
                          top: 30,
                        ),
                        child: MarkdownBody(
                          softLineBreak: true,
                          fitContent: true,
                          shrinkWrap: true,
                          selectable: true,
                          data: snapshot.data.toString(),
                          styleSheet: markdownStyleSheet(context),
                          builders: markdownBuilders(context),
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
                      );
                    }

                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
