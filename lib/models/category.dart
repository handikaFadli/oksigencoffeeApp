class CategoryData {
  final String name;
  final String image;

  CategoryData({required this.name, required this.image});

  factory CategoryData.fromJson(Map<String, dynamic> json) {
    return CategoryData(
      name: json['category_name'],
      image:
          'https://oxigenapi-582117d502c0.herokuapp.com/assets-admin/media/menus/' +
              json['category_image'],
    );
  }
}
