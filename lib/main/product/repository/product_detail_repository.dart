import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharma_bros_project/common/const/data.dart';
import 'package:pharma_bros_project/common/provider/dio_provider.dart';
import 'package:retrofit/retrofit.dart';

import '../model/product_detail_model.dart';

part 'product_detail_repository.g.dart';

final productDetailRepositoryProvider = Provider<ProductDetailRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return ProductDetailRepository(dio, baseUrl: host);
});

@RestApi()
abstract class ProductDetailRepository {
  factory ProductDetailRepository(Dio dio, {String baseUrl}) =
      _ProductDetailRepository;

  @GET('/product/detail')
  Future<ProductDetailModel> getProductDetail(
    @Query('product_id') int productId,
  );
}
