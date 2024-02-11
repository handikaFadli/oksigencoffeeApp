class Product {
  final String productName;
  final String productDesc;
  final double productPrice;
  final String imgPath;

  Product({
    required this.productName,
    required this.productDesc,
    required this.productPrice,
    required this.imgPath,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productName: json['product_name'],
      productDesc: json['product_desc'],
      productPrice: json['product_price'],
      imgPath:
          'https://oxigenapi-582117d502c0.herokuapp.com/assets-admin/media/menus/' +
              json['product_image'],
    );
  }
}
