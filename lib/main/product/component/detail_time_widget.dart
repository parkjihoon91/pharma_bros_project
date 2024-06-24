import 'package:flutter/material.dart';

import '../../../common/utils/custom_text_style.dart';

// 식전, 식후, 취침전 String 값에 바뀌는 위젯
class DetailTimeWidget extends StatelessWidget {
  final String detailTime;

  const DetailTimeWidget({
    super.key,
    required this.detailTime,
  });

  @override
  Widget build(BuildContext context) {
    Color color = Colors.black;
    switch (detailTime) {
      case '식전':
        color = const Color(0xff1FAF96);
        break;
      case '식후':
        color = const Color(0xffFFA722);
        break;
      case '취침전':
        color = const Color(0xffFF6683);
        break;
    }

    return Container(
      width: 39,
      height: 22,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(13),
        ),
        border: Border.all(
          color: color,
        ),
        color: color,
      ),
      alignment: Alignment.center,
      child: Text(
        detailTime ?? '',
        style: CustomTextStyle.textStyleBody3
            .copyWith(color: const Color(0xffFFFFFF)),
      ),
    );
  }
}
