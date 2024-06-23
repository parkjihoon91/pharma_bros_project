import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  final double height;

  const DividerWidget({
    this.height = 1,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height,
    );
  }
}
