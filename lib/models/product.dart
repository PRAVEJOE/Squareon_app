// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    this.result,
    this.data,
  });

  Result result;
  Data data;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    result: Result.fromJson(json["Result"]),
    data: Data.fromJson(json["Data"])
  );

  Map<String, dynamic> toJson() => {
    "Result": result.toJson(),
    "Data": data.toJson(),

  };
}

class Data {
  Data({
    this.treeItems,
    this.customItems,
    this.customToppings,
    this.shapeCakes,
    this.itemTypes,
    this.itemAddons,
    this.standardShapes,
    this.timeSlots,
    this.branches,
    this.deliveryPartners,
    this.seasonsgroup,
    this.boxTypeList,
    this.nonstockableitemList,
    this.homedeliverymanagerList,
  });
  List<TreeItemElement> treeItems;
  List<CustomItem> customItems;
  List<CustomTopping> customToppings;
  List<ShapeCake> shapeCakes;
  List<ItemType> itemTypes;
  List<ItemAddon> itemAddons;
  List<StandardShape> standardShapes;
  List<String> timeSlots;
  List<Branch> branches;
  List<DeliveryPartner> deliveryPartners;
  List<Seasonsgroup> seasonsgroup;
  List<BoxTypeList> boxTypeList;
  List<NonstockableitemList> nonstockableitemList;
  List<dynamic> homedeliverymanagerList;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    treeItems: List<TreeItemElement>.from(json["treeItems"].map((x) => TreeItemElement.fromJson(x))),
    customItems: List<CustomItem>.from(json["customItems"].map((x) => CustomItem.fromJson(x))),
    customToppings: List<CustomTopping>.from(json["customToppings"].map((x) => CustomTopping.fromJson(x))),
    shapeCakes: List<ShapeCake>.from(json["shapeCakes"].map((x) => ShapeCake.fromJson(x))),
    itemTypes: List<ItemType>.from(json["itemTypes"].map((x) => ItemType.fromJson(x))),
    itemAddons: List<ItemAddon>.from(json["itemAddons"].map((x) => ItemAddon.fromJson(x))),
    standardShapes: List<StandardShape>.from(json["StandardShapes"].map((x) => StandardShape.fromJson(x))),
    timeSlots: List<String>.from(json["timeSlots"].map((x) => x)),
    branches: List<Branch>.from(json["branches"].map((x) => Branch.fromJson(x))),
    deliveryPartners: List<DeliveryPartner>.from(json["deliveryPartners"].map((x) => DeliveryPartner.fromJson(x))),
    seasonsgroup: List<Seasonsgroup>.from(json["seasonsgroup"].map((x) => Seasonsgroup.fromJson(x))),
    boxTypeList: List<BoxTypeList>.from(json["boxTypeList"].map((x) => BoxTypeList.fromJson(x))),
    nonstockableitemList: List<NonstockableitemList>.from(json["nonstockableitemList"].map((x) => NonstockableitemList.fromJson(x))),
    homedeliverymanagerList: List<dynamic>.from(json["homedeliverymanagerList"].map((x) => x)),

  );

  Map<String, dynamic> toJson() => {
    "treeItems": List<dynamic>.from(treeItems.map((x) => x.toJson())),
    "customItems": List<dynamic>.from(customItems.map((x) => x.toJson())),
    "customToppings": List<dynamic>.from(customToppings.map((x) => x.toJson())),
    "shapeCakes": List<dynamic>.from(shapeCakes.map((x) => x.toJson())),
    "itemTypes": List<dynamic>.from(itemTypes.map((x) => x.toJson())),
    "itemAddons": List<dynamic>.from(itemAddons.map((x) => x.toJson())),
    "StandardShapes": List<dynamic>.from(standardShapes.map((x) => x.toJson())),
    "timeSlots": List<dynamic>.from(timeSlots.map((x) => x)),
    "branches": List<dynamic>.from(branches.map((x) => x.toJson())),
    "deliveryPartners": List<dynamic>.from(deliveryPartners.map((x) => x.toJson())),
    "seasonsgroup": List<dynamic>.from(seasonsgroup.map((x) => x.toJson())),
    "boxTypeList": List<dynamic>.from(boxTypeList.map((x) => x.toJson())),
    "nonstockableitemList": List<dynamic>.from(nonstockableitemList.map((x) => x.toJson())),
    "homedeliverymanagerList": List<dynamic>.from(homedeliverymanagerList.map((x) => x)),
  };
}

class BoxTypeList {
  BoxTypeList({
    this.boxId,
    this.boxName,
  });

  int boxId;
  String boxName;

