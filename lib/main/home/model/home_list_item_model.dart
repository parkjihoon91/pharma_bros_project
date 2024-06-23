
import 'package:json_annotation/json_annotation.dart';

import '../../../common/model/api_default_model.dart';

part 'home_list_item_model.g.dart';

@JsonSerializable()
class HomeListItem extends ApiDefaultModelBase {
  final HomeListItemModel data;

  HomeListItem(this.data);
  
  factory HomeListItem.fromJson(Map<String, dynamic> json) {
      return _$HomeListItemFromJson(json);
    }
  
  Map<String, dynamic> toJson() => _$HomeListItemToJson(this);
}

@JsonSerializable()
class HomeListItemModel extends ApiDefaultModelBase {
  final List<HomeListItemModelData> product_list;
  final int total_count;

  HomeListItemModel({
    required this.product_list,
    required this.total_count,
  });

  factory HomeListItemModel.fromJson(Map<String, dynamic> json) {
      return _$HomeListItemModelFromJson(json);
    }

  Map<String, dynamic> toJson() => _$HomeListItemModelToJson(this);
}
// 35156
@JsonSerializable()
class HomeListItemModelData {
  int id;
  String brand_name;
  String name;
  String image_url;
  bool is_purchase_available;
  bool is_sold_out;
  int discount_product_percent;
  String buy_shop_link;
  bool is_domestic;
  String pick_type;

  HomeListItemModelData({
    required this.id,
    required this.brand_name,
    required this.name,
    required this.image_url,
    required this.is_purchase_available,
    required this.is_sold_out,
    required this.discount_product_percent,
    required this.buy_shop_link,
    required this.is_domestic,
    required this.pick_type,
  });

  factory HomeListItemModelData.fromJson(Map<String, dynamic> json) {
      return _$HomeListItemModelDataFromJson(json);
    }

  Map<String, dynamic> toJson() => _$HomeListItemModelDataToJson(this);

}
