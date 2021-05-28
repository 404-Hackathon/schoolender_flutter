import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class AdaptiveText extends StatelessWidget {
  const AdaptiveText(this.text,
      {Key? key, this.style, this.textAlign, this.maxLines})
      : super(key: key);

  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return !kIsWeb
        ? Text(
            text,
            style: style,
            textAlign: textAlign,
            maxLines: maxLines,
          )
        : SelectableText(
            text,
            style: style,
            textAlign: textAlign,
            maxLines: maxLines,
          );
  }
}
