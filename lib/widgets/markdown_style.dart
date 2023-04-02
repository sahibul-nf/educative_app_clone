import 'package:educative_app_clone/themes/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markdown/markdown.dart' as md;

class CustomElementBuilder extends MarkdownElementBuilder {
  CustomElementBuilder(this.context);
  final BuildContext context;

  @override
  Widget? visitElementAfter(md.Element element, TextStyle? preferredStyle) {
    String text = element.textContent;

    if (element.tag == 'video') {}

    if (element.tag == 'code') {
      String language = '';

      if (element.attributes['class'] != null) {
        String lg = element.attributes['class'] as String;
        language = lg.substring(9);

        return Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          padding: const EdgeInsets.only(top: 5, bottom: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: SyntaxView(
              code: text,
              syntax: Syntax.DART,
              syntaxTheme: SyntaxTheme.ayuDark(),
              fontSize: 14,
              withZoom: false,
              withLinesCount: false,
            ),
          ),
        );
      }
    }

    return null;
  }
}

List<md.InlineSyntax> customInlineSyntaxes = [
  RedSyntax(),
  OrangeSyntax(),
  ModalSyntax(),
  VideoSyntax(),
];

Map<String, MarkdownElementBuilder> markdownBuilders(BuildContext context) {
  return {
    'red': CustomElementBuilder(context),
    'orange': CustomElementBuilder(context),
    'modal': CustomElementBuilder(context),
    'video': CustomElementBuilder(context),
    'code': CustomElementBuilder(context),
  };
}

MarkdownStyleSheet markdownStyleSheet(BuildContext context) {
  return MarkdownStyleSheet(
    p: MyTypography.body,
    a: MyTypography.body.copyWith(
      color: Colors.blue[700],
      decoration: TextDecoration.underline,
    ),
    listBullet: MyTypography.body.copyWith(
      color: Colors.grey[700],
      fontSize: 14,
    ),
    h1: MyTypography.title,
    h2: MyTypography.titleMedium,
    h3: MyTypography.titleSmall,
    h1Padding: const EdgeInsets.only(bottom: 5, top: 5),
    h2Padding: const EdgeInsets.only(bottom: 0, top: 10),
    h3Padding: const EdgeInsets.only(bottom: 0, top: 5),
    codeblockPadding: const EdgeInsets.all(20),
    code: GoogleFonts.firaCode(
      backgroundColor: Colors.grey[200],
      color: Colors.pink[700],
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    codeblockDecoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(5),
    ),
    listIndent: 16,
  );
}

class RedSyntax extends md.InlineSyntax {
  RedSyntax() : super(r'''<red>(.*)</red>''');

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final tag = md.Element.text('red', match[1]!.trim());
    parser.addNode(tag);
    return true;
  }
}

class OrangeSyntax extends md.InlineSyntax {
  OrangeSyntax() : super(r'''<orange>(.*)</orange>''');

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final tag = md.Element.text('orange', match[1]!.trim());
    parser.addNode(tag);
    return true;
  }
}

class ModalSyntax extends md.InlineSyntax {
  ModalSyntax() : super(r'''<modal>(.*)</modal>''');

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final tag = md.Element.text('modal', match[1]!.trim());
    parser.addNode(tag);
    return true;
  }
}

class VideoSyntax extends md.InlineSyntax {
  VideoSyntax() : super(r'''<video>(.*)</video>''');

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final tag = md.Element.text('video', match[1]!.trim());
    parser.addNode(tag);
    return true;
  }
}
