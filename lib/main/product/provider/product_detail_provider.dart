import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharma_bros_project/main/product/repository/product_detail_repository.dart';

import '../../../common/model/api_default_model.dart';

// final productDetailFutureProvider =
//     FutureProvider.family<String, String>((ref, arguments) async {
//   final repo = ref.watch(productDetailRepositoryProvider);
//   return await repo.getProductDetail(35028);
// });

// Provider 정의
final productDetailFutureProvider = FutureProvider.family<ApiDefaultModelBase?, int?>((ref, data) async {
  return fetchData(ref, data);
});

// 예시 API 호출 함수
Future<ApiDefaultModelBase?> fetchData(FutureProviderRef ref, int? data,) async {
  final repo = ref.watch(productDetailRepositoryProvider);
  return await repo.getProductDetail(data ?? 1);
}
//
// final productDetailProvider =
//     StateNotifierProvider<ProductDetailStateNotifier, ApiDefaultModelBase?>(
//         (ref) {
//   final productDetailRepository = ref.watch(productDetailRepositoryProvider);
//
//   return ProductDetailStateNotifier(
//     productDetailRepository: productDetailRepository,
//   );
// });
//
// class ProductDetailStateNotifier extends StateNotifier<ApiDefaultModelBase?> {
//   final ProductDetailRepository productDetailRepository;
//
//   ProductDetailStateNotifier({required this.productDetailRepository})
//       : super(null);
//
//   final log = Log();
//
//   Future<void> fetch({required int productId}) async {
//     state = ApiDefaultModelLoading();
//
//     try {
//       state = await productDetailRepository.getProductDetail(productId);
//     } catch (e, stack) {
//       Log().logger.e('testRequest e: $e\nstack: $stack');
//       if (e is DioException) {
//         if (e.error is SocketException) {
//           state = ApiDefaultModelError('통신상태를 확인해주세요.');
//         }
//
//         Map error = jsonDecode(e.response.toString());
//         if (error.containsKey('message')) {
//           String? msg = error['message'];
//           if (msg != null) {
//             state = ApiDefaultModelError(msg);
//           }
//         }
//       }
//       state = ApiDefaultModelError('에러가 발생했습니다.');
//     }
//   }
// }
