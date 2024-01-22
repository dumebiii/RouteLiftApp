class Product {
  String? image;
  String? productName;
  double? productPrice;
  int? calories;
  int? timeToPrepare;
  double? rating;
  String? description;

  Product(
      {this.image,
      this.productName,
      this.productPrice,
      this.calories,
      this.timeToPrepare,
      this.rating,
      this.description});

  Product.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    productName = json['productName'];
    productPrice = json['productPrice'];
    calories = json['calories'];
    timeToPrepare = json['timeToPrepare'];
    rating = json['rating'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['productName'] = productName;
    data['productPrice'] = productPrice;
    data['calories'] = calories;
    data['timeToPrepare'] = timeToPrepare;
    data['rating'] = rating;
    data['description'] = description;
    return data;
  }
}