  factory BoxTypeList.fromJson(Map<String, dynamic> json) => BoxTypeList(
    boxId: json["boxID"],
    boxName: json["boxName"],
  );

  Map<String, dynamic> toJson() => {
    "boxID": boxId,
    "boxName": boxName,
  };
}

class Branch {
  Branch({
    this.branchId,
    this.branchName,
    this.branchAddress,
    this.branchContactNo,
  });

  String branchId;
  String branchName;
  String branchAddress;
  String branchContactNo;

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
    branchId: json["BranchId"],
    branchName: json["BranchName"],
    branchAddress: json["BranchAddress"],
    branchContactNo: json["BranchContactNo"],
  );

  Map<String, dynamic> toJson() => {
    "BranchId": branchId,
    "BranchName": branchName,
    "BranchAddress": branchAddress,
    "BranchContactNo": branchContactNo,
  };
}

class CustomItem {
  CustomItem({
    this.productId,
    this.productName,
    this.unitPrice,
    this.vat,
    this.st,
    this.weight,
    this.unit,
    this.image,
    this.allowShapes,
    this.isAvailonSale,
    this.icingId,
  });

  String productId;
  String productName;
  double unitPrice;
  double vat;
  double st;
  double weight;
  Unit unit;
  String image;
  bool allowShapes;
  int isAvailonSale;
  String icingId;

  factory CustomItem.fromJson(Map<String, dynamic> json) => CustomItem(
    productId: json["ProductId"],
    productName: json["ProductName"],
    unitPrice: json["UnitPrice"],
    vat: json["VAT"],
    st: json["ST"],
    weight: json["Weight"].toDouble(),
    unit: unitValues.map[json["Unit"]],
    image: json["Image"],
    allowShapes: json["AllowShapes"],
    isAvailonSale: json["isAvailonSale"],
    icingId: json["icingID"],
  );

  Map<String, dynamic> toJson() => {
    "ProductId": productId,
    "ProductName": productName,
    "UnitPrice": unitPrice,
    "VAT": vat,
    "ST": st,
    "Weight": weight,
    "Unit": unitValues.reverse[unit],
    "Image": image,
    "AllowShapes": allowShapes,
    "isAvailonSale": isAvailonSale,
    "icingID": icingId,
  };
}

enum Unit { KG, G, UNIT_G, EMPTY }

final unitValues = EnumValues({
  "": Unit.EMPTY,
  "g": Unit.G,
  "Kg": Unit.KG,
  "g\u000d\n": Unit.UNIT_G
});

class CustomTopping {
  CustomTopping({
    this.productId,
    this.productName,
    this.weight,
    this.unit,
    this.unitPrice,
    this.isDecorative,
  });

  String productId;
  String productName;
  double weight;
  Unit unit;
  double unitPrice;
  bool isDecorative;

  factory CustomTopping.fromJson(Map<String, dynamic> json) => CustomTopping(
    productId: json["ProductId"],
    productName: json["ProductName"],
    weight: json["Weight"],
    unit: unitValues.map[json["Unit"]],
    unitPrice: json["UnitPrice"],
    isDecorative: json["IsDecorative"],
  );

  Map<String, dynamic> toJson() => {
    "ProductId": productId,
    "ProductName": productName,
    "Weight": weight,
    "Unit": unitValues.reverse[unit],
    "UnitPrice": unitPrice,
    "IsDecorative": isDecorative,
  };
}

class DeliveryPartner {
  DeliveryPartner({
    this.deliveryPartnerId,
    this.name,
    this.address,
    this.email,
    this.phone,
    this.mobile,
    this.website,
  });

  int deliveryPartnerId;
  String name;
  String address;
  String email;
  String phone;
  String mobile;
  String website;

  factory DeliveryPartner.fromJson(Map<String, dynamic> json) => DeliveryPartner(
    deliveryPartnerId: json["DeliveryPartnerID"],
    name: json["Name"],
    address: json["Address"],
    email: json["Email"],
    phone: json["Phone"],
    mobile: json["Mobile"],
    website: json["Website"],
  );

  Map<String, dynamic> toJson() => {
    "DeliveryPartnerID": deliveryPartnerId,
    "Name": name,
    "Address": address,
    "Email": email,
    "Phone": phone,
    "Mobile": mobile,
    "Website": website,
  };
}

class ItemAddon {
  ItemAddon({
    this.productId,
    this.productName,
    this.unitPrice,
    this.image,
  });

  String productId;
  String productName;
  double unitPrice;
  String image;

  factory ItemAddon.fromJson(Map<String, dynamic> json) => ItemAddon(
    productId: json["ProductId"],
    productName: json["ProductName"],
    unitPrice: json["UnitPrice"],
    image: json["Image"],
  );

