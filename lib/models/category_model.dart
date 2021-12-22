// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<CategoryModel> categoryModelFromJson(String str) =>
    List<CategoryModel>.from(
        json.decode(str).map((x) => CategoryModel.fromJson(x)));

String categoryModelToJson(List<CategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryModel {
  CategoryModel({
    required this.status,
    required this.data,
    required this.message,
  });

  String status;
  List<CategoryData> data;
  String message;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        status: json["Status"],
        data: List<CategoryData>.from(json["Data"].map((x) => CategoryData.fromJson(x))),
        message: json["Message"],
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Data": List<dynamic>.from(data.map((x) => x.toJson())),
        "Message": message,
      };
}

class CategoryData {
  CategoryData({
    required this.nItemGrpId,
    required this.cGrpName,
    required this.cGroupImage,
  });

  int nItemGrpId;
  String cGrpName;
  String cGroupImage;

  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
        nItemGrpId: json["nItemGrpId"],
        cGrpName: json["cGrpName"],
        cGroupImage: json["cGroupImage"],
      );

  Map<String, dynamic> toJson() => {
        "nItemGrpId": nItemGrpId,
        "cGrpName": cGrpName,
        "cGroupImage": cGroupImage,
      };
}
