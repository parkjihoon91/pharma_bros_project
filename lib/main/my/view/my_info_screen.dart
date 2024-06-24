import 'package:flutter/material.dart';
import 'package:pharma_bros_project/common/component/divider_widget.dart';
import 'package:pharma_bros_project/common/utils/custom_text_style.dart';
import 'package:pharma_bros_project/main/product/component/my_info_widget.dart';

// 피그마 파일에서 divider 기준으로 UI 나눔
class MyInfoScreen extends StatefulWidget {
  const MyInfoScreen({super.key});

  @override
  State<MyInfoScreen> createState() => _MyInfoScreenState();
}

class _MyInfoScreenState extends State<MyInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PreferredSize(
            preferredSize: const Size.fromHeight(54),
            child: AppBar(
              centerTitle: false,
              title: Text(
                '내 정보',
                style: CustomTextStyle.textStyleHeading3.copyWith(
                  color: const Color(
                    0xff202022,
                  ),
                ),
              ),
              shape: const Border(
                bottom: BorderSide(
                  color: Color(0xffECECEE),
                  width: 1,
                ),
              ),
            ),
          ),
          const _NameEmail(),
          const DividerWidget(
            height: 10,
            thickness: 10,
          ),
          const _ConsultationRecodes(),
          const DividerWidget(
            height: 10,
            thickness: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: InkWell(
              onTap: () {},
              child: const MyInfoWidget(
                image: 'svg_alarm.svg',
                text: '섭취 알림 설정하기',
              ),
            ),
          ),
          const DividerWidget(
            height: 10,
            thickness: 10,
          ),
          const _MyParticipation(),
          const DividerWidget(
            height: 10,
            thickness: 10,
          ),
          _Bottom(),
        ],
      ),
    );
  }
}

class _NameEmail extends StatelessWidget {
  const _NameEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '박지훈',
                  style: CustomTextStyle.textStyleHeading3
                      .copyWith(color: const Color(0xff202022)),
                ),
                Text(
                  '2dnjf10@gmail.com',
                  style: CustomTextStyle.textStyleBody2
                      .copyWith(color: const Color(0xffA1A2AA)),
                ),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 24,
            )
          ],
        ),
      ),
    );
  }
}

class _ConsultationRecodes extends StatelessWidget {
  const _ConsultationRecodes({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '상담 기록',
            style: CustomTextStyle.textStyleHeading3
                .copyWith(color: const Color(0xff202022)),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            '지금까지 상담 기록을 모두 볼 수 있어요',
            style: CustomTextStyle.textStyleBody2
                .copyWith(color: const Color(0xffA1A2AA)),
          ),
          const SizedBox(
            height: 24,
          ),
          const Row(
            children: [
              _ConsultationRecodesContainer(text: '나의 상담'),
              SizedBox(
                width: 24,
              ),
              _ConsultationRecodesContainer(text: '관심 상담'),
            ],
          )
        ],
      ),
    );
  }
}

class _MyParticipation extends StatelessWidget {
  const _MyParticipation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '나의 참여',
            style: CustomTextStyle.textStyleHeading3
                .copyWith(color: const Color(0xff202022)),
          ),
          const SizedBox(
            height: 16,
          ),
          InkWell(
            onTap: () {},
            child: const MyInfoWidget(
              image: 'svg_announce.svg',
              text: '친한 이벤트 활동 내역',
            ),
          )
        ],
      ),
    );
  }
}

class _Bottom extends StatelessWidget {
  const _Bottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InkWell(
                onTap: () {},
                child: const _BottomTextWidget(text: '공지사항'),
              ),
              InkWell(
                onTap: () {},
                child: const _BottomTextWidget(text: '문의/제보하기'),
              ),
              InkWell(
                onTap: () {},
                child: const _BottomTextWidget(text: '친한약사 앱 칭찬하기'),
              ),
            ],
          ),
        ),
        Container(
          color: const Color(0xffF4F4F5),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24,
              horizontal: 16,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => Navigator.of(context)
                          .pushNamed('/webview', arguments: '이용약관'),
                      child: Text(
                        '이용약관',
                        style: CustomTextStyle.textStyleBody2
                            .copyWith(color: const Color(0xff808288)),
                      ),
                    ),
                    Text(
                      '·',
                      style: CustomTextStyle.textStyleBody2
                          .copyWith(color: const Color(0xff808288)),
                    ),
                    InkWell(
                      onTap: () => Navigator.of(context)
                          .pushNamed('/webview', arguments: '개인정보처리방침'),
                      child: Text(
                        '개인정보처리방침',
                        style: CustomTextStyle.textStyleBody2
                            .copyWith(color: const Color(0xff808288)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    '버전 정보 v0.0.0',
                    style: CustomTextStyle.textStyleBody3
                        .copyWith(color: const Color(0xff808288)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _BottomTextWidget extends StatelessWidget {
  final String text;

  const _BottomTextWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        text,
        style: CustomTextStyle.textStyleBody1.copyWith(
          color: const Color(
            0xff202022,
          ),
        ),
      ),
    );
  }
}

class _ConsultationRecodesContainer extends StatelessWidget {
  final String text;

  const _ConsultationRecodesContainer({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {},
        child: Container(
          alignment: Alignment.center,
          height: 72,
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            color: Color(
              0xffF4F4F5,
            ),
          ),
          child: Text(
            text,
            style: CustomTextStyle.textStyleBody1.copyWith(
              color: const Color(
                0xff202022,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
