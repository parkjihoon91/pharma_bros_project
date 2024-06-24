import 'package:flutter/material.dart';
import 'package:pharma_bros_project/common/utils/custom_text_style.dart';

class ListItemDomestic extends StatelessWidget {
  final bool isDomestic;

  const ListItemDomestic({
    super.key,
    required this.isDomestic,
  });

  // 1FAF96
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 39,
      height: 22,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
        border: Border.all(
          color: isDomestic == true
              ? const Color(0xffFFA722)
              : const Color(0xff1FAF96),
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        isDomestic == true ? '국내' : '해외',
        style: CustomTextStyle.textStyleBody3.copyWith(
            color: isDomestic == true
                ? const Color(0xffFFA722)
                : const Color(0xff1FAF96)),
      ),
    );
  }
}
