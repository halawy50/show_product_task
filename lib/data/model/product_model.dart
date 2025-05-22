class ProductModel {
  String productId;
  String title;
  String defuiltImage;
  String mark;
  String sku;
  String describe;
  String fkCategory;
  double price;
  bool   isDiscount;
  int percentageDiscount;
  double rate;
  String nameCategory;

  ProductModel({
    required this.productId,
    required this.title,
    required this.defuiltImage,
    required this.mark,
    required this.sku,
    required this.describe,
    required this.fkCategory,
    required this.price,
    required this.isDiscount,
    required this.percentageDiscount,
    required this.rate,
    required this.nameCategory,
  });
}