  Map<String, dynamic> toJson() => {
    "ProductId": productId,
    "ProductName": productName,
    "UnitPrice": unitPrice,
    "Image": image,
  };
}

class ItemType {
  ItemType({
    this.itemId,
    this.itemName,
  });

  String itemId;
  String itemName;

  factory ItemType.fromJson(Map<String, dynamic> json) => ItemType(
    itemId: json["ItemId"],
    itemName: json["ItemName"],
  );

  Map<String, dynamic> toJson() => {
    "ItemId": itemId,
    "ItemName": itemName,
  };
}

class NonstockableitemList {
  NonstockableitemList({
    this.itemName,
  });

  String itemName;

  factory NonstockableitemList.fromJson(Map<String, dynamic> json) => NonstockableitemList(
    itemName: json["itemName"],
  );

  Map<String, dynamic> toJson() => {
    "itemName": itemName,
  };
}

class Seasonsgroup {
  Seasonsgroup({
    this.seasonGroupId,
    this.seasonName,
    this.seasonStart,
    this.seasonEnd,
  });

  int seasonGroupId;
  String seasonName;
  String seasonStart;
  String seasonEnd;

  factory Seasonsgroup.fromJson(Map<String, dynamic> json) => Seasonsgroup(
    seasonGroupId: json["SeasonGroupID"],
    seasonName: json["SeasonName"],
    seasonStart: json["SeasonStart"],
    seasonEnd: json["SeasonEnd"],
  );

  Map<String, dynamic> toJson() => {
    "SeasonGroupID": seasonGroupId,
    "SeasonName": seasonName,
    "SeasonStart": seasonStart,
    "SeasonEnd": seasonEnd,
  };
}

class ShapeCake {
  ShapeCake({
    this.customGroupId,
    this.groupOrItemName,
    this.parentId,
    this.type,
    this.image,
    this.description,
    this.isAvailonSale,
    this.actualTempStock,
    this.actualPysicalStock,
    this.thresholdCount,
    this.items,
  });

  int customGroupId;
  String groupOrItemName;
  int parentId;
  Type type;
  String image;
  String description;
  int isAvailonSale;
  int actualTempStock;
  int actualPysicalStock;
  int thresholdCount;
  List<TreeItemElement> items;

