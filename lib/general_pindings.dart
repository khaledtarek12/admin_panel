import 'package:get/get.dart';
import 'package:t_store_web_adimn/features/authentication/controllers/user_controller.dart';
import 'package:t_store_web_adimn/utils/helpers/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    // -- Core
    Get.lazyPut(() => NetworkManager() , fenix: true);
    Get.lazyPut(() => UserController() , fenix: true);
  }
}
