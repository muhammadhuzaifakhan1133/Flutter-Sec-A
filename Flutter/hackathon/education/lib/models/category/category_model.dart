class CategoryModel {
  List<CategoryData>? data;

  CategoryModel({this.data});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CategoryData>[];
      json['data'].forEach((v) {
        data!.add(new CategoryData.fromJson(v));
      });
    }
  }
}

class CategoryData {
  String? categories;

  CategoryData({this.categories});

  CategoryData.fromJson(Map<String, dynamic> json) {
    categories = json['categories'];
  }
}
