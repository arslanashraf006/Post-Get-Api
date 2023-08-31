import 'Images.dart';

class Products {
  Products({
      this.id, 
      this.onSale, 
      this.salePercent, 
      this.sold, 
      this.sliderNew, 
      this.sliderRecent, 
      this.sliderSold, 
      this.date, 
      this.title, 
      this.categories, 
      this.subcate, 
      this.shop, 
      this.price, 
      this.saleTitle, 
      this.salePrice, 
      this.description, 
      this.colors, 
      this.size, 
      this.images, 
      this.v, 
      this.inWishlist,});

  Products.fromJson(dynamic json) {
    id = json['_id'];
    onSale = json['on_sale'];
    salePercent = json['sale_percent'];
    sold = json['sold'];
    sliderNew = json['slider_new'];
    sliderRecent = json['slider_recent'];
    sliderSold = json['slider_sold'];
    date = json['date'];
    title = json['title'];
    categories = json['categories'];
    subcate = json['subcate'];
    shop = json['shop'];
    price = json['price'];
    saleTitle = json['sale_title'];
    salePrice = json['sale_price'];
    description = json['description'];
    colors = json['colors'];
    size = json['size'];
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images.add(Images.fromJson(v));
      });
    }
    v = json['__v'];
    inWishlist = json['in_wishlist'];
  }
  String id;
  bool onSale;
  int salePercent;
  int sold;
  bool sliderNew;
  bool sliderRecent;
  bool sliderSold;
  String date;
  String title;
  String categories;
  String subcate;
  String shop;
  String price;
  String saleTitle;
  String salePrice;
  String description;
  String colors;
  String size;
  List<Images> images;
  int v;
  bool inWishlist;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['on_sale'] = onSale;
    map['sale_percent'] = salePercent;
    map['sold'] = sold;
    map['slider_new'] = sliderNew;
    map['slider_recent'] = sliderRecent;
    map['slider_sold'] = sliderSold;
    map['date'] = date;
    map['title'] = title;
    map['categories'] = categories;
    map['subcate'] = subcate;
    map['shop'] = shop;
    map['price'] = price;
    map['sale_title'] = saleTitle;
    map['sale_price'] = salePrice;
    map['description'] = description;
    map['colors'] = colors;
    map['size'] = size;
    if (images != null) {
      map['images'] = images.map((v) => v.toJson()).toList();
    }
    map['__v'] = v;
    map['in_wishlist'] = inWishlist;
    return map;
  }

}