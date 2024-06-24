import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/const/path.dart';
import '../../../common/utils/custom_text_style.dart';

// 이미지 - 글씨 향테 위젯
class RowWidget extends StatelessWidget {
  final String text;

  const RowWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          '${baseImagePath}svg_Icon-pill.svg',
          width: 24,
          height: 24,
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          text,
          style: CustomTextStyle.textStyleHeading3
              .copyWith(color: const Color(0xff202222)),
        )
      ],
    );
  }
}
