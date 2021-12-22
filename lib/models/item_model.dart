// To parse this JSON data, do
//
//     final itemModel = itemModelFromJson(jsonString);

import 'dart:convert';

List<ItemModel> itemModelFromJson(String str) =>
    List<ItemModel>.from(json.decode(str).map((x) => ItemModel.fromJson(x)));

String itemModelToJson(List<ItemModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemModel {
  ItemModel({
    required this.status,
    required this.data,
    required this.message,
  });

  String status;
  List<ItemData> data;
  String message;

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        status: json["Status"],
        data: List<ItemData>.from(json["Data"].map((x) => ItemData.fromJson(x))),
        message: json["Message"],
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Data": List<dynamic>.from(data.map((x) => x.toJson())),
        "Message": message,
      };
}

class ItemData {
  ItemData({
    this.nItemId,
    this.cItemName,
    this.bCombItem,
    this.cItemShName,
    this.cItemImage,
    this.bSubscription,
    this.nOutletId,
    this.nItemGrpId,
    this.nDefUnit,
    this.nItemClusterId,
    this.nCompanyId,
    this.bActive,
    this.bCancelled,
    this.nMaxOrderQtyPerDay,
    this.nRateWoDisc,
    this.nUnitId,
    this.cUnitName,
    this.nTSort,
    this.nBalanceAmt,
    this.bDiscPerc,
    this.nFreeQty,
    this.bFreeItems,
    this.bApplyDisc,
  });

  int? nItemId;
  String? cItemName;
  int? bCombItem;
  String? cItemShName;
  String? cItemImage;
  bool? bSubscription;
  int? nOutletId;
  int? nItemGrpId;
  int? nDefUnit;
  int? nItemClusterId;
  int? nCompanyId;
  bool? bActive;
  bool? bCancelled;
  int? nMaxOrderQtyPerDay;
  int? nRateWoDisc;
  int? nUnitId;
  String? cUnitName;
  int? nTSort;
  int? nBalanceAmt;
  int? bDiscPerc;
  int? nFreeQty;
  bool? bFreeItems;
  bool? bApplyDisc;

  factory ItemData.fromJson(Map<String, dynamic> json) => ItemData(
        nItemId: json["nItemId"],
        cItemName: json["cItemName"],
        bCombItem: json["bCombItem"],
        cItemShName: json["cItemShName"],
        cItemImage: json["cItemImage"],
        bSubscription: json["bSubscription"],
        nOutletId: json["nOutletId"],
        nItemGrpId: json["nItemGrpId"],
        nDefUnit: json["nDefUnit"],
        nItemClusterId: json["nItemClusterId"],
        nCompanyId: json["nCompanyId"],
        bActive: json["bActive"],
        bCancelled: json["bCancelled"],
        nMaxOrderQtyPerDay: json["nMaxOrderQtyPerDay"],
        nRateWoDisc: json["nRate_WODisc"],
        nUnitId: json["nUnitId"],
        cUnitName: json["cUnitName"],
        nTSort: json["nTSort"],
        nBalanceAmt: json["nBalanceAmt"],
        bDiscPerc: json["bDiscPerc"],
        nFreeQty: json["nFreeQty"],
        bFreeItems: json["bFreeItems"],
        bApplyDisc: json["bApplyDisc"],
      );

  Map<String, dynamic> toJson() => {
        "nItemId": nItemId,
        "cItemName": cItemName,
        "bCombItem": bCombItem,
        "cItemShName": cItemShName,
        "cItemImage": cItemImage,
        "bSubscription": bSubscription,
        "nOutletId": nOutletId,
        "nItemGrpId": nItemGrpId,
        "nDefUnit": nDefUnit,
        "nItemClusterId": nItemClusterId,
        "nCompanyId": nCompanyId,
        "bActive": bActive,
        "bCancelled": bCancelled,
        "nMaxOrderQtyPerDay": nMaxOrderQtyPerDay,
        "nRate_WODisc": nRateWoDisc,
        "nUnitId": nUnitId,
        "cUnitName": cUnitName,
        "nTSort": nTSort,
        "nBalanceAmt": nBalanceAmt,
        "bDiscPerc": bDiscPerc,
        "nFreeQty": nFreeQty,
        "bFreeItems": bFreeItems,
        "bApplyDisc": bApplyDisc,
      };
}
