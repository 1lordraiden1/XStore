import 'package:get_storage/get_storage.dart';

class XLocalStorage {
  //static final XLocalStorage _instance = XLocalStorage._internal();

  late final GetStorage _storage;

  static XLocalStorage? _instance;

   XLocalStorage._internal();

  factory XLocalStorage.instance() {
    _instance ??= XLocalStorage._internal();
    return _instance!;
  }

  static Future<void> init(String bucketName) async{
    await GetStorage.init(bucketName);
    _instance = XLocalStorage._internal();
    _instance!._storage = GetStorage(bucketName);
  }



  

  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  T? readData<T>(String key) {
    return _storage.read<T>(key);
  }

  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  Future<void> clearAll(String key) async {
    await _storage.erase();
  }
}
