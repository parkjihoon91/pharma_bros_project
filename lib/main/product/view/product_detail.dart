import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharma_bros_project/common/component/divider_widget.dart';
import 'package:pharma_bros_project/common/utils/custom_text_style.dart';
import 'package:pharma_bros_project/common/utils/utils.dart';
import 'package:pharma_bros_project/main/home/component/list_item_domestic.dart';
import 'package:pharma_bros_project/main/product/component/detail_titme_widget.dart';
import 'package:pharma_bros_project/main/product/component/row_widget.dart';
import 'package:pharma_bros_project/main/product/model/product_detail_model.dart';
import 'package:pharma_bros_project/main/product/provider/product_detail_provider.dart';

import '../../../common/const/path.dart';

// 피그마 파일에서 divider 기준으로 UI 나눔
class ProductDetail extends ConsumerWidget {
  final int? productId;

  const ProductDetail({
    this.productId,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final arguments = ModalRoute.of(context)?.settings.arguments;
    final state =
        ref.watch(productDetailFutureProvider(int.parse(arguments.toString())));

    return state.when(
      data: (data) {
        final productData = data as ProductDetailModel;
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(54),
            child: AppBar(
              centerTitle: true,
              title: Text(
                '제품 정보',
                style: CustomTextStyle.textStyleHeading3
                    .copyWith(color: const Color(0xff202022)),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(1.0),
                child: Container(
                  color: Colors.grey,
                  height: 1.0,
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Top(productData: productData),
                const DividerWidget(
                  height: 10,
                  thickness: 10,
                ),
                _IntakeMethod(
                  productData: productData.data.intake_method,
                ),
                const DividerWidget(
                  height: 10,
                  thickness: 10,
                ),
                _PerDailyIntakeIngredientContent(
                  productData: productData,
                ),
                const DividerWidget(
                  height: 10,
                  thickness: 10,
                ),
                _NutritionInformation(
                  productData: productData,
                ),
                const DividerWidget(
                  height: 10,
                  thickness: 10,
                ),
                _ProductFeatures(
                  productData: productData,
                ),
                const DividerWidget(
                  height: 10,
                  thickness: 10,
                ),
              ],
            ),
          ),
        );
      },
      error: (err, stack) => Center(
        child: Text(err.toString()),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class _IntakeMethod extends StatelessWidget {
  final List<IntakeMethodItem> productData;

  const _IntakeMethod({
    super.key,
    required this.productData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        children: [
          const RowWidget(text: '섭취 방법'),
          const SizedBox(
            height: 16,
          ),
          productData.isNotEmpty
              ? ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) {
                    String image = '';
                    switch (productData[index].time) {
                      case '아침':
                        image = 'svg_Time-Morning.svg';
                        break;
                      case '점심':
                        image = 'svg_Time-Night.svg';
                        break;
                      case '저녁':
                        image = 'svg_Time-Noon.svg';
                        break;
                    }
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                          color: Color(0xffF4F4F5)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                '$baseImagePath$image',
                                width: 40,
                                height: 40,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                productData[index].time,
                                style: CustomTextStyle.textStyleBody2.copyWith(
                                  color: const Color(0xff202022),
                                ),
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DetailTimeWidget(
                                detailTime: productData[index].detail_time,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                productData[index].intake_unit,
                                style: CustomTextStyle.textStyleBody2.copyWith(
                                  color: const Color(0xff202022),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => const DividerWidget(),
                  itemCount: productData.length,
                )
              : const Text(
                  '섭취방법 내용이 없습니다.',
                )
        ],
      ),
    );
  }
}

class _Top extends StatelessWidget {
  final ProductDetailModel productData;

  const _Top({
    super.key,
    required this.productData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
            border: Border(
              bottom: BorderSide(color: Colors.grey, width: 3),
            ),
            //TODO 그림자
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey.withOpacity(0.7),
            //     spreadRadius: 0,
            //     blurRadius: 5.0,
            //     offset: Offset(0, 10), // changes position of shadow
            //   ),
            // ],
          ),
          child: Column(
            children: [
              Image.network(
                productData.data.product_image_url,
                width: 150,
                height: 150,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                productData.data.product_brand_name,
                style: CustomTextStyle.textStyleBody1
                    .copyWith(color: const Color(0xffA1A2AA)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: RichText(
                      maxLines: 2,
                      text: TextSpan(
                        text: '${productData.data.product_name} ',
                        style: CustomTextStyle.textStyleHeading2.copyWith(
                            color: const Color(0xff202022),
                            overflow: TextOverflow.ellipsis),
                        children: [
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: GestureDetector(
                              onTap: () {
                                Clipboard.setData(
                                    const ClipboardData(text: '물품이름'));
                                Utils.showToast(message: '물품이름이 복사되었습니다');
                              },
                              child: const Icon(
                                Icons.copy,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              const ListItemDomestic(isDomestic: true),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Column(
            children: [
              const RowWidget(text: '섭취 용법'),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 41,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(24),
                                  bottomLeft: Radius.circular(24),
                                ),
                                color: Color(0xffF4F4F5),
                              ),
                              child: Center(
                                child: Text(
                                  '1일',
                                  style: CustomTextStyle.textStyleBody2
                                      .copyWith(color: const Color(0xff202022)),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(24),
                                  bottomRight: Radius.circular(24),
                                ),
                                color: Color(0xffFFE0E6),
                              ),
                              child: Center(
                                child: Text(
                                  productData.data.per_daily_intake_count_text,
                                  style:
                                      CustomTextStyle.textStyleBody2.copyWith(
                                    color: const Color(0xff202022),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 32,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(24),
                                  bottomLeft: Radius.circular(24),
                                ),
                                color: Color(0xffF4F4F5),
                              ),
                              child: const Center(child: Text('1일')),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(24),
                                  bottomRight: Radius.circular(24),
                                ),
                                color: Color(0xffFFE0E6),
                              ),
                              child: Center(
                                  child: Text(productData
                                      .data.per_times_intake_amount_text)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}

class _PerDailyIntakeIngredientContent extends StatelessWidget {
  final ProductDetailModel productData;

  const _PerDailyIntakeIngredientContent({
    super.key,
    required this.productData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 24,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: Color(0xffFF6683)),
          child: Text(
            '1일 섭취량당 함량',
            style: CustomTextStyle.textStyleHeading4
                .copyWith(color: const Color(0xffFFFFFF)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 24,
            horizontal: 16,
          ),
          child: productData.data.per_daily_intake_ingredient_content.isNotEmpty
              ? ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) {
                    return Row(
                      children: [
                        Expanded(
                          child: Text(
                            '성분 ${productData.data.per_daily_intake_ingredient_content[index].ingredient_name}',
                            style: CustomTextStyle.textStyleBody2
                                .copyWith(color: const Color(0xffA1A2AA)),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '함량 ${productData.data.per_daily_intake_ingredient_content[index].content}',
                            style: CustomTextStyle.textStyleBody2
                                .copyWith(color: const Color(0xffFF6683)),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(
                    height: 16,
                  ),
                  itemCount: productData
                      .data.per_daily_intake_ingredient_content.length,
                )
              : const Text(
                  '1일 섭취량당 함량 내용이 없습니다.',
                ),
        ),
      ],
    );
  }
}

class _NutritionInformation extends StatelessWidget {
  final ProductDetailModel productData;

  const _NutritionInformation({super.key, required this.productData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 16,
      ),
      child: Column(
        children: [
          const RowWidget(text: '영양 기능 정보'),
          const SizedBox(
            height: 4,
          ),
          Text(
            '국가별 기능성표기가 상이하여, 해외/국내 건강기능식품의 기능성 표기가 다를 수 있습니다.',
            style: CustomTextStyle.textStyleBody2
                .copyWith(color: const Color(0xffA1A2AA)),
          ),
          const SizedBox(
            height: 16,
          ),
          productData.data.nutrition_information.isNotEmpty
              ? ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 24,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(16),
                        ),
                        border: Border.all(
                            width: 1, color: const Color(0xffD9DADD)),
                      ),
                      child: Column(
                        children: [
                          Text(
                            productData.data.nutrition_information[index]
                                .nutrition_name,
                            style: CustomTextStyle.textStyleHeading3
                                .copyWith(color: const Color(0xff202022)),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            productData
                                .data.nutrition_information[index].description,
                            style: CustomTextStyle.textStyleBody1
                                .copyWith(color: const Color(0xff202022)),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(
                    height: 12,
                  ),
                  itemCount: productData.data.nutrition_information.length,
                )
              : const Text(
                  '영양 기능 정보 내용이 없습니다.',
                ),
        ],
      ),
    );
  }
}

class _ProductFeatures extends StatelessWidget {
  final ProductDetailModel productData;

  const _ProductFeatures({
    super.key,
    required this.productData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const RowWidget(text: '제품 특징'),
          const SizedBox(
            height: 12,
          ),
          productData.data.product_features.isNotEmpty
              ? ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 16,
                      ),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                          color: Color(0xffF4F4F5)),
                      child: Text(
                        productData.data.product_features[index],
                        style: CustomTextStyle.textStyleBody1
                            .copyWith(color: const Color(0xff202022)),
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(
                    height: 12,
                  ),
                  itemCount: productData.data.product_features.length,
                )
              : const Text(
                  '제품 특징 내용이 없습니다.',
                ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
