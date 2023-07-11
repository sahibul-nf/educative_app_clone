import 'package:any_link_preview/any_link_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:url_launcher/url_launcher.dart';

import '../themes/typography.dart';

class CustomElementBuilder extends MarkdownElementBuilder {
  CustomElementBuilder(this.context);
  final BuildContext context;

  @override
  Widget? visitElementAfter(md.Element element, TextStyle? preferredStyle) {
    String text = element.textContent;

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

    // iframe
    if (element.tag == 'embed') {
      return Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: HtmlWidget(
            '<iframe src="$text"></iframe>',
            customStylesBuilder: (element) {
              if (element.classes.contains('name')) {
                return {'color': 'red'};
              }
              return null;
            },
            onErrorBuilder: (context, element, error) =>
                Text('$element error: $error'),
            onLoadingBuilder: (context, element, loadingProgress) =>
                const CircularProgressIndicator(),
            onTapUrl: (url) => launchUrl(Uri.parse(url)),
            renderMode: RenderMode.column,
            buildAsync: true,
            textStyle: const TextStyle(fontSize: 14),
            enableCaching: true,
          ),
        ),
      );
    }

    // link
    if (element.tag == 'link-preview') {
      return Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 10),
        child: AnyLinkPreview(
          link: text,
          borderRadius: 10,
          errorBody: 'Oops! Something went wrong.',
          errorTitle: 'Error',
          removeElevation: true,
          titleStyle: MyTypography.body,
          bodyStyle: MyTypography.bodySmall.copyWith(
            color: Colors.grey,
          ),
          cache: const Duration(days: 1),
          backgroundColor: Colors.white,
          placeholderWidget: Container(
            height: 100,
            width: 100,
            color: Colors.grey[200],
          ),
          errorWidget: Container(
            height: 100,
            width: 100,
            color: Colors.grey[200],
          ),
        ),
      );
    }

    return null;
  }
}

Map<String, MarkdownElementBuilder> markdownBuilders(BuildContext context) {
  return {
    'code': CustomElementBuilder(context),
    'embed': CustomElementBuilder(context),
    'link-preview': CustomElementBuilder(context),
  };
}

List<md.InlineSyntax> markdownInlineSyntaxes = [
  EmbedSyntax(),
  LinksPreview(),
];

MarkdownStyleSheet markdownStyleSheet(BuildContext context) {
  return MarkdownStyleSheet(
    p: MyTypography.body,
    a: MyTypography.body.copyWith(
      color: Colors.blue[700],
      decoration: TextDecoration.underline,
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
    listBullet: MyTypography.body.copyWith(
      color: Colors.grey[700],
      fontSize: 14,
    ),
    listIndent: 16,
  );
}

class EmbedSyntax extends md.InlineSyntax {
  EmbedSyntax() : super(r'''<embed>(.*)</embed>''');

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final tag = md.Element.text('embed', match[1]!.trim());
    parser.addNode(tag);
    return true;
  }
}

class LinksPreview extends md.InlineSyntax {
  LinksPreview() : super(r'''<link-preview>(.*)</link-preview>''');

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final tag = md.Element.text('link-preview', match[1]!.trim());
    parser.addNode(tag);
    return true;
  }
}
