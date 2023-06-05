import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/lesson.dart';
import 'markdown_style.dart';

class LessonContent extends StatelessWidget {
  const LessonContent({super.key, required this.lesson, required this.child});
  final LessonChild lesson;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: rootBundle.loadString(lesson.content),
      builder: (context, snapshot) {
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
                // Lesson Body with Markdown
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
                      padding: const EdgeInsets.only(bottom: 10, top: 5),
                      child: GestureDetector(
                        onTap: () {
                          debugPrint('Link tapped: $uri, $title, $alt');
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
                //
                child,
              ],
            ),
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
