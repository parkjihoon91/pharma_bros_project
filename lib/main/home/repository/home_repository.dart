import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharma_bros_project/common/const/data.dart';
import 'package:pharma_bros_project/common/provider/dio_provider.dart';
import 'package:retrofit/retrofit.dart';

import '../model/home_list_item_model.dart';

part 'home_repository.g.dart';

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return HomeRepository(dio, baseUrl:host);
});

@RestApi()
abstract class HomeRepository {
  factory HomeRepository(Dio dio, {String baseUrl}) = _HomeRepository;

  @GET('/search/product')
  Future<HomeListItem> getSearch(
    @Query('target_word') String? targetWord,
    @Query('page') int page,
    @Query('size') int size,
  );
}
