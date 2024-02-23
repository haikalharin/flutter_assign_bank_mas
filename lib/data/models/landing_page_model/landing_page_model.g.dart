// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'landing_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LandingPageModel _$LandingPageModelFromJson(Map<String, dynamic> json) =>
    LandingPageModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LandingPageModelToJson(LandingPageModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      section: json['section'] as String?,
      sectionTitle: json['section_title'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'section': instance.section,
      'section_title': instance.sectionTitle,
      'items': instance.items,
    };

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      articleTitle: json['article_title'] as String?,
      articleImage: json['article_image'] as String?,
      link: json['link'] as String?,
      productName: json['product_name'] as String?,
      productImage: json['product_image'] as String?,
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'article_title': instance.articleTitle,
      'article_image': instance.articleImage,
      'link': instance.link,
      'product_name': instance.productName,
      'product_image': instance.productImage,
    };
