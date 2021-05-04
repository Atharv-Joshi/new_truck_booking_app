import 'dart:convert';

LoadDataModel cardsModalFromJson(String str) =>
    LoadDataModel.fromJson(json.decode(str));


class LoadDataModel {
  String id;
  dynamic ownerId;
  String loadingPoint;
  String unloadingPoint;
  String productType;
  String truckType;
  String noOfTrucks;
  String weight;
  String comment;
  String status;

  LoadDataModel({
    this.id,
    this.ownerId,
    this.loadingPoint,
    this.unloadingPoint,
    this.productType,
    this.truckType,
    this.noOfTrucks,
    this.weight,
    this.comment,
    this.status,
  });

  factory LoadDataModel.fromJson(Map<String, dynamic> json) => LoadDataModel(
        id: json["id"],
        ownerId: json["ownerId"],
        loadingPoint: json["loadingPoint"],
        unloadingPoint: json["unloadingPoint"],
        productType: json["productType"],
        truckType: json["truckType"],
        noOfTrucks: json["noOfTrucks"],
        weight: json["weight"],
        comment: json["comment"],
        status: json["status"],
      );


}
