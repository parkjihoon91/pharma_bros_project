// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailModel _$ProductDetailModelFromJson(Map<String, dynamic> json) =>
    ProductDetailModel(
      ProductDetailModelItem.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductDetailModelToJson(ProductDetailModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

ProductDetailModelItem _$ProductDetailModelItemFromJson(
        Map<String, dynamic> json) =>
    ProductDetailModelItem(
      (json['id'] as num).toInt(),
      json['product_image_url'] as String,
      json['product_brand_name'] as String,
      json['product_name'] as String,
      json['is_domestic'] as bool,
      json['is_show_recommend_type'] as bool,
      json['recommend_type_name'] as String,
      json['recommend_type_name_color'] as String,
      json['recommend_content'] as String,
      json['is_show_purchase_section'] as bool,
      json['is_sold_out'] as bool,
      json['is_purchase_available'] as bool,
      json['origin_product_price'] as String,
      (json['discount_product_percent'] as num).toInt(),
      json['discount_product_price'] as String,
      json['product_sales_url'] as String,
      json['per_daily_intake_count_text'] as String,
      json['per_times_intake_amount_text'] as String,
      (json['intake_method'] as List<dynamic>)
          .map((e) => IntakeMethodItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['per_daily_intake_ingredient_content'] as List<dynamic>)
          .map((e) => PerDailyIntakeIngredientContent.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      json['ingredients_content'] as String,
      (json['nutrition_information'] as List<dynamic>)
          .map((e) => NutritionInformation.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['product_features'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ProductDetailModelItemToJson(
        ProductDetailModelItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_image_url': instance.product_image_url,
      'product_brand_name': instance.product_brand_name,
      'product_name': instance.product_name,
      'is_domestic': instance.is_domestic,
      'is_show_recommend_type': instance.is_show_recommend_type,
      'recommend_type_name': instance.recommend_type_name,
      'recommend_type_name_color': instance.recommend_type_name_color,
      'recommend_content': instance.recommend_content,
      'is_show_purchase_section': instance.is_show_purchase_section,
      'is_sold_out': instance.is_sold_out,
      'is_purchase_available': instance.is_purchase_available,
      'origin_product_price': instance.origin_product_price,
      'discount_product_percent': instance.discount_product_percent,
      'discount_product_price': instance.discount_product_price,
      'product_sales_url': instance.product_sales_url,
      'per_daily_intake_count_text': instance.per_daily_intake_count_text,
      'per_times_intake_amount_text': instance.per_times_intake_amount_text,
      'intake_method': instance.intake_method,
      'per_daily_intake_ingredient_content':
          instance.per_daily_intake_ingredient_content,
      'ingredients_content': instance.ingredients_content,
      'nutrition_information': instance.nutrition_information,
      'product_features': instance.product_features,
    };

IntakeMethodItem _$IntakeMethodItemFromJson(Map<String, dynamic> json) =>
    IntakeMethodItem(
      json['time'] as String,
      json['detail_time'] as String,
      json['intake_unit'] as String,
    );

Map<String, dynamic> _$IntakeMethodItemToJson(IntakeMethodItem instance) =>
    <String, dynamic>{
      'time': instance.time,
      'detail_time': instance.detail_time,
      'intake_unit': instance.intake_unit,
    };

PerDailyIntakeIngredientContent _$PerDailyIntakeIngredientContentFromJson(
        Map<String, dynamic> json) =>
    PerDailyIntakeIngredientContent(
      json['ingredient_name'] as String,
      json['content'] as String,
    );

Map<String, dynamic> _$PerDailyIntakeIngredientContentToJson(
        PerDailyIntakeIngredientContent instance) =>
    <String, dynamic>{
      'ingredient_name': instance.ingredient_name,
      'content': instance.content,
    };

NutritionInformation _$NutritionInformationFromJson(
        Map<String, dynamic> json) =>
    NutritionInformation(
      json['nutrition_name'] as String,
      json['description'] as String,
    );

Map<String, dynamic> _$NutritionInformationToJson(
        NutritionInformation instance) =>
    <String, dynamic>{
      'nutrition_name': instance.nutrition_name,
      'description': instance.description,
    };
