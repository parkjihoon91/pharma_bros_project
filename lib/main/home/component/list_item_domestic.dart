import 'package:flutter/material.dart';
import 'package:pharma_bros_project/common/utils/custom_text_style.dart';

class ListItemDomestic extends StatelessWidget {
  final String text;

  const ListItemDomestic({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 39,
      height: 22,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
        border: Border.all(color: const Color(0xffFFA722))
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: CustomTextStyle.textStyleBody3
            .copyWith(color: const Color(0xffFFA722)),
      ),
    );
  }
}
