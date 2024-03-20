import 'package:get/get.dart';
import 'package:xstore/features/auth/controllers/network/network_manager.dart';
import 'package:xstore/features/shop/controllers/product/variation_controller.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(VariationController());
 
  }
}