  factory ShapeCake.fromJson(Map<String, dynamic> json) => ShapeCake(
    customGroupId: json["CustomGroupID"],
    groupOrItemName: json["GroupOrItemName"],
    parentId: json["ParentID"],
    type: typeValues.map[json["type"]],
    image: json["Image"],
    description: json["Description"],
    isAvailonSale: json["IsAvailonSale"],
    actualTempStock: json["ActualTempStock"],
    actualPysicalStock: json["ActualPysicalStock"],
    thresholdCount: json["ThresholdCount"],
    items: List<TreeItemElement>.from(json["items"].map((x) => TreeItemElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "CustomGroupID": customGroupId,
    "GroupOrItemName": groupOrItemName,
    "ParentID": parentId,
    "type": typeValues.reverse[type],
    "Image": image,
    "Description": description,
    "IsAvailonSale": isAvailonSale,
    "ActualTempStock": actualTempStock,
    "ActualPysicalStock": actualPysicalStock,
    "ThresholdCount": thresholdCount,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class TreeItemElement {
  TreeItemElement({
    this.customGroupId,
    this.groupOrItemName,
    this.parentId,
    this.type,
    this.image,
    this.description,
    this.isAvailonSale,
    this.actualTempStock,
    this.actualPysicalStock,
    this.thresholdCount,
    this.items,
  });

  int customGroupId;
  String groupOrItemName;
  int parentId;
  Type type;
  String image;
  String description;
  int isAvailonSale;
  int actualTempStock;
  int actualPysicalStock;
  int thresholdCount;
  List<TreeItemItem> items;

  factory TreeItemElement.fromJson(Map<String, dynamic> json) => TreeItemElement(
    customGroupId: json["CustomGroupID"],
    groupOrItemName: json["GroupOrItemName"],
    parentId: json["ParentID"],
    type: typeValues.map[json["type"]],
    image: json["Image"],
    description: json["Description"],
    isAvailonSale: json["IsAvailonSale"],
    actualTempStock: json["ActualTempStock"],
    actualPysicalStock: json["ActualPysicalStock"],
    thresholdCount: json["ThresholdCount"],
    items: List<TreeItemItem>.from(json["items"].map((x) => TreeItemItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "CustomGroupID": customGroupId,
    "GroupOrItemName": groupOrItemName,
    "ParentID": parentId,
    "type": typeValues.reverse[type],
    "Image": image,
    "Description": description,
    "IsAvailonSale": isAvailonSale,
    "ActualTempStock": actualTempStock,
    "ActualPysicalStock": actualPysicalStock,
    "ThresholdCount": thresholdCount,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class TreeItemItem {
  TreeItemItem({
    this.customGroupId,
    this.groupOrItemName,
    this.parentId,
    this.type,
    this.productId,
    this.unitPrice,
    this.vat,
    this.st,
    this.image,
    this.categoryId,
    this.weight,
    this.unitOfMeasure,
    this.description,
    this.isAvailonSale,
    this.manufacturer,
    this.actualTempStock,
    this.actualPysicalStock,
    this.thresholdCount,
    this.items,
  });

  int customGroupId;
  String groupOrItemName;
  int parentId;
  Type type;
  String productId;
  double unitPrice;
  double vat;
  double st;
  String image;
  int categoryId;
  double weight;
  Unit unitOfMeasure;
  String description;
  int isAvailonSale;
  Manufacturer manufacturer;
  int actualTempStock;
  int actualPysicalStock;
  int thresholdCount;
  List<dynamic> items;

  factory TreeItemItem.fromJson(Map<String, dynamic> json) => TreeItemItem(
    customGroupId: json["CustomGroupID"],
    groupOrItemName: json["GroupOrItemName"],
    parentId: json["ParentID"],
    type: typeValues.map[json["type"]],
    productId: json["ProductId"] == null ? null : json["ProductId"],
    unitPrice: json["UnitPrice"] == null ? null : json["UnitPrice"],
    vat: json["VAT"] == null ? null : json["VAT"],
    st: json["ST"] == null ? null : json["ST"],
    image: json["Image"],
    categoryId: json["CategoryId"] == null ? null : json["CategoryId"],
    weight: json["Weight"] == null ? null : json["Weight"].toDouble(),
    unitOfMeasure: json["UnitOfMeasure"] == null ? null : unitValues.map[json["UnitOfMeasure"]],
    description: json["Description"],
    isAvailonSale: json["IsAvailonSale"],
    manufacturer: json["Manufacturer"] == null ? null : manufacturerValues.map[json["Manufacturer"]],
    actualTempStock: json["ActualTempStock"],
    actualPysicalStock: json["ActualPysicalStock"],
    thresholdCount: json["ThresholdCount"],
    items: json["items"] == null ? null : List<dynamic>.from(json["items"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "CustomGroupID": customGroupId,
    "GroupOrItemName": groupOrItemName,
    "ParentID": parentId,
    "type": typeValues.reverse[type],
    "ProductId": productId == null ? null : productId,
    "UnitPrice": unitPrice == null ? null : unitPrice,
    "VAT": vat == null ? null : vat,
    "ST": st == null ? null : st,
    "Image": image,
    "CategoryId": categoryId == null ? null : categoryId,
    "Weight": weight == null ? null : weight,
    "UnitOfMeasure": unitOfMeasure == null ? null : unitValues.reverse[unitOfMeasure],
    "Description": description,
    "IsAvailonSale": isAvailonSale,
    "Manufacturer": manufacturer == null ? null : manufacturerValues.reverse[manufacturer],
    "ActualTempStock": actualTempStock,
    "ActualPysicalStock": actualPysicalStock,
    "ThresholdCount": thresholdCount,
    "items": items == null ? null : List<dynamic>.from(items.map((x) => x)),
  };
}

enum Manufacturer { HMB, CF, HMT }

final manufacturerValues = EnumValues({
  "CF": Manufacturer.CF,
  "HMB": Manufacturer.HMB,
  "HMT": Manufacturer.HMT
});

enum Type { SECTION, ITEM }

final typeValues = EnumValues({
  "Item": Type.ITEM,
  "Section": Type.SECTION
});

class StandardShape {
  StandardShape({
    this.shapeId,
    this.shapeName,
  });

  int shapeId;
  String shapeName;

  factory StandardShape.fromJson(Map<String, dynamic> json) => StandardShape(
    shapeId: json["ShapeId"],
    shapeName: json["ShapeName"],
  );

  Map<String, dynamic> toJson() => {
    "ShapeId": shapeId,
    "ShapeName": shapeName,
  };
}

class Result {
  Result({
    this.status,
    this.success,
    this.reason,
  });

  int status;
  bool success;
  String reason;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    status: json["Status"],
    success: json["Success"],
    reason: json["Reason"],
  );

  Map<String, dynamic> toJson() => {
    "Status": status,
    "Success": success,
    "Reason": reason,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
