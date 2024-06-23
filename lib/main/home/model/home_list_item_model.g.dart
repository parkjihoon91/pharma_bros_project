// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_list_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeListItem _$HomeListItemFromJson(Map<String, dynamic> json) => HomeListItem(
      HomeListItemModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HomeListItemToJson(HomeListItem instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

HomeListItemModel _$HomeListItemModelFromJson(Map<String, dynamic> json) =>
    HomeListItemModel(
      product_list: (json['product_list'] as List<dynamic>)
          .map((e) => HomeListItemModelData.fromJson(e as Map<String, dynamic>))
          .toList(),
      total_count: (json['total_count'] as num).toInt(),
    );

Map<String, dynamic> _$HomeListItemModelToJson(HomeListItemModel instance) =>
    <String, dynamic>{
      'product_list': instance.product_list,
      'total_count': instance.total_count,
    };

HomeListItemModelData _$HomeListItemModelDataFromJson(
        Map<String, dynamic> json) =>
    HomeListItemModelData(
      id: (json['id'] as num).toInt(),
      brand_name: json['brand_name'] as String,
      name: json['name'] as String,
      image_url: json['image_url'] as String,
      is_purchase_available: json['is_purchase_available'] as bool,
      is_sold_out: json['is_sold_out'] as bool,
      discount_product_percent:
          (json['discount_product_percent'] as num).toInt(),
      buy_shop_link: json['buy_shop_link'] as String,
      is_domestic: json['is_domestic'] as bool,
      pick_type: json['pick_type'] as String,
    );

Map<String, dynamic> _$HomeListItemModelDataToJson(
        HomeListItemModelData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'brand_name': instance.brand_name,
      'name': instance.name,
      'image_url': instance.image_url,
      'is_purchase_available': instance.is_purchase_available,
      'is_sold_out': instance.is_sold_out,
      'discount_product_percent': instance.discount_product_percent,
      'buy_shop_link': instance.buy_shop_link,
      'is_domestic': instance.is_domestic,
      'pick_type': instance.pick_type,
    };
