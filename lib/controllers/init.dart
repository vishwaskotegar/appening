import 'package:appening/controllers/user_controller.dart';
import 'package:get/get.dart';

class InitDep extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserController());
  }
}
