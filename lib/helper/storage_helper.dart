import 'package:get_storage/get_storage.dart';

class StorageHelper {
  get storage => GetStorage();

  set saveTheme(bool value) => storage.write("islight", value);

  bool? get getTheme => storage.read('islight');
}
