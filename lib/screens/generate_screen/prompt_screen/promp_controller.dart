import 'package:ai_writing/screens/generate_screen/prompt_screen/prompt_model.dart';
import 'package:ai_writing/utils/config_packages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PrompController extends GetxController {
  bool isloading = true;
  List<CategoryList> categoryList = <CategoryList>[];
  List<PromptList> promptList = <PromptList>[];
  List<PromptList> copyPromptList = <PromptList>[];
  int selectedTab = 0;

  void getData(String slug) {
    categoryList = [];
    promptList = [];
    copyPromptList = [];
    FirebaseFirestore.instance
        .collection(slug == Slug.email
            ? FirebaseParam.pCategory
            : FirebaseParam.proposalCategory)
        .get()
        .then((value) {
      for (var element in value.docs) {
        categoryList
            .add(CategoryList(name: element.data()['name'], id: element.id));
      }
      categoryList.sort(((a, b) => a.name!.compareTo(b.name ?? '')));
      FirebaseFirestore.instance
          .collection(slug == Slug.email
              ? FirebaseParam.prompts
              : FirebaseParam.proposalPrompts)
          .get()
          .then((promtsValue) {
        for (var element in promtsValue.docs) {
          copyPromptList.add(PromptList(
              title: element.data()['title'],
              subTitle: element.data()['subTitle'],
              id: element.id,
              catId: element.data()['cat_id']));
        }
        searchPrompt();
        isloading = false;
        update();
      }).onError((error, stackTrace) {
        isloading = false;
        update();
      });
    }).onError((error, stackTrace) {
      isloading = false;
      update();
    });
  }

  searchPrompt() {
    promptList = copyPromptList
        .where((element) =>
            element.catId.toString() == categoryList[selectedTab].id)
        .toList();
    update();
  }
}
