import 'package:get/get.dart';
import 'package:xstore/features/auth/controllers/network/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(NetworkManager());
  }
}
