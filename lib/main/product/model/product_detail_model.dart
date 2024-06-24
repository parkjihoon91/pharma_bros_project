
import 'package:json_annotation/json_annotation.dart';
import 'package:pharma_bros_project/common/model/api_default_model.dart';

part 'product_detail_model.g.dart';

@JsonSerializable()
class ProductDetailModel extends ApiDefaultModelBase {
  ProductDetailModelItem data;

  ProductDetailModel(this.data);

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) {
      return _$ProductDetailModelFromJson(json);
    }

  Map<String, dynamic> toJson() => _$ProductDetailModelToJson(this);
}

@JsonSerializable()
class ProductDetailModelItem {
  int id;
  String product_image_url;
  String product_brand_name;
  String product_name;
  bool is_domestic;
  bool is_show_recommend_type;
  String recommend_type_name;
  String recommend_type_name_color;
  String recommend_content;
  bool is_show_purchase_section;
  bool is_sold_out;
  bool is_purchase_available;
  String origin_product_price;
  int discount_product_percent;
  String discount_product_price;
  String product_sales_url;
  String per_daily_intake_count_text;
  String per_times_intake_amount_text;
  List<IntakeMethodItem> intake_method;
  List<PerDailyIntakeIngredientContent> per_daily_intake_ingredient_content;
  String ingredients_content;
  List<NutritionInformation> nutrition_information;
  List<String> product_features;

  ProductDetailModelItem(
      this.id,
      this.product_image_url,
      this.product_brand_name,
      this.product_name,
      this.is_domestic,
      this.is_show_recommend_type,
      this.recommend_type_name,
      this.recommend_type_name_color,
      this.recommend_content,
      this.is_show_purchase_section,
      this.is_sold_out,
      this.is_purchase_available,
      this.origin_product_price,
      this.discount_product_percent,
      this.discount_product_price,
      this.product_sales_url,
      this.per_daily_intake_count_text,
      this.per_times_intake_amount_text,
      this.intake_method,
      this.per_daily_intake_ingredient_content,
      this.ingredients_content,
      this.nutrition_information,
      this.product_features);

  factory ProductDetailModelItem.fromJson(Map<String, dynamic> json) {
      return _$ProductDetailModelItemFromJson(json);
    }

  Map<String, dynamic> toJson() => _$ProductDetailModelItemToJson(this);
}

@JsonSerializable()
class IntakeMethodItem {
  String time;
  String detail_time;
  String intake_unit;

  IntakeMethodItem(this.time, this.detail_time, this.intake_unit);

  factory IntakeMethodItem.fromJson(Map<String, dynamic> json) {
      return _$IntakeMethodItemFromJson(json);
    }

  Map<String, dynamic> toJson() => _$IntakeMethodItemToJson(this);
}

@JsonSerializable()
class PerDailyIntakeIngredientContent {
  String ingredient_name;
  String content;

  PerDailyIntakeIngredientContent(this.ingredient_name, this.content);
  
  factory PerDailyIntakeIngredientContent.fromJson(Map<String, dynamic> json) {
      return _$PerDailyIntakeIngredientContentFromJson(json);
    }
  
  Map<String, dynamic> toJson() => _$PerDailyIntakeIngredientContentToJson(this);
}

@JsonSerializable()
class NutritionInformation {
  String nutrition_name;
  String description;

  NutritionInformation(this.nutrition_name, this.description);
  
  factory NutritionInformation.fromJson(Map<String, dynamic> json) {
      return _$NutritionInformationFromJson(json);
    }
  
  Map<String, dynamic> toJson() => _$NutritionInformationToJson(this);
}