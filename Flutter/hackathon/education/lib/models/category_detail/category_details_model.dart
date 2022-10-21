class CategroyDetailsModel {
  List<CategoryDetailsData>? data;

  CategroyDetailsModel({this.data});

  CategroyDetailsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CategoryDetailsData>[];
      json['data'].forEach((v) {
        data!.add(new CategoryDetailsData.fromJson(v));
      });
    }
  }
}

class CategoryDetailsData {
  int? id;
  String? createdAt;
  Null? updatedAt;
  String? title;
  String? price;
  String? rating;
  String? description;
  String? createdBy;
  String? video;
  String? categories;

  CategoryDetailsData(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.title,
      this.price,
      this.rating,
      this.description,
      this.createdBy,
      this.video,
      this.categories});

  CategoryDetailsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    title = json['title'];
    price = json['price'];
    rating = json['rating'];
    description = json['description'];
    createdBy = json['created_by'];
    video = json['video'];
    categories = json['categories'];
  }
}
