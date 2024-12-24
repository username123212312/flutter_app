import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    super.key,
    this.imagePath,
  });
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 30, 20, 20),
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(140),
      ),
      padding: EdgeInsets.all(20),
      child: imagePath == null
          ? Placeholder(
              color: Theme.of(context).colorScheme.error,
            )
          : Image.asset(
              'assets/images/chat.png',
            ),
    );
  }
}
