// To parse this JSON data, do
//
//     final landingPageModel = landingPageModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'landing_page_model.g.dart';

LandingPageModel landingPageModelFromJson(String str) => LandingPageModel.fromJson(json.decode(str));

String landingPageModelToJson(LandingPageModel data) => json.encode(data.toJson());

@JsonSerializable()
class LandingPageModel {
  @JsonKey(name: "data")
  List<Datum>? data;

  LandingPageModel({
    this.data,
  });

  LandingPageModel copyWith({
    List<Datum>? data,
  }) =>
      LandingPageModel(
        data: data ?? this.data,
      );

  factory LandingPageModel.fromJson(Map<String, dynamic> json) => _$LandingPageModelFromJson(json);

  Map<String, dynamic> toJson() => _$LandingPageModelToJson(this);
}

@JsonSerializable()
class Datum {
  @JsonKey(name: "section")
  String? section;
  @JsonKey(name: "section_title")
  String? sectionTitle;
  @JsonKey(name: "items")
  List<Item>? items;

  Datum({
    this.section,
    this.sectionTitle,
    this.items,
  });

  Datum copyWith({
    String? section,
    String? sectionTitle,
    List<Item>? items,
  }) =>
      Datum(
        section: section ?? this.section,
        sectionTitle: sectionTitle ?? this.sectionTitle,
        items: items ?? this.items,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}

@JsonSerializable()
class Item {
  @JsonKey(name: "article_title")
  String? articleTitle;
  @JsonKey(name: "article_image")
  String? articleImage;
  @JsonKey(name: "link")
  String? link;
  @JsonKey(name: "product_name")
  String? productName;
  @JsonKey(name: "product_image")
  String? productImage;

  Item({
    this.articleTitle,
    this.articleImage,
    this.link,
    this.productName,
    this.productImage,
  });

  Item copyWith({
    String? articleTitle,
    String? articleImage,
    String? link,
    String? productName,
    String? productImage,
  }) =>
      Item(
        articleTitle: articleTitle ?? this.articleTitle,
        articleImage: articleImage ?? this.articleImage,
        link: link ?? this.link,
        productName: productName ?? this.productName,
        productImage: productImage ?? this.productImage,
      );

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
