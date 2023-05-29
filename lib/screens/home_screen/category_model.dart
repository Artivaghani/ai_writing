class CategoryModel {
  bool? status;
  List<CategoryData>? data;
  int? count;
  String? message;
  String? errors;

  CategoryModel(
      {this.status, this.data, this.count, this.message, this.errors});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <CategoryData>[];
      json['data'].forEach((v) {
        data!.add(CategoryData.fromJson(v));
      });
    }
    count = json['count'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['count'] = count;
    data['message'] = message;

    return data;
  }
}

class CategoryData {
  int? id;
  String? title;
  String? description;
  String? image;
  String? slug;
  int? status;

  CategoryData(
      {this.id,
      this.title,
      this.description,
      this.image,
      this.slug,
      this.status});

  CategoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    slug = json['slug'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
    data['slug'] = slug;
    data['status'] = status;
    return data;
  }
}
