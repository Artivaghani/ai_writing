class CategoryList {
  String? name;
  String? id;

  CategoryList({this.name, this.id});
}

class PromptList {
  String? id;
  String? catId;
  String? title;
  String? subTitle;
  PromptList({this.id, this.catId, this.title, this.subTitle});
}
