import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  final double height;
  final double thickness;

  const DividerWidget({
    this.height = 1,
    this.thickness = 1,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height,
      thickness: thickness,
    );
  }
}
