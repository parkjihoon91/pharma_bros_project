import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma_bros_project/common/const/path.dart';
import 'package:pharma_bros_project/common/utils/custom_text_style.dart';

// 내정보화면 아이콘 - text - 아이콘 형태의 위젯
class MyInfoWidget extends StatelessWidget {
  final String image;
  final String text;

  const MyInfoWidget({
    super.key,
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 72,
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 16,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        color: Color(
          0xffF4F4F5,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            '$baseImagePath$image',
            width: 40,
            height: 40,
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Text(
              text,
              style: CustomTextStyle.textStyleBody2
                  .copyWith(color: const Color(0xff202022)),
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 20,
          )
        ],
      ),
    );
  }
}
