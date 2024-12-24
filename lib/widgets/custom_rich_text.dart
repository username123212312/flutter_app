import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    super.key,
    this.preTappableText = '',
    this.tappableText = '',
    this.tappableOnTap,
  });
  final String? preTappableText;
  final String? tappableText;
  final void Function()? tappableOnTap;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(color: Colors.black),
        children: [
          TextSpan(text: preTappableText),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = tappableOnTap,
            text: tappableText,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              decoration: TextDecoration.underline,
            ),
          ),
          TextSpan(text: 'now'),
        ],
      ),
    );
  }
}
