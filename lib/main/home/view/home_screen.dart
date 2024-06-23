import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharma_bros_project/common/component/divider_widget.dart';
import 'package:pharma_bros_project/common/const/path.dart';
import 'package:pharma_bros_project/common/utils/custom_text_style.dart';
import 'package:pharma_bros_project/main/home/model/home_list_item_model.dart';
import 'package:pharma_bros_project/main/home/provider/home_provider.dart';

import '../../../common/model/api_default_model.dart';
import '../component/home_list_item_widget.dart';

final List<HomeListItemModelData> testData = [
  HomeListItemModelData(
      id: 34910,
      brand_name: "YDY뉴트리션",
      name: "YDY 퓨어리포좀 글루타치온 5g x 30포",
      image_url:
          "https://d1r0f51o4pfsh8.cloudfront.net/crwal_product/image/34910.jpeg",
      is_purchase_available: true,
      is_sold_out: false,
      discount_product_percent: 5,
      buy_shop_link: "https://store.kakao.com/befpharm/products/373357358",
      is_domestic: true,
      pick_type: ""),
];

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 54,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 8,
              ),
              child: SizedBox(
                height: 38,
                child: TextField(
                  onChanged: (text) {
                    ref.read(homeProvider.notifier).fetch(text: text);
                  },
                  controller: _textEditingController,
                  style: CustomTextStyle.textStyleBody1,
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  textInputAction: TextInputAction.search,
                  onSubmitted: onSubmitted,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 5)
                        .add(const EdgeInsets.only(left: 8)),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(color: Color(0xffF4F4F5)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: Color(0xffF4F4F5))),
                    border: InputBorder.none,
                    fillColor: const Color(0xffF4F4F4),
                    filled: true,
                    suffixIcon: IconButton(
                      onPressed: onPressedIconBtn,
                      icon: const Icon(
                        Icons.cancel,
                        color: Colors.grey,
                        size: 16,
                      ),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Consumer(
              builder: (_, ref, child) {

                // return Expanded(
                //   child: ListView.separated(
                //     itemBuilder: (_, index) {
                //       return HomeListItemWidget(data: testData[0]);
                //       //TODO 주석풀기
                //       // data: data.data.product_list[index]);
                //     },
                //     separatorBuilder: (_, index) => const DividerWidget(),
                //     itemCount: 10,
                //   ),
                // );

                //TODO 주석풀기
                final state = ref.watch(homeProvider);

                if (state == null) {
                  ref.read(homeProvider.notifier).fetch();
                }

                if (state is ApiDefaultModelLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is ApiDefaultModelError) {
                  return Center(
                    child: Text(state.message),
                  );
                }

                final data = state as HomeListItem;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DividerWidget(),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      // TODO 주석
                      // child: Text('검색 결과 11건'),
                      child: Text('검색 결과 ${data.data.total_count}건'),
                    ),
                    const DividerWidget(),
                    if (state.data.total_count <= 0) ...[
                      Expanded(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                '${baseImagePath}png_pill_4x.png',
                                width: 100,
                                height: 100,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                '검색 결과가 없어요',
                                style: CustomTextStyle.textStyleBody1
                                    .copyWith(color: const Color(0xffA1A2AA)),
                              )
                            ],
                          ),
                        ),
                      ),
                    ] else ...[
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (_, index) {
                            // return HomeListItemWidget(data: testData[0]);
                            //TODO 주석풀기
                            return HomeListItemWidget(data: data.data.product_list[index]);

                          },
                          separatorBuilder: (_, index) => const DividerWidget(),
                          itemCount: 10,
                        ),
                      ),
                    ]
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void onPressedIconBtn() {
    setState(() {
      _textEditingController.text = '';
    });
  }

  void onSubmitted(text) {
    ref.read(homeProvider.notifier).fetch(text: text);
  }
}
