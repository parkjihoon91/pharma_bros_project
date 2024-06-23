import 'package:flutter/material.dart';
import 'package:pharma_bros_project/common/utils/custom_text_style.dart';
import 'package:pharma_bros_project/main/home/component/list_item_domestic.dart';
import 'package:pharma_bros_project/main/home/model/home_list_item_model.dart';

class HomeListItemWidget extends StatelessWidget {
  final HomeListItemModelData data;

  const HomeListItemWidget({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final domesticWidget = data.is_domestic == true
        ? const ListItemDomestic(
            text: '국내',
          )
        : const ListItemDomestic(
            text: '해외',
          );

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
            child: Image.network(
              data.image_url,
              width: 90,
              height: 90,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.brand_name,
                  style: CustomTextStyle.textStyleBody2.copyWith(
                    color: const Color(0xffA1A2AA),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  data.name,
                  style: CustomTextStyle.textStyleBody1.copyWith(
                    color: const Color(0xff202022),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 4,
                ),
                domesticWidget,
              ],
            ),
          )
        ],
      ),
    );
  }
}
