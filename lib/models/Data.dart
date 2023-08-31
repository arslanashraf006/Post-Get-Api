import 'Products.dart';

class Data {
  Data({
      this.id, 
      this.isActive, 
      this.createdAt, 
      this.name, 
      this.description, 
      this.shopemail, 
      this.shopaddress, 
      this.shopcity, 
      this.userid, 
      this.image, 
      this.v, 
      this.products,});

  Data.fromJson(dynamic json) {
    id = json['_id'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    name = json['name'];
    description = json['description'];
    shopemail = json['shopemail'];
    shopaddress = json['shopaddress'];
    shopcity = json['shopcity'];
    userid = json['userid'];
    image = json['image'];
    v = json['__v'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products.add(Products.fromJson(v));
      });
    }
  }
  String id;
  bool isActive;
  String createdAt;
  String name;
  String description;
  String shopemail;
  String shopaddress;
  String shopcity;
  String userid;
  String image;
  int v;
  List<Products> products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['is_active'] = isActive;
    map['created_at'] = createdAt;
    map['name'] = name;
    map['description'] = description;
    map['shopemail'] = shopemail;
    map['shopaddress'] = shopaddress;
    map['shopcity'] = shopcity;
    map['userid'] = userid;
    map['image'] = image;
    map['__v'] = v;
    if (products != null) {
      map['products'] = products.map((v) => v.toJson()).toList();
    }
    return map;
  }

}