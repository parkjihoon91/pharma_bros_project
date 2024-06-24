import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharma_bros_project/common/model/api_default_model.dart';
import 'package:pharma_bros_project/common/utils/log.dart';
import 'package:pharma_bros_project/main/home/repository/home_repository.dart';

final homeProvider =
    StateNotifierProvider<HomeStateNotifier, ApiDefaultModelBase?>((ref) {
  final homeRepository = ref.watch(homeRepositoryProvider);

  return HomeStateNotifier(
    homeRepository: homeRepository,
  );
});

class HomeStateNotifier extends StateNotifier<ApiDefaultModelBase?> {
  final HomeRepository homeRepository;

  HomeStateNotifier({required this.homeRepository}) : super(null) {
    fetch();
  }

  final log = Log();
  Timer? _debounce;

  Future<void> fetch({String? text}) async {
    state = ApiDefaultModelLoading();

    try {
      if (_debounce?.isActive ?? false) _debounce?.cancel();
      _debounce = Timer(const Duration(milliseconds: 1000), () async {
          print('이벤트 횟수, text:$text');
          state = await homeRepository.getSearch(text ?? 'YDY', 1, 10);
          _debounce?.cancel();
      });
    } catch (e, stack) {
      Log().logger.e('testRequest e: $e\nstack: $stack');
      if (e is DioException) {
        if (e.error is SocketException) {
          state = ApiDefaultModelError('통신상태를 확인해주세요.');
        }

        Map error = jsonDecode(e.response.toString());
        if (error.containsKey('message')) {
          String? msg = error['message'];
          if (msg != null) {
            state = ApiDefaultModelError(msg);
          }
        }
      }
      state = ApiDefaultModelError('에러가 발생했습니다.');
    }
  }
}
