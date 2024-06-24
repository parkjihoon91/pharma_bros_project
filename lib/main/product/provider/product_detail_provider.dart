import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharma_bros_project/main/product/repository/product_detail_repository.dart';

import '../../../common/model/api_default_model.dart';

final productDetailFutureProvider =
    FutureProvider.family<ApiDefaultModelBase?, int?>((ref, data) async {
  return fetch(ref, data);
});

Future<ApiDefaultModelBase?> fetch(
  FutureProviderRef ref,
  int? data,
) async {
  final repo = ref.watch(productDetailRepositoryProvider);
  return await repo.getProductDetail(data ?? 1);
}
